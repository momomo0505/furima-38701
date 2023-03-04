require 'rails_helper'
RSpec.describe User, type: :model do
  before do
  @user = FactoryBot.build(:user)
end

  describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameを入力してください")
     end
  
     it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
  
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "名字が全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.last_name = "fujita"
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を漢字・ひらがな・カタカナで入力してください")
    end

    it "名前が全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.first_name = "takashi"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を漢字・ひらがな・カタカナで入力してください")
    end

    it "名字のフリガナが全角（カタカナ）でないと登録できない" do
     @user.last_name_kana = "ふじた"
     @user.valid?
      expect(@user.errors.full_messages).to include("名字をカタカナで入力してください")
    end

    it "名前のフリガナが全角（カタカナ）でないと登録できない" do
     @user.first_name_kana = "たかし"
     @user.valid?
      expect(@user.errors.full_messages).to include("名前をカタカナで入力してください")
    end

    it "生年月日が空欄だと保存できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end


  end
end