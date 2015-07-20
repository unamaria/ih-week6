class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :name
    	t.timestamp :completion

    	t.timestamps null: false # shortcut to create created_at and updated_at
    end
  end
end
