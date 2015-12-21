require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostController, type: :controller do
  let(:my_sponosred_post){Topic.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}
  let(:my_topic){Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponosred_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :edit
    end
    
    it "assigns post to be updated to @sponsored_post" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      sponsored_post_instance = assigns(:sponsored_post)
      
      expect(sponsored_post_instance.id).to eq my_sponsored_post.id
      expect(sponsored_post_instance.title).to eq my_sponsored_post.title
      expect(sponsored_post_instance.body).to eq my_sponsored_post.body
    end
  end

#  describe "GET index" do
#    it "returns http success" do
#      get :index
#      expect(response).to have_http_status(:success)
#    end
    
#    it "assigns [my_sponsored_post] to @sponsored_post" do
#      get :index
#      expect(assigns(:sponsored_post)).to eq([my_sponsored_post])
#    end
#  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end
    
    it "imitializes @sponsored_post" do
      get :new, topic_id: my_topic.id
      expecet(assigns(:post)).not_to be_nil
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :show
    end
    
    it "assigns my_sponsored_post to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
    end
  end
  
  describe "SPONSORED_POST create" do
    it "increases the number of Sponsored_Post by 1" do
      expect{sponsored_post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Sponsored_Post,:count).by(1)
    end

    it "assigns the new sponsored_post to @sponsored_post" do
      sponsored_post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:sponsored_post)).to eq Sponsored_Post.last
    end

    it "redirects to the new sponsored_post" do
      sponsored_post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to [my_topic, Sponsored_Post.last]
    end
  end

end
