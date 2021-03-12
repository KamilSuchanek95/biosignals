class HomeController < ApplicationController
    def index
    end

    def profile
        @measurements = current_user.measurements.all
    end
end
