class Room < ActiveRecord::Base
  has_attached_file :room_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :room_image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  acts_as_likeable



  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
