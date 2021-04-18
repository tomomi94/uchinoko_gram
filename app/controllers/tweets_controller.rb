class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @tweets = Tweet.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end
end

private

def tweet_params
  params.require(:tweet).permit(:image, :text, :pet_type_id, :gender_id, :age_id).merge(user_id: current_user.id)
end

