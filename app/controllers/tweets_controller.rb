class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_tweet, only: [:show, :edit]

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
  end

  def edit
  end

  private

  def tweet_params
  params.require(:tweet).permit(:image, :text, :pet_type_id, :gender_id, :age_id).merge(user_id: current_user.id)
  end

  def set_tweet
  @tweet = Tweet.find(params[:id])
  end

end