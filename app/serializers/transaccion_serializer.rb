class TransaccionSerializer < ActiveModel::Serializer
  attributes :tipo_de_registro, :id_transaccion, :monto, :tipo, :cliente_codigo
  belongs_to :cliente, foreign_key: 'cliente_codigo'

end
