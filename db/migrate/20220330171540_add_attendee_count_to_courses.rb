class AddAttendeeCountToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :attendee_count, :integer, default: 0
  end
end
