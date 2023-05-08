class SaidasController < ApplicationController
    def new
        @vehicle = ::Vehicle.new
    end
    
    def create
        @vehicle = Vehicle.find_by(placa: params[:placa])
        @vehicle.hora_saida = params[:vehicle][:hora_saida]
        @vehicle.total_a_pagar_por_veiculo = calculo(@vehicle.placa, @vehicle.hora_entrada, @vehicle.hora_saida)
        #debugger
        if @vehicle.save
            flash[:notice] = 'Saída do veículo cadastrada com sucesso!'
            flash[:vehicle_attributes] = @vehicle.attributes.slice('placa', 'nome_veiculo', 'dono_do_veiculo', 'hora_entrada', 'hora_saida', 'total_a_pagar_por_veiculo')
            redirect_to welcome_path
        else
            flash[:error] = 'Erro ao cadastrar saída do veículo.'
            render :new
        end
    end

    private

    def calculo(placa, hora_entrada, hora_saida)
        segundos_total = hora_saida - hora_entrada).to_i
        minutos_total = (segundos_total) / 60
        resultado = minutos_total * 0.17
        return resultado
    end

end