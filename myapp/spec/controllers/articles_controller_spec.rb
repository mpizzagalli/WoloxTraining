require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    let(:article) { create(:article) }
    before :each do
      get :index
    end
    it "populates an array of articles" do
      expect(assigns(:articles)).to eq([article])
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
    end

    it "renders the index view" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let(:article) { create(:article) }
    before :each do
      get :show, id: article
    end
    it "assigns the requested article to @article" do
      expect(assigns(:article)).to eq(article)
    end

    it "renders the show view" do
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    before :each do
      get :new
    end

    it "renders the new view" do
      expect(response).to render_template("new")
    end

    it "assigns a new article to @article" do
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "GET #edit" do
    let(:article) { create(:article) }
    before :each do
      get :edit, id: article
    end

    it "renders the edit view" do
      expect(response).to render_template("edit")
    end

    it "assigns the requested article to @article" do
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      let(:article_atts) { attributes_for(:article) }
      it "creates a new article" do
        expect{
          post :create, article: article_atts
        }.to change(Article,:count).by(1)
      end

      it "redirects to the new article" do
        post :create, article: article_atts
        expect(response).to redirect_to Article.last
      end
    end

    context "with invalid attributes" do
      let(:article_atts_blank) { attributes_for(:article, title: nil, text: "invalid") }
      let(:article_atts) { attributes_for(:article, title: "Test", text: "invalid") }
      it "renders the new view again" do
        post :create, article: article_atts
        expect(response).to render_template("new")
      end

      context "blank title" do
        it "doesn't creates a new article" do
          expect{
            post :create, article: article_atts_blank
          }.to_not change(Article,:count)
        end
      end

      context "title is shorter than 5 characters" do
        it "doesn't creates a new article" do
          expect{
            post :create, article: article_atts
          }.to_not change(Article,:count)
        end
      end
    end
  end

  describe "PUT update" do
    let(:article) { create(:article, title: "Tests", text: "for update method") }
    let(:article_atts) { attributes_for(:article) }
    let(:new_article_atts) { attributes_for(:article, title: "Edited", text: "Update") }
    let(:invalid_article_atts) { attributes_for(:article, title: "Test", text: "invalid") }

    context "with valid attributes" do
      before :each do
        put :update, id: article, article: new_article_atts
      end
      it "locates the requested article" do
        expect(assigns(:article)).to eq(article)
      end

      it "changes @article attributes" do
        article.reload
        expect(article.title).to eq("Edited")
        expect(article.text).to eq("Update")
      end

      it "redirects to the updated article" do
        expect(response).to redirect_to article_path(article)
      end
    end

    context "with invalid attributes" do
      before :each do
        put :update, id: article, article: invalid_article_atts
      end
      it "locates the requested article" do
        expect(assigns(:article)).to eq(article)
      end

      it "doesn't changes @article attributes" do
        article.reload
        expect(article.title).to eq("Tests")
        expect(article.text).to eq("for update method")
      end

      it "renders the edit view again" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:article) { create(:article) }

    it "deletes the article" do
      expect{
        delete :destroy, id: article
      }.to change(Article,:count).by(-1)
    end

    it "redirects to articles#index" do
      delete :destroy, id: article
      expect(response).to redirect_to articles_url
    end
  end
end
