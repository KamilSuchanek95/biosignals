class HomeController < ApplicationController
    before_action :authenticate_user!, :expect => [:index]

    def index
        # home root page.
    end

    def profile
        @measurements = current_user.measurements.all
        unless params[:plot_measurement_id]
            @measurement = current_user.measurements.first
            params[:plot_measurement_id] = @measurement.id
        else
            @measurement = Measurement.find(params[:plot_measurement_id])
            # redirect_back(fallback_location: root_path)
        end        
    end

    def destroy
        @measurement = Measurement.find(params[:measurement_id])
        @measurement.destroy
        redirect_to home_profile_path(:plot_measurement_id => params[:plot_measurement_id])
    end
end
