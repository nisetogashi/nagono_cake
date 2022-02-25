class Public::CartItemsController < ApplicationController
  def index
    @user = current_customer
    @cart_items = CartItem.where(customer_id: @user.id)
  end

  def update
  end

  def cancel
  end

  def cancal_all
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end


  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
