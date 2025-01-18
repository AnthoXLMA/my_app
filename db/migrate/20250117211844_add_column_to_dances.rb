class AddColumnToDances < ActiveRecord::Migration[7.1]
  def change
    add_column :dances, :niveau, :string
  end
end
