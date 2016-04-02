class MarquagesController < ApplicationController
  def new
    @id = params[:id]
    @marquage = Marquage.new
  end
  def create
    if params[:type_marquage] == 'specialises'
      @marquage = MarquageSpecialise.create(marquage_params)
    else
      @marquage = MarquageLineaire.create(marquage_params)
    end
  end

  :private
  def set_marquage
    @work = Marquage.find(params[:id])
  end

  def marquage_params
    params.require(:work).permit(:type_marquage, :couleur)
  end
end
