class Rating < ActiveRecord::Base
  belongs_to :review
  belongs_to :user
  belongs_to :rating
end
