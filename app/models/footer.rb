class Footer < ApplicationRecord
  belongs_to :cliente, foreign_key: 'cliente_codigo'

end
