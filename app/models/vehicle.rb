class Vehicle < ApplicationRecord
    validates :placa, presence: true
    validates :nome_veiculo, presence: true
    validates :dono_do_veiculo, presence: true
    validates :hora_entrada, presence: true
    validates :hora_saida, presence: false
    validates :total_a_pagar_por_veiculo, presence: false
    validates :subtotal, presence: false
end