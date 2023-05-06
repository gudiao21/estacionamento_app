class SaidasController < ApplicationController
    def new
        @vehicle = ::Vehicle.new
    end
    
    def create
        @vehicle = Vehicle.find_by(placa: params[:placa])
        @vehicle.hora_saida = params[:hora_saida]
        
        if @vehicle.save
            redirect_to welcome_path, notice: 'Saída do veículo cadastrada com sucesso!'
        else
            render :new
        end
    end
end