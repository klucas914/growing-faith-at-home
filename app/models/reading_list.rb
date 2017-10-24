class ReadingList < ApplicationRecord
  belongs_to :week
  has_many :days
end
