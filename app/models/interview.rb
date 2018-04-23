class Interview < ApplicationRecord
  enum is_available: { pending: 0, approval: 1, disapproval: 2 }
  validates :scheduled_at, presence: true
  validates :is_available, presence: true
  belongs_to :user
end
