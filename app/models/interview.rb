class Interview < ApplicationRecord
  belongs_to :user
  validates :scheduled_at, presence: true
end
