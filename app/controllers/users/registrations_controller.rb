class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  after_action :update_coordinates, only: [:create, :update]

  protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :city, :address])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :city, :address])
    end

    # Get latitude & longitude from user city & address, then update user coordinate value
    def update_coordinates
      if !current_user.nil?
        geo_result = Geocoder.search(current_user.address + ', ' + current_user.city)
        if !geo_result.empty?
          mfactory = RGeo::ActiveRecord::SpatialFactoryStore.instance.factory(:geo_type => 'point')
          current_user.update(coordinates: mfactory.point(geo_result.first.coordinates[1], geo_result.first.coordinates[0]))
        end
      end
    end
end
