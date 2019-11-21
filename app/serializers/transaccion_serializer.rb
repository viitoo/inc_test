class TransaccionSerializer < ActiveModel::Serializer
  attributes :tipo_de_registro, :id_transaccion, :monto, :tipo

end
