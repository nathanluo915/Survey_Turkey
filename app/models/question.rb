class Question < ActiveRecord::Base
  belongs_to :survey
  has_many  :answers

  validates :content, presence: true
  validates :content, length:{in:1..150}
end
