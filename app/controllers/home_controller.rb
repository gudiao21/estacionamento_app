class HomeController < ApplicationController
    def welcome
        @mensagem = "<span style='font-family: Arial, sans-serif; font-size: 20px; color: #ff0000;'>Seja bem vindo ao programa de estacionamento CAR PARKING!</span>".html_safe
    end
end
