class Answer < ActiveRecord::Base
  has_and_belongs_to_many :voters, class_name: "User"
  belongs_to :question
  has_one :survey, through: :question

  validates :content, presence: true
  validates :content, length:{in:1..150}
end
