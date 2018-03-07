class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @msg = ["Sorry."]

    if self.user.tickets < self.attraction.tickets
      @msg << "You do not have enough tickets to ride the #{self.attraction.name}."
    end

    if self.user.height < self.attraction.min_height
      @msg << "You are not tall enough to ride the #{attraction.name}."
    end

    if @msg.count > 1
      @msg.join(" ")
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end


end
