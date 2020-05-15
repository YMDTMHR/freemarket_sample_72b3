class BuysController < ApplicationController
  before_action :set_product, only: [:edit, :update]


  def edit
    @user = current_user

    
    if current_user.destination 
      @destination = @user.destination 
    end
    
  end
  
  def update
    if @product.update(destination_id: current_user.id)

      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY'] 
      card_params = { number: '4242424242424242', cvc: '123', exp_month: '1', exp_year: '2022' }
      token = Payjp::Token.create({ card: card_params }, x_payjp_direct_token_generate: true)
      customer = Payjp::Customer.create(card: token.id)
      Payjp::Charge.create(amount: @product.price, customer: customer.id, currency: 'jpy')

      redirect_to :root
      flash[:notice] = "商品を購入しました！"
    else
      render "buy_edit", flash[:alert] = { error: @product.errors.full_messages }
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :status, :shipping_cost, :shipping_days, :category_id, :prefecture_id, :distination_id, images_attributes:[:image]).merge(user_id: current_user.id)
  end
end
