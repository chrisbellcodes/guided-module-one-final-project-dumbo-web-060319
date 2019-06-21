class CreateOutcomes < ActiveRecord::Migration[5.0]
    def change
        create_table :outcomes do |t|
            t.string :choice_prompt
            t.string :consequence
            t.integer :crew_modifier
            t.integer :choice
            t.integer :journey_id
        end 
    end
end