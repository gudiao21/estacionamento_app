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
        #debugger
        if @vehicle.update(vehicle_params)
            flash[:success] = "Veículo atualizado com sucesso"
            redirect_to welcome_path
        else
            render 'edit'
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

    def search_edit_vehicle
        render 'search_edit_vehicle'
    end

    def redirecionar
        render 'delete' #Aqui 'delete' se refere ao template "delete.html.erb".
    end

    def redirecionar_edit_form
        render 'edit'
    end    
    
    def procurar_deletar
        @vehicle = Vehicle.find_by(placa: params[:placa])
        if @vehicle
        #debugger
            render 'delete'
        else
            flash[:error] = 'Veículo não encontrado.'
            render 'delete'
        end
    end

    def show
        @vehicle = Vehicle.find(params[:id])
    end
    
    def find_vehicle
        @vehicle = Vehicle.find_by(placa: params[:placa])
        #debugger
            if @vehicle
                render 'edit' #Renderiza 'edit.html.erb'.
            else
                flash[:error] = "Veículo não encontrado"
                redirect_to search_edit_vehicle_path #Redireciona de volta para 'search_edit_vehicle', que é a tela inicial de busca, porque, por algum erro, o processo de edição tem que começar tudo novamente.
            end
    end

    # def edit
    #     #debugger
    #     @vehicle = Vehicle.find_by(placa: params[:placa])
    #     if @vehicle
    #         redirect_to edit_form_path(@ve
    def report
        @vehicle = Vehicle.all
        render 'report'
    end
      
    private

    def vehicle_params
        params.require(:vehicle).permit(:placa, :nome_veiculo, :dono_do_veiculo, :hora_entrada, :hora_saida, :total_a_pagar_por_veiculo, :subtotal)
    end
end
#Teste2224