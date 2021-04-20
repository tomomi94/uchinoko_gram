class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pet_type
  belongs_to :gender
  belongs_to :age

  with_options presence: true do
    validates :text
    validates :image
    validates :pet_type_id, numericality: { other_than: 1 }
  end
  with_options numericality: { other_than: 1 } do
    validates :gender_id
    validates :age_id
  end
end
