require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザーが正しい場合' do
    it '値が入っている場合' do
      expect(FactoryBot.build(:user)).to be_valid
    end
    it 'emailが空白の場合' do
      user = FactoryBot.build(:user, email: '')
      expect(user).to be_invalid
    end
  end
  context 'when email format is invalid' do
    it ' emailのvalidationが正しく機能しているか' do
      expect(FactoryBot.build(:user, email: 'user@foo,com')).to be_invalid
      expect(FactoryBot.build(:user, email: 'user_at_foo.org')).to be_invalid
      expect(FactoryBot.build(:user, email: 'foo@bar..com')).to be_invalid
    end
  end
  context ' email addresses should be unique' do
    it '一意性が正しく機能しているか' do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save!  #例外を返すようにすることでDBに値が保存されていることを保証する為
      expect(duplicate_user).to be_invalid
    end
  end

  it ' emailを小文字に変換後の値が大文字と小文字を混ぜて登録されたアドレスと同じか ' do
    mix_case_email = 'uSer@eXampLe.cOm'
    @user.email = mix_case_email
    @user.save!
    expect(@user.reload.email).to eq 'user@example.com'
  end
  context ' user_id_name should be unique' do
    it '一意性が正しく機能しているか' do
      duplicate_user = @user.dup
      duplicate_user.user_id_name = @user.user_id_name.upcase
      @user.save!  #例外を返すようにすることでDBに値が保存されていることを保証する為
      expect(duplicate_user).to be_invalid
    end
  end

  it ' user_id_nameを小文字に変換後の値が大文字と小文字を混ぜて登録されたアドレスと同じか ' do
    mix_case_user_id_name = 'EXAmple USer'
    @user.user_id_name = mix_case_user_id_name
    @user.save!
    expect(@user.reload.user_id_name).to eq 'Example User'
  end
end
