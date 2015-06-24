class AddColumnToGoals < ActiveRecord::Migration
  def change
  	add_column :goals, :color, :integer
  end
end
