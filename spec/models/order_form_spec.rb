require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '発送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    end

     context '内容に問題ない場合' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end

      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end

      it '建物名buildingは空でも保存できること' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号post_codeが空だと保存できないこと' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      
      it '郵便番号post_codeが「3桁ハイフン4桁」の半角文字列の形式でないと保存できないこと' do
        @order_form.post_code = 123-456
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県prefectureを選択していないと保存できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
     
      it '市区町村cityが空だと保存できないこと' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
    
      it '番地blockが空だと保存できないこと' do
        @order_form.block = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号telが空だと保存できないこと' do
          @order_form.tel = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号telが9桁以下だと購入できないこと' do
        @order_form.tel = '123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end

      it '電話番号telが12桁以上だと購入できないこと' do
        @order_form.tel = '1234567890123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end

      it '電話番号telにハイフンがあると保存できないこと' do
        @order_form.tel = '1234567-890'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end
    end
    end
  end
