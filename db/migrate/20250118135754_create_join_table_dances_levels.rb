class CreateJoinTableDancesLevels < ActiveRecord::Migration[7.1]
  def change
    create_join_table :dances, :levels do |t|
      t.index :dance_id
      t.index :level_id
    end
  end
end
