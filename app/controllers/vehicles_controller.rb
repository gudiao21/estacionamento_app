class VehiclesController < ApplicationController
    def new 
        @vehicle = ::Vehicle.new
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)

        if @vehicle.save
            redirect_to wlcome_path, notice: 'Veículo cadastrado com sucesso!'
        else
            render :new

            
        else
            
        end
end