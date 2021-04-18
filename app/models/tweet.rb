class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pet_type
  belongs_to :gender
  belongs_to :age

end
