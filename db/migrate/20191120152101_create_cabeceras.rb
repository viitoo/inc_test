class CreateCabeceras < ActiveRecord::Migration[5.1]
  def change
    create_table :cabeceras do |t|
      t.string :tipo_de_registro
      t.string :id_pago
      t.string :moneda
      t.string :monto_total
      t.string :total_con_descuentos
      t.string :cliente_codigo, null: false
      t.timestamps
    end
    add_index :cabeceras, :clientes
    #rename_column :cabeceras, :cliente_codigo_id, :cliente_codigo
    add_foreign_key :cabeceras, :clientes ,column: 'cliente_codigo', primary_key: 'codigo'

  end
end
