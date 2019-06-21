class CreateCrews < ActiveRecord::Migration[5.0]
    def change
        create_table :crews do |c|
          c.string :name
          c.integer :user_id
        end
    end
end
