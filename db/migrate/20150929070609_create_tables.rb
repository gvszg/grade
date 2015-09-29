class CreateTables < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :number
      t.timestamps
    end

    create_table :students do |t|
      t.integer :number
      t.string :name
      t.integer :year_id
      t.timestamps
    end

    create_table :states do |t|
      t.integer :student_id
      t.timestamps
    end

    create_table :results do |t|
      t.string :subject
      t.integer :score, :state_id
      t.timestamps
    end
  end
end
