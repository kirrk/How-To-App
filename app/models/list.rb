class List < ActiveRecord::Base
  has_many :item
  validates :title, presence: true
end
