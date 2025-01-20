class AddExperienceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :experience, :string
  end
end
