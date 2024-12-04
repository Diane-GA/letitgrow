class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # app/controllers/application_controller.rb
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def after_sign_in_path_for(_resource)
    root_path
  end
end
