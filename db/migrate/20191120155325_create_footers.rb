class CreateFooters < ActiveRecord::Migration[5.1]
  def change
    create_table :footers do |t|
      t.string :tipo_de_registro
      t.string :fecha_de_pago
      t.string :cliente_codigo,   null: false

      t.timestamps
    end
    add_index :footers, :clientes
    #rename_column :footers, :cliente_codigo_id, :cliente_codigo
    add_foreign_key :footers, :clientes ,column: 'cliente_codigo', primary_key: 'codigo'

  end
end
