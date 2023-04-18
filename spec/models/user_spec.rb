# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user.rbのテスト' do

    # nameが必要であること
    it 'name should be present'  do
      user = User.new(name: '',email: 'text@example.com')
      expect(user).to be_invalid

      user.name = 'Kenchobin'
      expect(user).to be_valid
    end

    # emailが必要であること
    it 'email should be present'  do
      user = User.new(name: 'Kenchobin',email: '')
      expect(user).to be_invalid

      user.email = 'test@example.com'
      expect(user).to be_valid
    end

    # nameの長さのバリデーション
    it 'max name length should be limited' do
      user = User.new(name: Faker::String.random(length: 51),email: 'text@example.com')
      expect(user).to be_invalid

      user.name = Faker::String.random(length: 50)
      expect(user).to be_valid
    end

    # emailの長さのバリデーション
    it 'max email length should be limited' do
      user = User.new(name: 'Kenchobin',email: "a" * 244 + "@example.com")
      expect(user).to be_invalid
      user.email = "a" * 243 + "@example.com"
      expect(user).to be_valid
    end

    # 有効なemailはバリデーションを通ること
    it 'email validation should accept valid addresses' do
      user = create(:user)
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end

    # 無効なemailはバリデーションで弾かれること
    it 'email validation should reject invalid addresses' do
      user = create(:user)
      invalid_addresses = %w[userf@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to be_invalid
      end
    end
  end

  # 重複するemailはバリデーションで弾かれること
  it 'email validation should reject duplicate address' do
    user = create(:user)
    duplicate_user = user.dup
    expect(duplicate_user).to be_invalid
  end

  # パスワードの最小文字数のテスト
  it 'password should have a minimum length' do
    user = create(:user)
    user.password = user.password_confirmation =  "a" * 5
    expect(user).to be_invalid
  end
end
