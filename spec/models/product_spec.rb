require 'rails_helper'

describe Product do
  describe '#create' do

    it "name(商品名)がない場合は登録できないこと" do
      user = build(:product, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "description(説明文)がない場合は登録できないこと" do
      user = build(:product, description: "")
      user.valid?
      expect(user.errors[:description]).to include("を入力してください")
    end

    it "price(値段)がない場合は登録できない事" do
      user = build(:product, price: "")
      user.valid?
      expect(user.errors[:price]).to include("を入力してください")
    end   

  end
end