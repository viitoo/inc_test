class CreateDescuentos < ActiveRecord::Migration[5.1]
  def change
    create_table :descuentos do |t|
      t.string :tipo_de_registro
      t.string :id_descuento
      t.string :monto
      t.string :tipo
      #t.references :cliente_codigo, references: :clients, null: false, type: :string
      t.string :cliente_codigo, null: false
      t.timestamps
    end
    add_index :descuentos, :clientes

    #rename_column :descuentos, :cliente_codigo_id, :cliente_codigo
    add_foreign_key :descuentos, :clientes ,column: 'cliente_codigo', primary_key: 'codigo'

  end
end
