class AddDateTimeToPatient < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :appointment_date, :datetime
  end
end
