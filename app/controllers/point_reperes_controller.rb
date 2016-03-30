class PointReperesController < ApplicationController
  geocoded_by :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  all_application_helpers

  before_action :logged_user, only: [:edit, :update, :show]
  before_action :logged_admin, only: [:new, :create, :destroy]
  before_action :set_point_repere, only: [:show, :edit, :update, :destroy]

  # GET /point_reperes
  # GET /point_reperes.json
  def index
    @point_reperes = PointRepere.all
  end

  # GET /point_reperes/1
  # GET /point_reperes/1.json
  def show
  end

  # GET /point_reperes/new
  def new
    @point_repere = PointRepere.new
  end

  # GET /point_reperes/1/edit
  def edit
  end

  # POST /point_reperes
  # POST /point_reperes.json
  def create
    @point_repere = PointRepere.new(point_repere_params)

    respond_to do |format|
      if @point_repere.save
        format.html { redirect_to @point_repere, notice: 'Point repere was successfully created.' }
        format.json { render :show, status: :created, location: @point_repere }
      else
        format.html { render :new }
        format.json { render json: @point_repere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_reperes/1
  # PATCH/PUT /point_reperes/1.json
  def update
    respond_to do |format|
      if @point_repere.update(point_repere_params)
        format.html { redirect_to @point_repere, notice: 'Point repere was successfully updated.' }
        format.json { render :show, status: :ok, location: @point_repere }
      else
        format.html { render :edit }
        format.json { render json: @point_repere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_reperes/1
  # DELETE /point_reperes/1.json
  def destroy
    @point_repere.destroy
    respond_to do |format|
      format.html { redirect_to point_reperes_url, notice: 'Point repere was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  :private

    def set_point_repere
      @point_repere = PointRepere.find(params[:id])
    end

    def point_repere_params
      params.require(:point_repere).permit(:latitude, :longitude, :projection)
    end
end
