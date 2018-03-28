class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: [:male, :female, :other]
  before_validation :calc_age
  validates :age, numericality: { greater_than_or_equal_to: 0 }

  private
    def calc_age
      date_format = "%Y%m%d"
      self.age = (Date.today.strftime(date_format).to_i - date_of_birth.strftime(date_format).to_i) / 10000
    end
end
