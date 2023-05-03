class VehiclesController < ApplicationController
    def new 
        @vehicle = ::Vehicle.new
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)

        if @vehicle.save
            redirect_to welcome_path, notice: 'Veículo cadastrado com sucesso!'
        else
            render :new
        end
    end

    def search
        @vehicle = Vehicle.find_by(placa: params[:search])
        if @vehicle
        #Fazer o que for necessário caso o veículo seja encontrado
            render 'vehicles/search'
        else
            redirect_to welcome_path, alert: 'Veículo não encontrado!'
        end
    end

    private

    def vehicle_params
        params.require(:vehicle).permit(:placa, :nome_veiculo, :dono_do_veiculo, :hora_entrada)
    end
end