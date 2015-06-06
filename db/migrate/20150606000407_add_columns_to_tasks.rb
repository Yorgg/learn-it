class AddColumnsToTasks < ActiveRecord::Migration
  def change
   	add_column :tasks, :description, :string
  	add_column :tasks, :date, :date
    add_column :tasks, :complete, :boolean
  	add_column :tasks, :notes, :text
  	add_column :tasks, :importance, :integer
  	add_column :tasks, :time, :time
    
    add_index :tasks, :date
    add_foreign_key :tasks, :users
  end
end
