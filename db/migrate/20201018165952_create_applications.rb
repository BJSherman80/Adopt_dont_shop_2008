class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name_of_user
      t.string :address
      t.string :description
      t.string :pets
      t.string :status
    end
  end
end
