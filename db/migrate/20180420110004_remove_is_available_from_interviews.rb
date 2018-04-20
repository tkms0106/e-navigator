class RemoveIsAvailableFromInterviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :interviews, :is_available, :boolean
  end
end
