class PagesController < ApplicationController
  before_action :logged_user, only: [:cartes, :offres,]
  def acceuil

  end
  def cartes

  end
  def offres

  end
  def recherches

  end

  def logged_user
    user = current_user
    unless logged_in? && user.poste != '1'
      flash[:danger] = "Vous n'avez pas l'authorisation d'être sur cette page !"
      redirect_to login_path
    end
  end
end
