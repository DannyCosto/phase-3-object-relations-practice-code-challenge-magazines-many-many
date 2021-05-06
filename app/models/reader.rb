class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine_instance, price_int)
        Subscription.create(magazine_id: magazine_instance.id, reader_id: self.id, price: price_int)
    end

    def total_subscription_price
        self.subscriptions.sum(:price)
    end

    def cancel_subscription(mag_instance)
        sub = Subscription.find_by(magazine_id: mag_instance, reader_id: self.id)
        sub.destroy
    end


end