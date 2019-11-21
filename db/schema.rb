# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191121075754) do

  create_table "cabeceras", force: :cascade do |t|
    t.string "tipo_de_registro"
    t.string "id_pago"
    t.string "moneda"
    t.string "monto_total"
    t.string "total_con_descuentos"
    t.string "cliente_codigo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "total_descuentos"
    t.index [nil], name: "index_cabeceras_on_clientes"
  end

  create_table "clientes", id: false, force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "job"
    t.string "country"
    t.string "address"
    t.string "zip_code"
    t.string "phone"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "descuentos", force: :cascade do |t|
    t.string "tipo_de_registro"
    t.string "id_descuento"
    t.string "monto"
    t.string "tipo"
    t.string "cliente_codigo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_descuentos_on_clientes"
  end

  create_table "footers", force: :cascade do |t|
    t.string "tipo_de_registro"
    t.string "fecha_de_pago"
    t.string "cliente_codigo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fecha_de_pago", "cliente_codigo"], name: "index_footers_on_fecha_de_pago_and_cliente_codigo", unique: true
    t.index [nil], name: "index_footers_on_clientes"
  end

  create_table "transaccions", force: :cascade do |t|
    t.string "tipo_de_registro"
    t.string "id_transaccion"
    t.string "monto"
    t.string "tipo"
    t.string "cliente_codigo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_transaccions_on_clientes"
  end

end
