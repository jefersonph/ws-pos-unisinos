class CreateLends < ActiveRecord::Migration
  def change
    create_table :lends do |t|
      t.string :to
      t.string :game_id
      t.references :user

      t.timestamps
    end
    add_index :lends, :user_id
  end
end
