class AddLocationToJobRequests < ActiveRecord::Migration
  def change
    add_column :job_requests, :location, :string
  end
end
