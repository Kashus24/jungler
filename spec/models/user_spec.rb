require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'should create a user' do
      user = User.create(
        first_name: "Kash",
        last_name: "Sekhon",
        email: "k@hotmail.com",
        password: "123",
        password_confirmation: "123"
      )
      expect(user).to be_valid
    end
    
    it 'should fail to create a user if passwords do not match' do
      user = User.create(        
      first_name: "Kash",
      last_name: "Sekhon",
      email: "k@hotmail.com",
      password: "123",
      password_confirmation: "000"
      )
      expect(user).to_not be_valid
    end

    it 'should fail to create a user with same email' do
      user = User.create(        
      first_name: "Kash",
      last_name: "Sekhon",
      email: "k@hotmail.com",
      password: "123",
      password_confirmation: "000"
      )
      user2 = User.create(        
        first_name: "Kash",
        last_name: "Sekhon",
        email: "K@hotmail.com",
        password: "123",
        password_confirmation: "000"
        )
      expect(user2).to_not be_valid
    end

    it 'should fail to create a user without a first name' do
      user = User.create(        
      first_name: nil,
      last_name: "Sekhon",
      email: "k@hotmail.com",
      password: "123",
      password_confirmation: "123"
      )
      expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'should fail to create a user without a last name' do
      user = User.create(        
      first_name: "Kash",
      last_name: nil,
      email: "k@hotmail.com",
      password: "123",
      password_confirmation: "123"
      )
      expect(user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'should fail to create a user without an email' do
      user = User.create(        
      first_name: "Kash",
      last_name: "Sekhon",
      email: nil,
      password: "123",
      password_confirmation: "123"
      )
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should fail with a password less than 3 characters' do
      user = User.create(        
      first_name: "Kash",
      last_name: "Sekhon",
      email: "k@hotmail.com",
      password: "12",
      password_confirmation: "12"
      )
      expect(user.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return an instance of a user when email and password is valid' do
      user = User.new(
        first_name: "Kash",
        last_name: "Sekhon",
        email: "k@hotmail.com",
        password: "123",
        password_confirmation: "123"
      )
      user.save!
      valid_user = User.authenticate_with_credentials("k@hotmail.com", "123")
    end

    it 'should login with capital letters in email' do
      user = User.create(
        first_name: "Kash",
        last_name: "Sekhon",
        email: "k@hotmail.com",
        password: "123",
        password_confirmation: "123"
      )
      valid_user = User.authenticate_with_credentials("k@HoTmaiL.com", "123")
      expect(valid_user.first_name).to eq("Kash")
    end

    it "should login user with spaces in email" do
      user = User.create(
        first_name: "Kash",
        last_name: "Sekhon",
        email: "k@hotmail.com",
        password: "123",
        password_confirmation: "123"
      )
      valid_user = User.authenticate_with_credentials("  k@hotmail.com", "123")
      expect(valid_user.email).to eq("k@hotmail.com")
    end

  end
end 
