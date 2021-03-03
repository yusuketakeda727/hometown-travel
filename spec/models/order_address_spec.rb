require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it '全項目が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品の購入できないとき' do
      it 'userと紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemと紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeにハイフンが入ってないと購入できない' do
        @order_address.postal_code = '1231234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid'
      end
      it 'prefectureを選択しないと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_namberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_namberが全角数字だと購入できない' do
        @order_address.phone_number = '０８０１２３４１２３４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_namberが11文字以上だと購入できない' do
        @order_address.phone_number = '080123412345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
    end
  end
end
