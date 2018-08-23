class Sellcomment < ActiveRecord::Base
    belongs_to :user
    belongs_to :sell
end
