require 'rails_helper'

describe Destination do
  describe '#create' do

    it "first_name_kanaが空だと登録できないこと" do
      user = build(:destination, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "family_name_kanaが空だと登録できないこと" do
      user = build(:destination, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_nameが空だと登録できないこと" do
      user = build(:destination, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "family_nameが空だと登録できないこと" do
      user = build(:destination, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "post_codeが空だと登録できないこと" do
      user = build(:destination, post_code: nil)
      user.valid?
      expect(user.errors[:post_code]).to include("を入力してください")
    end

    it "cityが空だと登録できないこと" do
      user = build(:destination, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "addressが空だと登録できないこと" do
      user = build(:destination, address: nil)
      user.valid?
      expect(user.errors[:address]).to include("を入力してください")
    end




  end
end