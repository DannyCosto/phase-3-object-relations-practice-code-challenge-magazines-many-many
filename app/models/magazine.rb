class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list 
    readers_arr = self.readers
    emails_arr = readers_arr.map {|reader_instance| reader_instance.email}
    emails_arr.join(';')
  end

  def self.most_popular
    most_popular_magazine = Magazine.first

    Magazine.all.each do |mag_instance|
        if mag_instance.subscriptions.count > most_popular_magazine.subscriptions.count
            most_popular_magazine = mag_instance
        end
    end
    most_popular_magazine
  end


end