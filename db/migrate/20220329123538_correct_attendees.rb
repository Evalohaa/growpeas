class CorrectAttendees < ActiveRecord::Migration[6.1]
  def change
    change_column :courses, :max_of_attendees, 'integer USING CAST(max_of_attendees AS integer)'
  end
end
