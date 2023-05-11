class VehiclesController < ApplicationController
    def new 
        @vehicle = ::Vehicle.new #'@vehicle' é usada no 'app/views/vehicles/new.html.erb'
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)

        if @vehicle.save
            flash[:notice] = "Entrada cadastrada com sucesso"
            redirect_to welcome_path
        else
            render :new
        end
    end

    def search
        @vehicle = Vehicle.find_by(placa: params[:search])
        puts @vehicle.inspect
    end

    def show
        @vehicle = Vehicle.find(params[:id])

    private

    def vehicle_params
        params.require(:vehicle).permit(:placa, :nome_veiculo, :dono_do_veiculo, :hora_entrada, :hora_saida, :total_a_pagar_por_veiculo, :subtotal)
    end

    def delete
        placa = params[:placa]
        @vehicle = Vehicle.find_by(placa: placa)
    end
    
    def destroy
        @vehicle = Vehicle.find(params[:id])
        if @vehicle.destroy
            flash[:notice] = 'Registro de veículo excluido com sucesso.'
            redirect_to delete_vehicle_path
        else
            flash[:error] = 'Erro ao excluir o registro de veículo.'
            redirect_to delete_vehicle_path(placa: @vehicle.placa)
        end
    end   

end
