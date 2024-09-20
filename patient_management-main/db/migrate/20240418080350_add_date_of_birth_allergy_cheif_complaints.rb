class AddDateOfBirthAllergyCheifComplaints < ActiveRecord::Migration[7.1]
  def change
    add_column :patients , :date_of_birth, :date
    add_column :patients , :allergies, :text
    add_column :patients , :chief_complaints, :text
  end
end
