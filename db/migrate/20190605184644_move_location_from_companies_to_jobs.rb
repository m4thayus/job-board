class MoveLocationFromCompaniesToJobs < ActiveRecord::Migration[5.2]
    def change
        remove_column :companies, :location
        add_column :jobs, :location, :string
    end
end
