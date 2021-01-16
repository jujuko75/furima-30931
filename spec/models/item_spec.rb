require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '正常稼働' do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context 'エラー操作' do
      it "imageが添付されていないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameがないと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが41文字以上の場合は登録できない" do
        @item.name = Faker::String.random(length:41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "textがないと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "textが1001文字以上の場合は登録できない" do
        @item.text = Faker::String.random(length:1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end
      it "category_idがないと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "category_idが1の場合登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idがないと登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end
      it "condition_idが1の場合登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "postagetype_idがないと登録できない" do
        @item.postagetype_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postagetype can't be blank", "Postagetype is not a number")
      end
      it "postagetype_idが1の場合登録できない" do
        @item.postagetype_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postagetype must be other than 1")
      end
      it "prefecture_idがないと登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it "prefecture_idが1の場合登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "deliveryday_idがないと登録できない" do
        @item.deliveryday_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday can't be blank", "Deliveryday is not a number")
      end
      it "deliveryday_idが1の場合登録できない" do
        @item.deliveryday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday must be other than 1")
      end
      it "priceがないと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it "priceが10000000以上だと登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "priceは半角数字以外の場合登録ができない" do
        @item.price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザが紐づいてないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "priceが半角英数混合の場合登録できない" do
        @item.price = "300aa0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英語の場合登録できない" do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  
  end



end
