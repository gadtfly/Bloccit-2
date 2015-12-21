class SponsoredPostController < ApplicationController
  def edit
    @sponsored_post = Sponsored_Post.find(params[:id])
  end

#  def index
#    @sponsored_post = Sponsored_Post.all
#  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = Sponsored_post.new
  end

  def show
    @sponsored_post = Sponsored_Post.find(params[:id])
  end
  
  def create
    @sponsored_post = Sponsored_Post.new
    @Sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @topic = Topic.find(params[:topic_id])
    @sponsored_post.topic = @topic

    if @sponsored_post.save
     flash[:notice] = "Sponsored Post was saved."
     redirect_to [@topic, @sponsored_post]
    else
     flash.now[:alert] = "There was an error saving the post. Please try again."
     render :new
    end
  end
  
end
