class ChangeJourneysWeekNumToInteger < ActiveRecord::Migration[5.0]
    def change
        change_column :journeys, :week_number, :integer
    end
end