class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.belongs_to :game, index: true
      t.column :x, :integer
      t.column :y, :integer
      t.column :created_at, :datetime
    end
  end
end
