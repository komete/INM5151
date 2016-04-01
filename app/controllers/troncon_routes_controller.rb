require 'georuby'
require 'geo_ruby/shp'
require 'geo_ruby/shp4r/shp'

include GeoRuby::Shp4r
include GeoRuby::SimpleFeatures

class TronconRoutesController < ApplicationController
  all_application_helpers

  before_action :logged_user, only: [:show]
  before_action :set_troncon_route, only: [:show]

  def select

  end

  def import
    #@shpfile = "/home/remi/shapes/" + params[:file]
    @shpfile = "/Users/remiguillaume/Downloads/" + params[:file]

    ShpFile.open(@shpfile) do |shp|
      shp.each do |shape|
        shp.fields.each do |field|
          donnees = shape.data[field.name]
          if donnees.is_a? String
            params_import[field.name.downcase] = Iconv.conv('UTF-8', 'iso8859-1', donnees)
          else
            params_import[field.name.downcase] = donnees
          end
        end
        @troncon_route = TronconRoute.new(params_import)
        @troncon_route.save
      end
    end
    flash[:success] = "Données importées avec succès"
    redirect_to troncon_routes_path
  end

  def index
    @troncon_routes = TronconRoute.all
  end

  def show
  end



  :private

  def set_troncon_route
    @troncon_route = TronconRoute.find(params[:id])
  end

  def troncon_route_params
    params.require(:troncon_route).permit(:vocation, :nb_chausse, :nb_voies, :etat, :acces, :res_vert, :sens, :res_europe, :num_route, :class_adm, :longueur)
  end
end
