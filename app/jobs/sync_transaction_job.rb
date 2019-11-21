class SyncTransactionJob < ApplicationJob
  queue_as :default
  #sidekiq_options queue: :crawler, retry: false, backtrace: true
  require 'faraday'

  def perform(*args)
=begin
cabecera = []
    transaccion_array = []
    descuento = []
    footer = []
    clientes = ''
    url_api = Rails.application.secrets.endpoint
    begin
      res = Faraday.new(url_api+'file.txt',
                        headers: {
                            'Authorization: bearer' => Rails.application.secrets.bearer
                        }).get
      response = res.body.split(/\R+/)
    end
    response.each do |transaccion|
      if transaccion[0] == '1'
        cabecera.push(tipo_de_registro: transaccion[0], id_pago: transaccion[1,32], moneda: transaccion[36,3], monto_total: transaccion[39,13], total_descuentos: transaccion[52,13], total_con_descuentos: transaccion[65,13])
      elsif transaccion[0] == '2'
        transaccion_array.push(tipo_de_registro: transaccion[0], id_transaccion: transaccion[1,32], monto: transaccion[33,13], tipo: transaccion[51])
      elsif transaccion[0] == '3'
        descuento.push(tipo_de_registro: transaccion[0], id_descuento: transaccion[1,32], monto: transaccion[33,13], tipo: transaccion[38])
      elsif transaccion[0] == '4'
        footer.push(tipo_de_registro: transaccion[0], fecha_de_pago: transaccion[16,8], id_cliente: transaccion[24, transaccion.length])
        res = Faraday.new(url_api+"clients/#{footer[0][:id_cliente]}",
                          headers: {
                              'Authorization: bearer' => Rails.application.secrets.bearer
                          }).get
        clientes = JSON.parse(res.body)
        no_existe = Client.where(codigo: clientes['id']).blank?
        puts clientes
        if no_existe
          cliente = Client.new
          cliente.email = clientes['email']
          cliente.first_name = clientes['first_name']
          cliente.last_name = clientes['last_name']
          cliente.job = clientes['job']
          cliente.country = clientes['country']
          cliente.address = clientes['address']
          cliente.zip_code = clientes['zip_code']
          cliente.phone = clientes['phone']
          cliente.codigo = clientes['id']
          if cliente.save!
            puts "cliente creado satisfactoriamente"
          end
        end
        cabecera.map { |v| v['client_id'] = footer[0][:id_cliente]; v }
        transaccion_array.map { |v| v['client_id'] = footer[0][:id_cliente]; v }
        descuento.map { |v| v['client_id'] = footer[0][:id_cliente]; v }
        puts cabecera
        Header.create(cabecera)
        puts transaccion_array
        Transaction.create(transaccion_array)
        puts descuento
        Discount.create(descuento)
        puts footer
        Footer.create(footer)
        puts "se llego al final del lote"
      end
    end
=end

  end


end
