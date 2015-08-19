require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "create method" do
    it "has a valid factory" do
      expect(create(:comment)).to be_valid
    end

    it "without commenter and body is valid" do
      expect(build(:comment, body: nil, commenter: nil)).to be_valid
    end
  end
end
