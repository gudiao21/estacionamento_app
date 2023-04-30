class EntradaController < ApplicationController
    def entrada
        @entrada = Entrada.new
    end

    def create
        @entrada = Entrada.new(vehicle_params)
        if @entrada.save
            redirect_to root_path, notice: "Entrada de veículo cadastrada com sucesso."
        else
            render :entrada
        end
    end
end