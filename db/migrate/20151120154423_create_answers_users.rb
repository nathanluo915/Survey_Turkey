class CreateAnswersUsers < ActiveRecord::Migration
  def change
    create_table :answers_users do |t|
      t.integer :voter_id, null:false
      t.integer :answer_id, null:false
    end
  end
end
