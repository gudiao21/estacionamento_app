class VehiclesController < ApplicationController
    def entrada
        @vehicle = ::Vehicle.new #'@vehicle' é usada no 'app/views/vehicles/entrada.html.erb'
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)

        if @vehicle.save
            flash[:notice] = "Entrada cadastrada com sucesso"
            redirect_to welcome_path
        else
            render :saida
        end
    end

    def edit_by_placa
        #render 'edit_by_placa_vehicle'
        @vehicle = Vehicle.find_by(placa: params[:placa])
        debugger

        if @vehicle
            render 'edit_by_placa_vehicle'
        else
            flash[:error] = 'Veículo não encontrado.'
            redirect_to welcome_path
        end
    end

    def update
        @vehicle = Vehicle.find_by(placa: params[:placa])
        if @vehicle.update(vehicle_params)
            flash[:notice] = 'Registro do veículo atualizado com sucesso.'
            redirect_to welcome_path
        else
            render :edit_by_placa_vehicle
        end
    end

    def search
        @vehicle = Vehicle.find_by(placa: params[:search])
    end

    def destroy
        @vehicle = Vehicle.find_by(placa: params[:placa])
            if @vehicle
                if @vehicle.destroy
                    flash[:notice] = 'Regitro de veículo excluído com sucesso.'
                    #redirect_to delete_form_path
                else
                    flash[:error] = 'Erro ao excluir o registro do veículo.'
                    #redirect_to delete_form_path(placa: params[:placa])
                end
            else
                flash[:error] = 'Veículo não encontrado.'
                #redirect_to delete_form_path
            end
            redirect_to welcome_path
    end

    def redirecionar
        render 'delete' #Aqui 'delete' se refere ao template "delete.html.erb".
    end

    def redirecionar_edit
        #render 'edit_by_placa'
        #debugger
        redirect_to edit_form_path
    end    
    
    def procurar_deletar
        @vehicle = Vehicle.find_by(placa: params[:placa])
        if @vehicle
        #debugger
            render 'delete'
        #redirect_to delete_vehicle_path(placa: params[:placa]) if @vehicle
        else
            flash[:error] = 'Veículo não encontrado.'
            render 'delete'
        end
    end

    def show
        @vehicle = Vehicle.find(params[:id])
    end
    
    #  def destroy
    #      @vehicle = Vehicle.find_by(placa: params[:placa])
      
    #      if @vehicle
    #        if @vehicle.destroy
    #          flash[:notice] = 'Registro de veículo excluído com sucesso.'
    #          #redirect_to delete_vehicle_path
    #        else
    #          flash[:error] = 'Erro ao excluir o registro de veículo.'
    #          #redirect_to delete_vehicle_path(placa: @vehicle.placa)
    #        end
    #        else
    #        flash[:error] = 'Veículo não encontrado.'
    #        #redirect_to delete_vehicle_path
    #      end
    #     render 'delete' #'delete se refere à 'app/views/vehicles/delete.html.erb'
    # end
      
    private

    def vehicle_params
        params.require(:vehicle).permit(:placa, :nome_veiculo, :dono_do_veiculo, :hora_entrada, :hora_saida, :total_a_pagar_por_veiculo, :subtotal)
    end
end