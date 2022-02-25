class Public::OrdersController < ApplicationController

before_action :authenticate_customer!

  def new
    @order = Order.new #新規の注文情報を作成するためのフォームを作成
    @user = current_customer #サインインしているユーザーを取得する
    @address = Address.where(customer_id: @user.id) #ユーザーIDとサインインしているユーザーが等しい場合、addressテーブルの情報を取得する
  end

  def check
    @user = current_customer
    @cart_items = CartItem.where(customer_id: @user.id)
    @order = Order.new #新規オーダー情報のフォームを作成し、createアクションに飛ばす
    @order = Order.new(order_params) #ユーザーのオーダー情報を作成。その際、ストロングパラメーターのorder_paramsアクションを経由する。（creteアクションの記述）
    @order.shipping_cost = 800

    address_type = params[:address_type] #address_typeカラムに情報を受け取る箱を作成
    if address_type == "1"
      @order.address = @user.address #サインインしているユーザーのaddressを取得する
      @order.postal_code = @user.postal_code #サインインしているユーザーのpostal_codeを取得する
      @order.name = @user.last_name + @user.first_name #サインインしているユーザーのlast_name + first_nameを取得する

    elsif address_type == "2"
      address_id = params[:address_id]
      address = Address.find(address_id)
      @order.address = address.address
      @order.postal_code = address.postal_code
      @order.name = address.name

    #"3"の場合は前の記述の　@order = Order.new(order_params)の処理を行うため不要

    end

    #配送先の登録はif文を使うかhidden_fieldを使う（配送先の情報の取り出し方が複数あるため）
    #checkアクションはhidden_fieldを通してデータを送るのでPOSTメゾットになる


  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id #idがないと保存されない。新規登録の際はidが必要。find(params[:current_customer])の場合は不要
    @order.save
    redirect_to complete_path
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end

end
