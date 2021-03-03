require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it '全項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
      it '金額が300円以上であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '金額が9999999円以下であれば登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it '商品名が空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it '商品説明が空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'category_idが１では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'status_idが１では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status must be other than 1'
      end
      it 'cost_idが１では登録できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Cost must be other than 1'
      end
      it 'prefecture_idが１では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'response_idが１では登録できない' do
        @item.response_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Response must be other than 1'
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が300円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格が9999999円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
      it '価格が全角文字では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '価格が半角英数混合では登録できない' do
        @item.price = '1000aa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '価格が半角英字だけでは登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
