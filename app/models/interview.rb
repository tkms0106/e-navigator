class Interview < ApplicationRecord
  enum availability: { pending: 0, approval: 1, disapproval: 2 }
  validates :scheduled_at, presence: true
  validates :availability, presence: true
  belongs_to :user
end
