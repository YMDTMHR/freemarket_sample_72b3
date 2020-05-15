class DestinationsController < ApplicationController
  before_action :set_destination, only: [:edit, :show, :update]
  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to destination_path(@destination.id)
      flash[:notice] = "情報を登録しました"
    else
      flash[:alert] = "必須情報を入力してください"
      redirect_to new_destination_path

    end
  end

  def show
  end

  def edit 
    # @destination = Destination.find(params[:id])
  end


  def update
    if @destination.update_attributes(destination_params)
      redirect_to :root
      flash[:notice] = "お届け先を編集しました！"
    else
      flash[:alert] = "必須情報を入力してください"
      render action: :edit
    end
  end

  def set_destination
    @destination = current_user.destination 
  end
  
  private 
  def destination_params
      params.require(:destination).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end