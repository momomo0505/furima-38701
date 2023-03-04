require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空欄では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空欄では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空欄では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合でなければ登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'fujita'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'takashi'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it '名字のフリガナが全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = 'ふじた'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it '名前のフリガナが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'たかし'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '生年月日が空欄だと保存できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
