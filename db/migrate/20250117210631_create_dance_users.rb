class CreateDanceUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :dance_users do |t|

      t.timestamps
    end
  end
end
