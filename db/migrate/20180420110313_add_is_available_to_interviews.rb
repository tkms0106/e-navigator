class AddIsAvailableToInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :is_available, :integer
  end
end
