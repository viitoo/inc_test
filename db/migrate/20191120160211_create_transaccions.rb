class CreateTransaccions < ActiveRecord::Migration[5.1]
  def change
    create_table :transaccions do |t|
      t.string :tipo_de_registro
      t.string :id_transaccion
      t.string :monto
      t.string :tipo
      t.string :cliente_codigo ,  null: false

      t.timestamps
    end
    add_index :transaccions, :clientes

    #rename_column :transaccions, :cliente_codigo_id, :cliente_codigo
    add_foreign_key :transaccions, :clientes ,column: 'cliente_codigo', primary_key: 'codigo'

  end
end
