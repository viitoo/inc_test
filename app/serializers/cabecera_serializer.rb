class CabeceraSerializer < ActiveModel::Serializer
  attributes :tipo_de_registro, :id_pago, :moneda, :monto_total,:total_descuentos, :total_con_descuentos, :cliente_codigo
  belongs_to :cliente, foreign_key: 'cliente_codigo'

end
