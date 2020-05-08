class ImportCsv < ApplicationRecord
    def self.import(path)
        CSV.foreach(path, headers: true) do |row|
            Gym.create(
                name: row["name"]
            )
        end
    end
end