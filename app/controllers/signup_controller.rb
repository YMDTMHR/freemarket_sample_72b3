class SignupController < ApplicationController
  before_action :set_card, only: [:destroy, :show]
  require 'payjp'

  def create
    @user = User.new()

    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
    end
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY'] 

    card_params = { number: '4242424242424242', cvc: '123', exp_month: '1', exp_year: '2022' }
    token = Payjp::Token.create({ card: card_params }, x_payjp_direct_token_generate: true)

    customer = Payjp::Customer.create(card: token.id)

      @card = Card.new(                  
        user_id: current_user.id,       
        customer_id: customer.id,        
        card_id: customer.default_card   
      )

    if @card.save
      flash[:notice] = "クレジットカード情報を登録しました！"
      redirect_to root_path
    else
      redirect_to signup_index_path 
    end
  end


  def destroy 
    if @card.delete
      flash[:notice] = "クレジットカード情報を削除しました！"
      redirect_to root_path
    else
      redirect_to signup_show_path
    end
  end
  

  def show 
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    @customer = Payjp::Customer.retrieve(@card.customer_id)
  end


end