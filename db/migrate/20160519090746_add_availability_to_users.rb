class AddAvailabilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :availability, :text
    # initialize the availability of existing users
    User.find_each do |user|
      unless user.owner?
        user.availability = IceCube::Schedule.new(Date.today) { |s| s.add_recurrence_rule IceCube::Rule.daily }
        user.save!
      end
    end
  end
end
