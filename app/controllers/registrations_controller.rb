class RegistrationsController < Devise::RegistrationsController
  
  def create
    build_resource

    if resource.save
      sign_in_and_redirect(resource_name, resource)
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end
    
  protected

  def after_sign_in_path_for(resource)
    if resource.role? :admin
      admins_path
    else
      root_path
    end
  end
end
