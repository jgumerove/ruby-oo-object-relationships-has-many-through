class Customer

    attr_accessor :name, :age  #because we have an attribute accessor the customer can change their name and age

  @@all = [] #tracks every instance of customer upon creatinon

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self #see note directly above
  end

  def self.all
    @@all  #so can print all the instances of this class 
  end

#below code gives the customer class the ability to create new meals as a customer -- automatically associates each new meal with the customer that created it


  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip) #note that each meal in Meal class is initialized with a customer/ self here refers to that argument which is also an instance of the customer class in this example
  end 

  #customer going to look at all of the meals & then select only the ones that belong to him/her (below)

  def meals
    Meal.all.select{|meal| meal.customer == self} #notice will have nearly identical code with same method name for waiters
  end

#since already have an array of meals through #meals above we can reuse it and write a method to get the waiters associated with a customer below

  def waiters
    meals.collect {|meal| meal.waiter}
  end
  
end