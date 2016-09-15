class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.column :move, :integer
      t.column :created_at, :datetime
    end
  end
end
