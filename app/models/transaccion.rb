class Transaccion < ApplicationRecord
  belongs_to :cliente, foreign_key: 'cliente_codigo'
  validates :id_transaccion, uniqueness: true
end
