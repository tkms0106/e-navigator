class Interview < ApplicationRecord
  validates :scheduled_at, presence: true
  belongs_to :user
end
