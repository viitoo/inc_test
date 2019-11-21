class Descuento < ApplicationRecord
  belongs_to :cliente, foreign_key: 'cliente_codigo'
  validates :id_descuento, uniqueness: true
end