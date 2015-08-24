require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:article){ create(:article) }
  let!(:comment){ create(:comment, article: article) }
  let(:comment_atts){ attributes_for(:comment)}
  describe "POST create" do
    it "creates a new comment" do
      expect{
        post :create, comment: comment_atts, article_id: article
      }.to change(Comment,:count).by(1)
    end

    it "redirects to the article view" do
      post :create, comment: comment_atts, article_id: article
      expect(response).to redirect_to article_path(article)
    end
  end

  describe "DELETE destroy" do
    it "deletes the comment" do
      expect{
        delete :destroy, id: comment, article_id: article
      }.to change(Comment,:count).by(-1)
    end

    it "redirects to the article view" do
      delete :destroy, id: comment, article_id: article
      expect(response).to redirect_to article_path(article)
    end
  end
end
