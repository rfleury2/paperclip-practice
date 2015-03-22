class Team < ActiveRecord::Base

  has_attached_file :shield, :styles => { :medium => "300x300>", :thumb => "100x100>" }# Not needed since it is obligatory, :default_url => "/assets/images/missing.png"
  validates_attachment_content_type :shield, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :coach, presence: true

  validates_attachment_presence :shield
  validates_attachment_size :shield, less_than: 2.megabytes
  validates_attachment_content_type :shield, content_type: ['image/jpeg', 'image/png', 'image/svg']

end
