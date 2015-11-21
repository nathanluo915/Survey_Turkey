class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many  :surveys_users
  has_many  :voters, through: :surveys_users, source: :users

  validates :title, presence: true
  validates :title, length:{in: 1..100}
end
