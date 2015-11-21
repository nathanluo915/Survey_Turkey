class SurveysUser < ActiveRecord::Base
  belongs_to  :voter, class_name: "User"
  belongs_to  :survey

  validates_uniqueness_of :survey,  scope: :user
end
