class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :show, :edit, :update]
  
  def show
  end

  def new
    @product = Product.new
    @product.images.new

    # @category_parent_array = ["---"]
    @category_parent_array = []
    #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent
      end
  end

  def create
    # binding.pry
    @product = Product.create(product_params)
    if @product.save
      redirect_to :root
      flash[:notice] = "商品を出品しました！"
    else
      flash[:alert] = "必須情報を入力してください"
      redirect_to new_product_path
  end
end

  def edit

    grandchild_category = @product.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent
    end
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to :root
      flash[:notice] = "商品を編集しました！"
    else
      # render action: :edit
      flash[:alert] = "必須情報を入力してください"
      redirect_to edit_product_path
    end
  end


  def destroy
    @product.destroy
    flash[:notice] = "商品を削除しました！"
    redirect_to root_path

  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  def set_product
    @product = Product.find(params[:id])
  end
  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :status, :shipping_cost, :shipping_days, :category_id, :prefecture_id, :distination_id, images_attributes:[:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  # 親カテゴリーのセレクトボックス
  # name = "product[parent_id]"
  # "product" => {:category_id => "選択された親カテゴリーのID", :name, :price}

  # 孫カテゴリーのセレクトボックス
  # name = "product[category_id]"
  # "category__id" => "選択された孫カテゴリーのID"



end
