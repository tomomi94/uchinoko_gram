class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pet_type
  belongs_to :gender
  belongs_to :age

  with_options presence: true do
    validates :text
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :pet_type_id
      validates :gender_id
      validates :age_id
    end
  end
end
