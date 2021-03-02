require 'pry'

class Waiter

    attr_accessor :name, :yrs_experience

  @@all = [] #stores every instance upon creation (similar to customer class)

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip) #notice how dont have to put waiter in as an argument in signature but inside of method need to 
  end
  
  #need a way for CUSTOMER and WAITER instances to get infomration about each other 
  #only way to do this is through the meals they have created
  #going to consult the MEAL class from the CUSTOMER and WAITER classes 

  def meals
    Meal.all.select{|meal| meal.waiter == self} #iterating through every instance of Meal and returning only the ones that belong to current waiter instance
  end

  def best_tipper
    best_tipped_meal = meals.sort{|meal1, meal2| meal1.tip <=> meal2.tip}.last
    best_tipped_meal.customer
  end

end

