class User < ActiveRecord::Base
  has_many :photos
  has_many :reviews
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true
 
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    if search 
      find(:all, :condition => ['name LIKE ?', "%#{seacrch}%"])
    else 
      find(:all)
    end
  end
end