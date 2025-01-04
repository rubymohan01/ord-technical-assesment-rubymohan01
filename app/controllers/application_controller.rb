class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected

  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
    when :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_dashboard_path
    else
      root_path
    end
  end
end
