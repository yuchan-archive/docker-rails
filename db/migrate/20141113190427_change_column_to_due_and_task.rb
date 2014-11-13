class ChangeColumnToDueAndTask < ActiveRecord::Migration
  def change
      change_column :todos, :task, :string, null: false
      change_column :todos, :due, :date,  null: false
  end
end
