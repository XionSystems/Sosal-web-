# SQL Reference Sheet
# t.integer  "storeplan_id"
# t.string   "ip_address"
# t.string   "first_name"
# t.string   "last_name"
# t.string   "card_type"
# t.date     "card_expires_on"
#
class Storeaccount < ActiveRecord::Base
    attr_accessor :card_number, :card_verification
    attr_accessible :first_name, :last_name, :card_type, :card_expires_on, :card_number, 
                    :card_verification, :ip_address
    belongs_to :storeplan
    has_many :transactions, :class_name => "OrderTransaction"
    
    ip_regex = /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/
    
    validates :storeplan_id, :presence => true
    validates :ip_address, :presence => true,
                           :format => {:with => ip_regex}
    validates :first_name, :presence => true
    validates :last_name, :presence => true
    
    
    before_validation :validate_card, :on => :create

    def purchase
        response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
        transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
        cart.update_attribute(:purchased_at, Time.now) if response.success?
        response.success?
    end

    def price_in_cents
        (storeplan.total_price*100).round
    end

    private

    def purchase_options
    {
        :ip => ip_address,
        :billing_address => {
        :name     => "Zach Easley",
        :address1 => "303 S Suburban",
        :city     => "Springfield",
        :state    => "MO",
        :country  => "US",
        :zip      => "65802"
          }
    }
    end

    def validate_card
    unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
         end
       end
    end

    def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
          :type               => card_type,
          :number             => card_number,
          :verification_value => card_verification,
          :month              => card_expires_on.month,
          :year               => card_expires_on.year,
          :first_name         => first_name,
          :last_name          => last_name
        )
     end
end
