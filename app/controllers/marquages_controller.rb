class MarquagesController < ApplicationController
  all_application_helpers

  before_action :logged_user, only: [:show]
  before_action :set_marquage, only: [:show]

  def index
    @marquages_lineaires = MarquageLineaire.all
    @marquages_specialises = MarquageSpecialise.all
  end

  def show

  end

  def new
    @id = params[:id]
    @marquage = Marquage.new
  end

  def create
    #flash[:info] = marquage_params[:type_marquage]
    type = marquage_params[:type_marquage]
    if type.equal? "specialises"
      flash[:success] = "Marquage créé"
      #@marquage = MarquageSpecialise.create(marquage_params)
    else
      #flash[:success] = "Marquage créé"
      #@marquage = MarquageLineaire.create(marquage_params)
    end
    redirect_to marquages_path
  end

  :private

  def set_marquage
    @marquage = Marquage.find(params[:id])
  end

  def marquage_params
    params.require(:marquage).permit(:type_marquage, :couleur, :work_id)
  end
end
