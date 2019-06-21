class AddWeekNumberColumnToOutcomes < ActiveRecord::Migration[5.0]
    def change
        add_column :outcomes, :week_number, :integer
    end
end