class Sell < ActiveRecord::Base
    has_many :sellcomments
    belongs_to :user
end
