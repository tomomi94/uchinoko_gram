class Like < ApplicationRecord
  belogns_to :user
  belongs_to :tweet

  validates_uniqueness_of :tweet_id, scope: :user_id
end
