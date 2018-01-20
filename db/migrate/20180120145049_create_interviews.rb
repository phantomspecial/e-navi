class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.references :user, foreign_key: true, null: false
      t.datetime :starttime
      t.integer :status
      t.timestamps
    end
  end
end
