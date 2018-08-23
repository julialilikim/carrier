class Need < ActiveRecord::Base
    belongs_to :user
    has_many :needcomments
end
