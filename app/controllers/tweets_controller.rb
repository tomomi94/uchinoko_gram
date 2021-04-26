class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :ensure_user, only: [:edit, :update, :destroy]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
    @likes_count = Like.where(tweet_id: @tweet.id).count
  end

  def edit
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :text, :pet_type_id, :gender_id, :age_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def ensure_user
    @tweets = current_user.tweets
    @tweet = @tweets.find_by(id: params[:id])
    redirect_to root_path unless @tweet
  end

end
