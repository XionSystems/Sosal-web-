# SQL Reference Sheet
# t.integer  "user_id"
# t.integer  "plan"
# t.string   "plan_title"
# t.integer  "total_price"
#
class Storeplan < ActiveRecord::Base
    attr_accessible :plan, :plan_title, :total_price, :limit
    belongs_to :user
    has_many :storeaccounts
end
