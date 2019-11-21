class ClienteSerializer < ActiveModel::Serializer
  attributes :email, :first_name, :last_name, :job, :country, :address, :zip_code, :phone ,:codigo
  attribute :cliente_cabeceras
  attribute :cliente_transacciones
  attribute :cliente_descuentos
  attribute :cliente_descuentos
  attribute :cliente_footers
  #has_many :cabeceras, primary_key: 'codigo', foreign_key: 'cliente_codigo'
  #has_many :transaccions, primary_key: 'codigo', foreign_key: 'cliente_codigo'
  #has_many :descuentos, primary_key: 'codigo', foreign_key: 'cliente_codigo'
  #has_many :footers, primary_key: 'codigo', foreign_key: 'cliente_codigo'

  def cliente_cabeceras
    object.cabeceras.map {|cabecera| {id_pago: cabecera.id_pago, moneda: cabecera.moneda,
                                      monto_total: cabecera.monto_total,total_descuentos: cabecera.total_descuentos,
                                      total_con_descuentos: cabecera.total_con_descuentos}}
  end

  def cliente_transacciones
    object.transaccions.map {|transaccion| {id_transacion: transaccion.id_transaccion,monto: transaccion.monto, tipo: transaccion.tipo}}
  end

  def cliente_descuentos
    object.descuentos.map {|descuento| {id_descuento: descuento.id_descuento, monto: descuento.monto, tipo: descuento.tipo}}
  end

  def cliente_footers
    object.footers.map {|footer| {fecha_de_pago: footer.fecha_de_pago, cliente_codigo: footer.cliente_codigo}}

  end

end

