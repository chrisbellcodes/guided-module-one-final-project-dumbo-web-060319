class AddDefaultValueToUsersNumOfCrew < ActiveRecord::Migration[5.0]
    def change
        change_column :users, :num_of_crew, :integer, :default => 7
    end
end