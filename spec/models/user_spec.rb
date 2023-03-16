require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation test' do
    let(:user_1) { User.new(email:"barsayam@gmail.com",password:"9073065098",fullname:"sayam bar",gender:"male") }
    let(:user_2) { User.new() }
    let(:user_3) { User.new(email:"barsayam@gmail.com",password:"907305098",fullname:"bar",gender:"male") }
    context 'creation test' do
      it "ensure valid user" do
        expect(user_1.save).to eq(true)
      end
    end
    context 'creation test' do  
      it "ensure invalid user" do
        expect(user_2.save).to eq(false)
      end
    end
    context 'duplicate email' do
      it "ensures invalid user" do
        user_1.save
        expect(user_3.save).to eq(false)
      end
    end
  end

  describe '.authentication' do
    let!(:user) { User.create(email: "test@example.com", password: "password", fullname:"test",gender:"female") }
    context "when the password is correct" do
      it "ensures log in the user" do
        # user.save(if we use let)
        expect(User.authenticate("test@example.com", "password")).to eq(user)
      end
    end
    context "when the password is incorrect" do
      it "ensures user can't log in" do
        expect(User.authenticate("test@example.com", "Password")).to eq(nil)
      end
    end
  end

  describe "length of user's bio test" do
    let(:user) { User.new(email: "test@example.com", password: "password", fullname:"test", bio:"wjhfbhbje iuwhfjiwehbifj iuwhifjwhf iwhfiwheqf iqhwnkjwqnfjk",gender:"others")}
    let(:user1) { User.new(email: "test@example.com", password: "password", fullname:"test", bio:"wfjhwbejf",gender:"others")}
    context "when exceeds the length of bio" do
      it "ensures user can't be saved" do
        expect(user.save).to eq(false)
      end
    end
    context "when the length of bio in limit" do
      it "ensures user be saved" do
        expect(user1.save).to eq(true)
      end
    end
  end
end
