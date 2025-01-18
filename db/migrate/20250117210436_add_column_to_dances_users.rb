class AddColumnToDancesUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :dances_users, :level, :string
  end
end
