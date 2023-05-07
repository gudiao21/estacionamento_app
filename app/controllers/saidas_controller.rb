class SaidasController < ApplicationController
    def new
        @vehicle = ::Vehicle.new
    end
    
    def create
        @vehicle = Vehicle.find_by(placa: params[:placa])
        @vehicle.hora_saida = params[:vehicle][:hora_saida]
        @vehicle.total_a_pagar_por_veiculo = calculo(@vehicle.placa, @vehicle.hora_entrada, @vehicle.hora_saida)
        debugger
        if @vehicle.save
            redirect_to new_saida_path(vehicle: @vehicle), notice: 'Saída do veículo cadastrada com sucesso!'
        else
            render :new
        end
    end

    private

    def calculo(placa, hora_entrada, hora_saida)
        minuto_total = ((hora_saida) - (hora_entrada)) / 60
        resultado = minuto_total * 0.17
        return resultado
    end

end