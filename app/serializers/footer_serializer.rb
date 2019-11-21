class FooterSerializer < ActiveModel::Serializer
  attributes :tipo_de_registro, :fecha_de_pago, :cliente_codigo
 # belongs_to :cliente, foreign_key: 'cliente_codigo'

end
