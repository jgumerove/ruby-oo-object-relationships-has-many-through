class Meal

    attr_accessor :waiter, :customer, :total, :tip

  @@all = [] #keeps track of each instance

  def initialize(waiter, customer, total, tip=0) #notice how the tip has a default value of 0 and how each instance must be initialized with these arguments
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end

  def self.all
    @@all
  end
#going to give the customer and waiter instances the ability to get all the info about the meal that they need to store themselves 
end