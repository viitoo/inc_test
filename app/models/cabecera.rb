class Cabecera < ApplicationRecord
  belongs_to :cliente, foreign_key: 'cliente_codigo'
  validates :id_pago, uniqueness: true
end
