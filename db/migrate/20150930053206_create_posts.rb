class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.timestamps
    end

    create_table :users do |t|
      t.string :name, :role
      t.timestamps
    end
  end
end
