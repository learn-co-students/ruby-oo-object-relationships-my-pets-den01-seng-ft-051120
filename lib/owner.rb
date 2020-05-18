require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize name
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  def buy_cat cat
    Cat.new cat, self
  end

  def buy_dog dog
    Dog.new dog, self
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def sell_pets
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def say_species
    "I am a human."
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end
end