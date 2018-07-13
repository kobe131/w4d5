require 'spec_helper'
require 'rails_helper'

describe 'the signup process' do
  it 'has a new user page' do 
    visit new_user_url 
    expect(page).to have_content "New User"
  end 
  describe 'signing up a user' do
    before(:each) do 
      visit new_user_url 
      fill_in 'Username', :with => "kobe@kobe.com"
      fill_in 'Password', :with => "12345678"
      click_on "Create User"
    end
    it 'shows username on the homepage after signup' do 
      expect(page).to have_content "HELLO U LOGGED IN"
    end 
  end
end 

describe 'logging in' do
  it 'shows username on the homepage after login'

end

describe 'logging out' do
  it 'begins with a logged out state'

  it 'doesnt show username on the homepage after logout'

end