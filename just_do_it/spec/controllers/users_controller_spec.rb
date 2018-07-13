require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'GET #new' do
    it 'renders the new links page' do
      get :new, {}
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'POST #create' do
    context 'with invalid params' do
      it 'should render new' do
        post :create, params: { user: { email: "kobe@kobe.com", password: "" } }
        expect(flash[:errors]).to be_present 
        expect(response).to render_template('new')
      end
    end
    context 'with valid params' do
      it 'should save and direct to show page' do 
        post :create, params: { user: { email: "kobe@kobe.com", password: "123456789" } }
        expect(response).to redirect_to(new_user_url)
    end 
    end
  end
  
  describe 'GET #show' do
    it 'renders the show page' do
      expect(response).to render_template('show')
    end
  end

end
