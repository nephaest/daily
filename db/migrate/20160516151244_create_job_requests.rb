class CreateJobRequests < ActiveRecord::Migration
  def change
    create_table :job_requests do |t|
      t.integer :staff_size
      t.string :position
      t.datetime :start_time
      t.datetime :end_time
      t.integer :max_price
      t.references :facility, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
