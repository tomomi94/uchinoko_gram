class Hashtag < ApplicationRecord

  has_many :tweets, through: :tweet_hashtags
  has_many :tweet_hashtags

end
