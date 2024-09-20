class AddSpeciallityToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :speciality, :string
  end
end
