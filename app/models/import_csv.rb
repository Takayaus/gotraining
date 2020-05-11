class ImportCsv < ApplicationRecord

    # ImportCsv.import('db/csv_data/gym_data.csv')

    def self.import(path)
        CSV.foreach(path, headers: true) do |row|
            Gym.create(
                name: row["name"]
            )
        end
    end
end