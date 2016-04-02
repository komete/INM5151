class MarquageLineairesController < ApplicationController
  all_application_helpers

  before_action :logged_user, only: [:show]
  before_action :set_marquage, only: [:show]

  def show
  end

  :private

  def set_marquage
    @marquage = MarquageLineaire.find(params[:id])
  end
end
