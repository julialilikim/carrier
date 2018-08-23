class Give < ActiveRecord::Base
    has_many :givecomments
    belongs_to :user
end
