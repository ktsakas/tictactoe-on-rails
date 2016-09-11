class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.timestamps
    end

    add_column :games, :moves, :integer, array: true, default: '{}'
  end
end
