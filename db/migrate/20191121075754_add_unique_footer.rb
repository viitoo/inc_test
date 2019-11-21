class AddUniqueFooter < ActiveRecord::Migration[5.1]
  def change
    add_index :footers, [:fecha_de_pago, :cliente_codigo], unique: true
  end
end
