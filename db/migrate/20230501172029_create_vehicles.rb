class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :placa
      t.string :nome_veiculo
      t.string :dono_do_veiculo
      t.datetime :hora_entrada

      t.timestamps
    end
  end
end
