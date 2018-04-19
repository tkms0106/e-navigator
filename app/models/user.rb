class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: { not_known: 0, male: 1, female: 2, not_applicable: 9 }
  before_save :calc_age
  has_many :interviews, dependent: :delete_all

  private
    def calc_age
      return if self.date_of_birth.nil?
      date_format = "%Y%m%d"
      self.age = (Date.today.strftime(date_format).to_i - self.date_of_birth.strftime(date_format).to_i) / 10000
    end
end
