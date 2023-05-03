require 'rails_helper'

RSpec.describe "UsersSignups", type: :system do

  describe 'signupページの挙動' do
    it '無効な値の時にレコードが生成されないこと' do
      count_before = User.count
      get signup_path
      post users_path, params: {user: {name: "",
                                       email: "user@valid",
                                       password: "foo",
                                       password_confirmation: "bar"}}
    count_after  = User.count
    expect(count_after).to eq(count_before)
    end

    it '正常値のときレコード数が増えていること' do
      count_before = User.count
      get signup_path
      post users_path, params: {user: {name: "Example User",
                                       email: "user@valid.com",
                                       password: "12345678",
                                       password_confirmation: "12345678"}}
    count_after  = User.count
    # expect(count_after).to eq(count_before)
    expect{ count_before }.to change{ count_after }.by(1)
    end
  end
end
