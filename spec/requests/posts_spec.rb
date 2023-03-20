require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    let(:user1) { create(:user) }
    let!(:post1) { build(:post, user_id:user1.id) }
    before(:each) do
     post1.save
    end
    it "renders root path" do
      get posts_path
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /new" do
    let(:user1) { create(:user) }
    it "render a successful response" do
      sign_in user1
      get '/posts/new'
      # debugger
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:user1) { create(:user) }
    let!(:post1) { build(:post, user_id:user1.id) }
    it 'render a successful response' do
      sign_in user1
      post1.save
      get post_path(post1)
      expect(response).to be_successful
    end
  end 
end
