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
    validates :image
    validates :text
    validates :pet_type_id, numericality: { other_than: 1 , message: 'を選択してください' }
  end

end
