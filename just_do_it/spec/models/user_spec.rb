require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  subject(:user) { User.new(username: 'kevin', password: '1234567')}
  
  
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
    
  it "creates a password digest when given a password" do
    expect(user.password_digest).to_not be_nil
  end 
  
  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end 
  
  describe ':find_by_credentials' do 
    it 'should return a user with good params' do
      expect(user.find_by_credentials('kevin', '1234567')).to eq(user)
    end 
  
    it 'shoudl return nil with bad params' do
      expect(user.find_by_credentials('kevin', '12663337')).to be_nil
    end
  end
  
  describe '#reset_session_token!' do 
    
    it 'changes the session token ' do 
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to equal(old_session_token)
    end 
    it 'returns new session token' do 
      expect(user.reset_session_token!).to eq(user.session_token)
    end 
    
  end 
  
  describe ':password=(password)' do 
    it 'should check if the password_digest is not nil' do 
      expect(user.password_digest).to_not be_nil
    end
  end 
  
  describe '#is_password?' do
    
    it 'should return true with a good password' do
      
      expect(user.is_password?('1234567')).to be true
    end
    
    it 'should return false with a BAD PASSWOD ' do
      expect(user.is_password?('12345678')).to be false
    end
    
    
    
  end
  
  
  
  
  
  
  
end






