class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category
  validates :title, :location, :description, presence: true

  def expired?
    created_at >= 90.days.ago
  end

end
