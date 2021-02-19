require 'rails_helper'

RSpec.describe OrderBuyerinfo, type: :model do
  describe '決済情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_buyerinfo = FactoryBot.build(:order_buyerinfo, user_id: @user.id,item_id: @item.id)
      sleep(1)
    end

    context '正常稼働' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_buyerinfo).to be_valid
      end
      it '建物名を除く全ての値が正しく入力されていれば保存できること' do
        @order_buyerinfo.building_name = ""
        expect(@order_buyerinfo).to be_valid
      end
    end
    
    context 'エラー操作' do
      it '郵便番号が空だと保存できないこと' do
        @order_buyerinfo.postal_code = ""
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがない場合保存できないこと' do
        @order_buyerinfo.postal_code = "1234567"
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が「--（prefecture_id:1)」だと保存できないこと' do
        @order_buyerinfo.prefecture_id = 1
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空だと保存できないこと' do
        @order_buyerinfo.city=""
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_buyerinfo.house_number=""
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_buyerinfo.phone_number=""
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上の場合保存できないこと' do
        @order_buyerinfo.phone_number="123456789012"
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下の場合保存できないこと' do
        @order_buyerinfo.phone_number="123456789"
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が英数混合では登録できないこと' do
        @order_buyerinfo.phone_number="12345abcde"
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空だと保存できないこと' do
        @order_buyerinfo.token=""
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空の場合保存ができないこと' do
        @order_buyerinfo.user_id =""
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の場合保存ができないこと' do
        @order_buyerinfo.item_id=""
        @order_buyerinfo.valid?
        expect(@order_buyerinfo.errors.full_messages).to include("Item can't be blank")
      end

    end
  end


end
