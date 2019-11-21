class ApiController < ApplicationController
  def clientes
    render json: Cliente.all, status: :ok
  end

  def cliente
    cliente = Cliente.where(codigo: params[:id]).first
    render json: cliente,  status: :ok, each_serializer:ClienteSerializer, root: true
  end


  def transacciones
    transacciones = Transaccion.where(cliente_codigo: params[:id])
    render json: transacciones,status: :ok, root: true
  end

  def cuenta
     cobrado = Transaccion.where(cliente_codigo: params[:id], tipo: 1).sum(:monto)
     por_cobrar = Transaccion.where(cliente_codigo: params[:id], tipo: 2).sum(:monto)
    render json: {monto_cobrado: cobrado,por_cobrar: por_cobrar}, status: :ok
  end
end
