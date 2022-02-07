class CreateUserAppliedJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_applied_jobs do |t|
      t.integer :user_id
      t.integer :job_id
      t.boolean :status

      t.timestamps
    end
  end
end
