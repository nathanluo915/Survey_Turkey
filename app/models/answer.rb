class Answer < ActiveRecord::Base
  has_many :answers_voters
  has_many :voters, through: :answers_voters, source: :users
  belongs_to  :question


end
