class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo 

  has_many :ratings

  validates :content, presence: true

  def average_rating 
    ratings.sum(:score) / ratings.size
  end
end
