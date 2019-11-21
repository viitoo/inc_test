class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes, id:false, primary_key: :codigo do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :job
      t.string :country
      t.string :address
      t.string :zip_code
      t.string :phone
      t.string :codigo, primary: true

      t.timestamps
    end
  end

end
