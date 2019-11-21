class AddColumToCabecera < ActiveRecord::Migration[5.1]
  def change
    add_column :cabeceras , :total_descuentos, :string
  end
end
