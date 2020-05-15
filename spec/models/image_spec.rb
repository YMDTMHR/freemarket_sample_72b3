require 'rails_helper'

describe Image do
  describe '#create' do

    it "画像があると登録できる事" do
      user = build(:image, image: "")
      expect(user).to be_valid
    end

  end
end