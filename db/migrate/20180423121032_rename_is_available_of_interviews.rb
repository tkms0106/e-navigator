class RenameIsAvailableOfInterviews < ActiveRecord::Migration[5.1]
  def change
    rename_column :interviews, :is_available, :availability
  end
end
