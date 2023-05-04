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
        puts @vehicle.inspect
    end

    private

    def vehicle_params
        params.require(:vehicle).permit(:placa, :nome_veiculo, :dono_do_veiculo, :hora_entrada, :hora_saida, :total_a_pagar_por_veiculo, :subtotal)
    end
end