require 'georuby'
require 'geo_ruby/shp'
require 'geo_ruby/shp4r/shp'

include GeoRuby::Shp4r
include GeoRuby::SimpleFeatures

class PagesController < ApplicationController
  before_action :logged_user, only: [:cartes, :offres, :dashboard]
  before_action :logged_admin, only: [:dashboard]
  def acceuil

  end
  def cartes
    shpfile = "/Users/remiguillaume/Downloads/TRONCON_ROUTE.shp"
    ShpFile.open(shpfile) do |shp|
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
  def offres

  end
  def recherches

  end

  def dashboard

  end

  def logged_user
    user = current_user
    unless logged_in? && (user.poste != '1' || user.administrateur)
      flash[:danger] = "Vous n'avez pas l'authorisation d'être sur cette page !"
      redirect_to login_path
    end
  end

  def logged_admin
    user = current_user
    unless logged_in? && user.administrateur
      flash[:danger] = "Vous n'avez pas l'authorisation d'être sur cette page !"
      redirect_to root_path
    end
  end
end
