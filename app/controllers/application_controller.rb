class ApplicationController < ActionController::Base

  before_action  :authenticate_user!

  def authorize_only_admin!
    redirect_to root_path, notice: 'Non autorisé!' unless current_user.type == "Admin" || current_user.type == "Superadmin"
  end
end
