require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "Create method" do
    context "with valid attributes" do
      it "creates a valid article" do
        expect( Article.create(title: "My article", text: "is done.")).to be_valid
      end

      it "has a valid factory" do
        expect(create(:article)).to be_valid
      end
    end

    context "with invalid attributes" do
      it "without title is invalid" do
        expect(build(:article, title: nil)).not_to be_valid
      end

      it "title with less than 5 characters is invalid" do
        expect(build(:article, title: "Test")).to be_invalid
      end

      it "without text is valid" do
        expect(build(:article, text: nil)).to be_valid
      end
    end
  end
end
