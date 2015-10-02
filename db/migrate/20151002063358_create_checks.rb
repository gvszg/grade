class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.boolean :check
      t.integer :user_id
      t.references :checkable, polymorphic: true
      t.timestamps
    end
  end
end
