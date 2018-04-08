class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :scheduled_at
      t.boolean :is_available

      t.timestamps
    end
  end
end
