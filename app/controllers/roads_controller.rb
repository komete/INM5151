require 'georuby'
require 'geo_ruby/shp'
require 'geo_ruby/shp4r/shp'

include GeoRuby::Shp4r
include GeoRuby::SimpleFeatures

class RoadsController < ApplicationController
  all_application_helpers

  before_action :logged_user, only: [:edit, :update, :show]
  before_action :logged_admin, only: [:new, :create, :destroy]

  def show

  end

  def new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
