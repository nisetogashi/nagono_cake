class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id) #deviseから情報を取り出す際は、params[id]が使えない
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false) # is_activeカラムをtrueに変更することにより削除フラグを立てる。trueが有効。falseが退会
    reset_session　#退会後のログイン画面のメールアドレスとパスワードをリセットする
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  def exit
  end

  def withdraw
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :email, :postal_code, :telephone_number)
  end

end
