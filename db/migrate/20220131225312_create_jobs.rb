class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :salary_per_hour
      t.string :languages, array:true, default: []
      t.integer :shift_dates
      t.integer :user_id
      t.timestamps
    end
  end
end
