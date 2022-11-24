require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が保存できるとき' do
      it '画像、商品名、商品の説明、商品のカテゴリーと状態、配送の負担・地域・日数と価格が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できないとき' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it '商品のカテゴリーが空では登録できない' do
        @item.product_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end
      it '商品の状態が空では登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '配送料の負担が空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '配送元の地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送までの日数が空では登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      ## 販売価格
      it '販売価格が空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '販売価格が299以下では登録できない' do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is out of setting range')
      end
      it '販売価格が10,000,000以上では登録できない' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is out of setting range')
      end
      it '販売価格が全角数値では登録できない' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is invalid. Input half-width characters')
      end
      it '販売価格が半角数値以外では登録できない' do
        @item.selling_price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is invalid. Input half-width characters')
      end
    end
  end
end
