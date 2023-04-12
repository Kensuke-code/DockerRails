require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'name should be present'  do
      user = User.new(name: '',email: 'text@example.com')
      expect(user).to be_invalid

      user.name = 'Kenchobin'
      expect(user).to be_valid
    end
    it 'email should be present'  do
      user = User.new(name: 'Kenchobin',email: '')
      expect(user).to be_invalid

      user.email = 'test@example.com'
      expect(user).to be_valid
    end
    it 'max name length should be limited' do
      user = User.new(name: Faker::String.random(length: 51),email: 'text@example.com')
      expect(user).to be_invalid

      user.name = Faker::String.random(length: 50)
      expect(user).to be_valid
    end
    it 'max email length should be limited' do
      user = User.new(name: 'Kenchobin',email: Faker::String.random(length: 256))
      expect(user).to be_invalid

      user.email = Faker::String.random(length: 255)
      expect(user).to be_valid
    end
  end
end
