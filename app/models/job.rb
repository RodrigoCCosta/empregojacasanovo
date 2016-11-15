class Job < ApplicationRecord
  belongs_to :company
  validates :title, :location, :category, :description, presence: true
end
