class AddColumsToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :hora_saida, :datetime
    add_column :vehicles, :total_a_pagar_por_veiculo, :float
    add_column :vehicles, :subtotal, :float
  end
end
