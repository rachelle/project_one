class User < ActiveRecord::Base
  has_many :photos
  has_many :reviews
  has_secure_password


  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true
 
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :name

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query 
    where("title like ?", "%#{query}%")
  end

end