class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :xbox_id
      t.string :gamertag

      t.timestamps
    end
  end
end
