class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id) #deviseから情報を取り出す際は、params[id]が使えない
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
  end

  def exit
  end

  def withdraw
  end


end
