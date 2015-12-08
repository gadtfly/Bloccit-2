require 'rails_helper'
include RandomData

RSpec.describe QuestionController, type: :controller do
  let (:my_question) do
    Question.create(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      resolved: false
      )
    end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns my_question to Question" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end
    
  end
end

#  describe "GET #show" do
#    it "returns http success" do
#      get :show
#      expect(response).to have_http_status(:success)
#    end
#  end

#  describe "GET #new" do
#    it "returns http success" do
#      get :new
#      expect(response).to have_http_status(:success)
#    end
#  end

#  describe "GET #edit" do
#    it "returns http success" do
#      get :edit
#      expect(response).to have_http_status(:success)
#    end
#  end

#end
