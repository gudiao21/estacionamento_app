class Vehicle < ApplicationRecord
    validates :placa, presence: true
    validates :nome_veiculo, presence: true
    validates :dono_do_veiculo, presence: true
    validates :hora_entrada, presence: true
end
