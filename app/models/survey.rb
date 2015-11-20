class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :answers, through: :questions

  validates :title, presence: true
  validates :title, length:{in: 1..100}
end
