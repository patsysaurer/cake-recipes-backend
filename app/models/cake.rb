class Cake < ApplicationRecord
    belongs_to :user
    validates :cakeName, presence: true
end
