class Gym < ApplicationRecord
    has_many :posts

    attribute :name
end
