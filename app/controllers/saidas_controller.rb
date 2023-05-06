class SaidasController < ApplicationController
    def new
        @vehicle = ::Vehicle.new
    end
    
    def create
        @vehicle = Vehicle.find_by(placa: params[:placa])
        if @vehicle.update(hora_saida: params[:hora_saida])
            redirect_to welcome_path, notice: 'Saída do veículo cadastrada com sucesso!'
        else
            render :new
        end
    end
end