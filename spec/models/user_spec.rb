require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      expect(user).to be_valid
    end

    it 'is not valid without a password and password_confirmation' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'test@example.com')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid if password and password_confirmation do not match' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'test@example.com', password: 'password123', password_confirmation: 'wrongpassword')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'requires the password to have a minimum length' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'test@example.com', password: 'pass', password_confirmation: 'pass')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(first_name: 'John', last_name: 'Doe', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    end

    it 'authenticates with correct credentials' do
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password123')
      expect(authenticated_user).to eq(@user)
    end

    it 'does not authenticate with incorrect email' do
      authenticated_user = User.authenticate_with_credentials('wrong@example.com', 'password123')
      expect(authenticated_user).to be_nil
    end

    it 'does not authenticate with incorrect password' do
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrongpassword')
      expect(authenticated_user).to be_nil
    end

    # Edge Cases
    it 'authenticates with mixed case email' do
      authenticated_user = User.authenticate_with_credentials('TEST@ExaMPLe.cOM', 'password123')
      expect(authenticated_user).to eq(@user)
    end

    it 'authenticates with spaces before and/or after the email' do
      authenticated_user = User.authenticate_with_credentials('   test@example.com   ', 'password123')
      expect(authenticated_user).to eq(@user)
    end
  end
end