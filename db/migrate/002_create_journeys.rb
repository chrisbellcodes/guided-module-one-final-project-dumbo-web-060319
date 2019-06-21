class CreateJourneys < ActiveRecord::Migration[5.0]
    def change
        create_table :journeys do |t|
            t.string :scenario
            t.string :week_number
            t.integer :user_id
        end
    end
end