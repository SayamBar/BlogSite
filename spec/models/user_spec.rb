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
    let!(:user1) { User.create(email: "test333@example.com", password: "password", fullname:"test",bio:"nbxsan",gender:"female") }
    context "when the password is correct" do
      it "ensures log in the user" do
        # user.save(if we use let)
        # debugger
        expect(User.authenticate("test333@example.com", "password")).to eq(user1)
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
    let(:user1) { User.new(email: "test123@example.com", password: "password", fullname:"test", bio:"wfjhwbejf",gender:"others")}
    context "when exceeds the length of bio" do
      it "ensures user can't be saved" do
        expect(user.save).to eq(false)
      end
    end
    context "when the length of bio in limit" do
      it "ensures user be saved" do
        # debugger
        expect(user1.save).to eq(true)
      end
    end
  end

  describe "check avatar" do
    let!(:user) { User.create(email: "test@example.com", password: "password", fullname:"test", bio:"wjhfbhbje iuwhfjiwehbifj iuwhifjwhf iwhfiwheqf iqhwnkjwqnfjk",gender:"others")}
    let!(:user1) { User.create(email: "test1@example.com", password: "password", fullname:"test", bio:"wjhfbhbje iuwhfjiwehbifj iuwhifjwhf iwhfiwheqf iqhwnkjwqnfjk",gender:"others")}
    context "when user did not upload avatar" do
      it "ensures user has no avatar" do
        expect(user.avatar.attached?).to eq(false)
      end
    end
    context "when user upload avatar" do
      it "ensures user has one avatar" do
        user1.avatar.attach(io: File.open("../../Downloads/123.jpeg"),filename: '123.jpeg', content_type: 'image/jpeg')
        expect(user1.avatar.attached?).to eq(true)
      end
    end
  end

  describe "factory test" do
    let(:u) { create(:user) }
    it "ensures user" do
      expect(u.fullname).to eq("Admin")
    end
  end

end
