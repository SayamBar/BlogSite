require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validation test" do
    let(:user1) { build(:user) }
    before(:each) do
      user1.save
    end
    context "post creation" do
      let(:post1) { build(:post, user_id: user1.id)}
      it "ensures user creates post" do 
        expect(post1.save).to eq(true)
      end

      let(:post2) { build(:post)}
      it "ensures not create post" do 
        expect(post2.save).to eq(false)
      end
      
      it "ensures images not present" do
        expect(post1.images.attached?).to eq(false)
      end

      # let(:post3) { create(:post, user_id: user1.id)}
      # it "ensures images attached" do
      #   post3.images.attach("io: File.open("../../Downloads/123.jpeg"),filename: '123.jpeg', content_type: 'image/jpeg'")
      #   expect(post3.images.attached?).to eq(true)
      # end
    end
  end 
end
