class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_admin, :set_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %I[username full_name role])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %I[username full_name role])
  end

  def set_admin
    return create_adminuser unless User.find_by(username: "admin")
  end

  def set_user
    return create_user unless User.find_by(username: "user")
  end

  private

  def create_adminuser
    case Rails.env
    when "development"
      User.create!(username: "admin", full_name: "admin", password: "123456", role: :admin)
    when "production"
      User.create(username: "admin", full_name: "admin", password: "123456", role: :admin)
    end
  end

  def create_user
    case Rails.env
    when "development"
      User.create!(username: "user", full_name: "user", password: "123456", role: :user)
    when "production"
      User.create(username: "user", full_name: "user", password: "123456", role: :user)
    end
  end
end
