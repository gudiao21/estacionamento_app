class SaidasController < ApplicationController
    def saida
        @vehicle = ::Vehicle.new
    end
    
    def create
        @vehicle = Vehicle.find_by(placa: params[:placa])
        #debugger
        
        if @vehicle
            @vehicle.hora_saida = params[:vehicle][:hora_saida]
            @vehicle.total_a_pagar_por_veiculo = calculo(@vehicle.placa, @vehicle.hora_entrada, @vehicle.hora_saida)
            @vehicle.subtotal = calcular_subtotal_acumulado(@vehicle.total_a_pagar_por_veiculo)
            #debugger
            
            if @vehicle.save
                @vehicle.subtotal = calcular_subtotal_acumulado(@vehicle.total_a_pagar_por_veiculo)
                @vehicle.save
                update_total_acumulado(@vehicle.total_a_pagar_por_veiculo)
                flash[:notice] = 'Saída do veículo cadastrada com sucesso!'
                flash[:vehicle_attributes] = @vehicle.attributes.slice('placa', 'nome_veiculo', 'dono_do_veiculo', 'hora_entrada', 'hora_saida', 'total_a_pagar_por_veiculo')
                redirect_to welcome_path
            else
                flash[:error] = 'Erro ao cadastrar saída do veículo.'
                render :saida
        
            end
        else
            flash[:error] = 'Veículo não encontrado.'
            render :saida
        end       
    end

    private

    def calculo(placa, hora_entrada, hora_saida)
        segundos_total = (hora_saida - hora_entrada).to_i
        minutos_total = (segundos_total) / 60
        resultado = minutos_total * 0.17
        return resultado
    end

    def update_total_acumulado(total_a_pagar_por_veiculo)
        if session[:total_acumulado].nil?
            session[:total_acumulado] = total_a_pagar_por_veiculo
        else
            session[:total_acumulado] += total_a_pagar_por_veiculo
        end
    end

    def calcular_subtotal_acumulado(total_a_pagar_por_veiculo)
        total_acumulado = session[:total_acumulado].to_f
        total_acumulado += total_a_pagar_por_veiculo
        session[:total_acumulado] = total_acumulado
        return total_acumulado
    end
end