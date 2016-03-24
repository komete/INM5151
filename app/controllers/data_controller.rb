require 'georuby'
require 'geo_ruby/shp'
require 'geo_ruby/shp4r/shp'
require 'iconv'

include GeoRuby::Shp4r
include GeoRuby::SimpleFeatures
class DataController < ApplicationController
  all_application_helpers

  before_action :logged_admin, only: [:select, :import]

  def select
  end

  def import
    @shpfile = "/Users/remiguillaume/Downloads/" + params[:file]
    shape_name = params[:file]
    shape_name =~ /.*\.shp/
    table_name = $1.downcase

    begin
      ActiveRecord::Schema.drop_table(table_name)
    rescue
    end
    ActiveRecord::Schema.create_table(table_name,:options => options){}

    ShpFile.open(@shpfile) do |shp|
      sh.fields.each do |field|
        ActiveRecord::Schema.add_column(table_name, field.name.downcase, shp_field_type(field.type))
      end
      ActiveRecord::Schema.add_column(table_name,"the_geom",shp_geom_type(shp.shp_type),:null => false)
      ActiveRecord::Schema.add_index(table_name,"the_geom",:spatial => true)

      dataTable = Class.new(ActiveRecord::Base) do
        set_table_name table_name
      end
      shp.each do |shape|
        shape_table_record = dataTable.new
        shp.fields.each do |field|
          shape_table_record[field.name.downcase] = Iconv.conv("UTF8", "LATIN1", shape.data[field.name])
        end
        shape_table_record.the_geom = shape.geometry
        shape_table_record.save
      end
    end
  end
end
