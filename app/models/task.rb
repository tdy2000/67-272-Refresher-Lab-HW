class Task < ApplicationRecord

    has_many :chores
    has_many :children, through: :chores

    validates_presence_of :name
    # points need to be a positive integer, unclear whether a chore can be worth zero
    # points, so I have decided to allow it
    validates_numericality_of :points, only_integer: true, greater_than: -1

    scope :alphabetical, -> { order('name') }
    scope :active, -> { where(active: true) }
end
