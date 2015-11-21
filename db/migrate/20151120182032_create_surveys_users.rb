class CreateSurveysUsers < ActiveRecord::Migration
  def change
    create_table  :surveys_users do |t|
      t.integer :survey_id, null: false
      t.integer :voter_id, null: false
    end
  end
end
