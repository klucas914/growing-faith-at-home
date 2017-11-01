class Week < ApplicationRecord
  has_many :reading_lists
  has_many :faith5s
  has_many :service_ideas
  has_many :creative_responses
  has_many :mealtime_prayers
  has_many :memory_verses
  has_many :shares
  has_many :talks
  has_many :prays
  has_many :blesses
  #belongs_to :season
  scope :current, -> { 
    where("(published_on < ?) AND 
           (archived_on > ?)", 
            Time.now, Time.now)
  }
  scope :archived, -> { where("archived_on <?", Time.now)}

end
