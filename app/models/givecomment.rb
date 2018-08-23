class Givecomment < ActiveRecord::Base
    belongs_to :give
    belongs_to :user
end
