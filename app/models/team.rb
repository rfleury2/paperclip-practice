class Team < ActiveRecord::Base

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :coach, presence: true

end
