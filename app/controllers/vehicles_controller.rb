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

    def edit_by_placa
        @vehicle = Vehicle.find(params[:placa])
    end  

    def search
        @vehicle = Vehicle.find_by(placa: params[:search])
        puts @vehicle.inspect
    end

    def delete
        @vehicle = Vehicle.find_by(placa: params[:search])
            if @vehicle
                render 'delete', locals: { vehicle: @vehicle }
            else
                redirect_to delete_vehicle_path, alert: "Veículo não encontrado."
            end
        #render 'delete'
    end

    def procurar_deletar
        @vehicle = Vehicle.find_by(placa: params[:placa])
        #debugger
        #render 'delete'
        redirect_to delete_vehicle_path(placa: params[:placa]) if @vehicle
    end

    def show
        @vehicle = Vehicle.find(params[:id])
    end
    
    def destroy
        @vehicle = Vehicle.find_by(placa: params[:placa])
      
        if @vehicle
          if @vehicle.destroy
            flash[:notice] = 'Registro de veículo excluído com sucesso.'
            #redirect_to delete_vehicle_path
          else
            flash[:error] = 'Erro ao excluir o registro de veículo.'
            #redirect_to delete_vehicle_path(placa: @vehicle.placa)
          end
        else
          flash[:error] = 'Veículo não encontrado.'
          #redirect_to delete_vehicle_path
        end
        redirect_to procurar_deletar_path
        #render 'delete' #'delete se refere à 'app/views/vehicles/delete.html.erb'
    end
      
    private

    def vehicle_params
        params.require(:vehicle).permit(:placa, :nome_veiculo, :dono_do_veiculo, :hora_entrada, :hora_saida, :total_a_pagar_por_veiculo, :subtotal)
    end
end