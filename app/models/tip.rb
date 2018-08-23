class Tip < ActiveRecord::Base
    has_many :tipcomments
    has_many :likes
    belongs_to :user
end
