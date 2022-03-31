class RemoveAttebdeeCountFromCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :attendee_count, :string
  end
end
