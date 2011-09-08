# Part of Active Merchant Payment System
class OrderTransaction < ActiveRecord::Base
    belongs_to :storeaccount
    serialize :params

    def response=(response)
        self.success       = response.success?
        self.authorization = response.authorization
        self.message       = response.message
        self.params        = response.params
        rescue ActiveMerchant::ActiveMerchantError => e
        self.success       = false
        self.authorization = nil
        self.message       = e.message
        self.params        = {}
      end
  end
end
