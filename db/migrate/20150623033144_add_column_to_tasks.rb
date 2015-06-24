class AddColumnToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :goal_id , :integer, :references => "goals"
  	add_index :tasks, :goal_id 
  end
end
