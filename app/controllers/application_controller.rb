class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin!, except: [:current, :mobile_view]
  layout "admin"

  private

  def after_sign_out_path_for(resource_or_scope)
    weeks_path
  end

end
