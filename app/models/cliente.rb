class Cliente < ApplicationRecord
  self.primary_key = 'codigo'
  has_many :cabeceras, primary_key: 'codigo', foreign_key: 'cliente_codigo'
  has_many :descuentos, primary_key: 'codigo', foreign_key: 'cliente_codigo'
  has_many :footers, primary_key: 'codigo', foreign_key: 'cliente_codigo'
  has_many :transaccions, primary_key: 'codigo', foreign_key: 'cliente_codigo'
  validates :email, uniqueness: true
end
