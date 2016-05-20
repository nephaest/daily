class AddOwnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :owner, :boolean, default: false
    # initialize the availability of existing users
    User.find_each do |user|
      user.owner = user.position == "I'm a owner" || user.position == "Business owner"
      user.save!
    end
  end
end
