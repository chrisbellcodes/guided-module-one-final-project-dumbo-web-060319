class Outcome < ActiveRecord::Base
    has_many :journey
    has_many :user, through: :journey
end