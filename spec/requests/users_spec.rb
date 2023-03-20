require 'rails_helper'

RSpec.describe "Users", type: :request do
  # describe "show profile" do
  #   let!(:user) { create(:user) }
  #   it 'renders the profile path' do
  #     get profile_path(user.id)
  #     expect(response).to be_successful
  #   end
  # end
  describe "GET registrations/new" do
    it "renders the sign up page" do
      get new_user_registration_path 
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET sessions/new" do
    it "renders the log in page" do
      get new_user_session_path 
      expect(response).to have_http_status(:ok)
    end
  end

  # describe "POST sessions/create" do
  #   let(:user) { create(:user) }
  #   it "saves the user_id in session" do
  #     sign_in user
  #     # debugger
  #     expect(response).to have_http_status(:ok)
  #   end

  #   it "session is nil by default" do
  #     post '/users/sign_in'
  #     expect(session[:user_id]).to eq(nil)
  #   end
  # end

  # describe "GET registrations/edit" do
  #     user = User.create(email:"ajhfbah@gmail.com",password:"9073065098")
  #     it "renders the edit page" do
  #       get edit_user_registration_path(user)
  #       expect(response).to be_successful
  #     end
  # end
end
