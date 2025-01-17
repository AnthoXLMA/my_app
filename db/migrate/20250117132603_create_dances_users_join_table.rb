class CreateDancesUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :dances, :users do |t|
      t.index :dance_id
      t.index :user_id
    end
  end
end
