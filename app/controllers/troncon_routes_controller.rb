require 'georuby'
require 'geo_ruby/shp'
require 'geo_ruby/shp4r/shp'

include GeoRuby::Shp4r
include GeoRuby::SimpleFeatures

class TronconRoutesController < ApplicationController
  all_application_helpers

  before_action :logged_user, only: [:edit, :update, :show]
  before_action :logged_admin, only: [:new, :create, :destroy]
  before_action :set_troncon_route, only: [:show, :edit, :update, :destroy]

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

  def new
    @troncon_route = TronconRoute.new
  end

  def edit
  end

  def create
    @troncon_route = TronconRoute.new(troncon_route_params)

    respond_to do |format|
      if @troncon_route.save
        format.html { redirect_to @troncon_route, notice: 'Troncon route was successfully created.' }
        format.json { render :show, status: :created, location: @troncon_route }
      else
        format.html { render :new }
        format.json { render json: @troncon_route.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @troncon_route.update(troncon_route_params)
        format.html { redirect_to @troncon_route, notice: 'Troncon route was successfully updated.' }
        format.json { render :show, status: :ok, location: @troncon_route }
      else
        format.html { render :edit }
        format.json { render json: @troncon_route.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @troncon_route.destroy
    respond_to do |format|
      format.html { redirect_to troncon_routes_url, notice: 'Troncon route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  :private

  def set_troncon_route
    @troncon_route = TronconRoute.find(params[:id])
  end

  def troncon_route_params
    params.require(:troncon_route).permit(:vocation, :nb_chausse, :nb_voies, :etat, :acces, :res_vert, :sens, :res_europe, :num_route, :class_adm, :longueur)
  end
end
