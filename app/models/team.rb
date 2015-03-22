class Team < ActiveRecord::Base

  has_attached_file :shield, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :shield, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :coach, presence: true

end
