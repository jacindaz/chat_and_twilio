class CreateRoomUserPostTables < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.timestamps
    end

    create_table :users do |t|
      t.string :username
      t.timestamps
    end

    create_table :posts do |t|
      t.text :body
      t.integer :user_id
      t.integer :room_id
      t.timestamps
    end
  end
end
