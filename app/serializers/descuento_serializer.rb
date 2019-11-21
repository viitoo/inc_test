class DescuentoSerializer < ActiveModel::Serializer
  attributes  :tipo_de_registro, :id_descuento, :monto, :tipo
  belongs_to :cliente, foreign_key: 'cliente_codigo'

end
