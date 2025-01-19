class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :user, null: false, foreign_key: true
      t.references :disliked_user, null: false, foreign_key: true
      t.boolean :liked

      t.timestamps
    end
  end
end
