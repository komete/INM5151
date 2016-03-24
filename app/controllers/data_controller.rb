require 'georuby'
require 'geo_ruby/shp'
require 'geo_ruby/shp4r/shp'

include GeoRuby::Shp4r
include GeoRuby::SimpleFeatures
class DataController < ApplicationController
  all_application_helpers

  before_action :logged_admin, only: [:select, :import]

  def select
  end

  def import
    @shpfile = "/Users/remiguillaume/Downloads/" + params[:file]
    ShpFile.open(@shpfile) do |shp|
      shp.each do |shape|
        geom = shape.geometry #a GeoRuby SimpleFeature
        puts geom
        att_data = shape.data #a Hash
        shp.fields.each do |field|
          puts att_data[field.name]
        end
      end
    end
  end
end
