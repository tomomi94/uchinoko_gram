class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes
  has_many :tweet_hashtags
  has_many :hashtag, through: :tweet_hashtags

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

  def tags_save(tag_list)
    if self.hashtag != nil
      tweet_tags_records = TweetHashtag.where(tweet_id: self.id)
      tweet_tags_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag = Hashtag.where(hashname: tag).first_or_create
      self.hashtag << inspected_tag
    end
  end

end
