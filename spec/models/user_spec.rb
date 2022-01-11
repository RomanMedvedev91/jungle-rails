require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should have same password and password_confirmation' do
      @user = User.new({
      first_name: "Roman", 
      last_name: "Medvedev", 
      email: "roman.medvedev@gmail.com", 
      password: "123", 
      password_confirmation: "123"})
      expect(@user.password).to eql(@user.password_confirmation), @user.errors.full_messages
    end
    
    it 'should have same password and password_confirmation' do
      @user = User.new({
      first_name: "Roman", 
      last_name: "Medvedev", 
      email: "roman.medvedev@gmail.com", 
      password: "123", 
      password_confirmation: "no"})
      expect(@user.password).not_to eql(@user.password_confirmation), @user.errors.full_messages
    end

    it 'should NOT valid without any argument' do
      @user = User.new({first_name: nil, 
      last_name: nil, 
      email: nil, 
      password: nil, 
      password_confirmation: nil})
      expect(@user).not_to be_valid
    end
  
    it 'should have unique email' do
      @user1 = User.new(email: "test@test.COM")
      @user1.save
      @user2 = User.new(email: "TEST@TEST.com")
      @user2.save
      expect(@user2).not_to be_valid
    end

    it 'should have minimum 6 of password length' do
      @user = User.new({
      first_name: "Roman", 
      last_name: "Medvedev", 
      email: "roman.medvedev@gmail.com", 
      password: "123", 
      password_confirmation: "no"})
      expect(@user).not_to be_valid
    end

    it 'should NOT valid with password length less then 6' do
      @user = User.new({
      first_name: "Roman", 
      last_name: "Medvedev", 
      email: "roman.medvedev@gmail.com", 
      password: "123", 
      password_confirmation: "123"})
      expect(@user).not_to be_valid
    end

    it 'should valid with minimum 6 of password length' do
      @user = User.new({
      first_name: "Roman", 
      last_name: "Medvedev", 
      email: "roman.medvedev@gmail.com", 
      password: "123456", 
      password_confirmation: "123456"})
      expect(@user).to be_valid
    end
  end

  describe 'authenticate_with_credentials' do
    it 'should valid' do
    @user = User.create!({
      first_name: "Roman", 
      last_name: "Medvedev", 
      email: "roman.medvedev@gmail.com", 
      password: "123456", 
      password_confirmation: "123456"})
      user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to be_truthy
    end

    it 'should valid with addition spacing' do
    @user = User.create!({
      first_name: "Roman", 
      last_name: "Medvedev", 
      email: "  roman.medvedev@gmail.com  ", 
      password: "123456", 
      password_confirmation: "123456"})
      user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user.email).to eq("roman.medvedev@gmail.com")
    end


  end



end



# add to model user.rb 
 # validates: password_digest, confirmation: true
  # validates: password_digest, confirmation: { case_sensitive: false }