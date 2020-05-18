class Owner
  attr_reader :name, :species

  @@all = []

  def initialize name
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat cat
    new_cat = Cat.new(cat, self)
  end

  def buy_dog dog
    new_dog = Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end

  def all_pets
    self.dogs.concat(self.cats)
  end

  def sell_pets
    self.all_pets.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end