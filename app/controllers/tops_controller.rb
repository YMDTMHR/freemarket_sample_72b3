class TopsController < ApplicationController

  def index
    @products = Product.includes(:user)
  end
end
