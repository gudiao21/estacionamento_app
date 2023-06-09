class SaidasController < ApplicationController
    def saida
        @vehicle = ::Vehicle.new
    end
    
    def create
        @vehicle = Vehicle.new
        @vehicle = Vehicle.find_by(placa: params[:placa])
        #debugger
        
        if @vehicle
            @vehicle.hora_saida = params[:vehicle][:hora_saida]
            @vehicle.total_a_pagar_por_veiculo = calculo(@vehicle.placa, @vehicle.hora_entrada, @vehicle.hora_saida)
            #@vehicle.subtotal = calcular_subtotal_acumulado(@vehicle.total_a_pagar_por_veiculo)
            #debugger
            
            previous_vehicle = Vehicle.where.not(subtotal:nil).last
            if previous_vehicle.nil?
                @vehicle.subtotal = @vehicle.total_a_pagar_por_veiculo
            else
                @vehicle.subtotal = previous_vehicle.subtotal + @vehicle.total_a_pagar_por_veiculo
            end

            if @vehicle.save
                flash[:notice] = 'Saída do veículo cadastrada com sucesso!'
                flash[:vehicle_attributes] = @vehicle.attributes.slice('placa', 'nome_veiculo', 'dono_do_veiculo', 'hora_entrada', 'hora_saida', 'total_a_pagar_por_veiculo')
                #redirect_to welcome_path
            else
                flash[:error] = 'Erro ao cadastrar saída do veículo.'
                render :saida
        
            end
        else
            flash[:error] = 'Veículo não encontrado.'
            render :saida
        end       
    end

    private #Significa que esse método é uma ação interna privada que só pode ser chamada por outros métodos dentro do mesmo controller. Essa é uma convenção usada para definir métodos auxiliares que não devem ser acessíveis externamente, mas são necessários para o funcionamento interno do controller.

    def calculo(placa, hora_entrada, hora_saida)
        segundos_total = ((hora_saida) - (hora_entrada)).to_i
        minutos_total = (segundos_total) / 60
        resultado = minutos_total * 0.17
        return resultado
    end

    # def calcular_subtotal_acumulado(total_a_pagar_por_veiculo)
    #     if @vehicle.subtotal.nil?
    #          subtotal_acumulado = total_a_pagar_por_veiculo
    #     else
    #          subtotal_acumulado = @vehicle.subtotal + total_a_pagar_por_veiculo
    #     end
    #     return subtotal_acumulado
    # end  

end