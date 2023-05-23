class HomeController < ApplicationController
    def welcome
        @mensagem = "Seja bem vindo ao programa de estacionamento CAR PARKING!"
    end

    def redirecionar
        render 'delete'
    end
end