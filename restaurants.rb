require 'sqlite3'
require 'singleton'

class RestaurantsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super("reviews.db")
    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

class Chef
  def self.find(id)
    sql = <<-SQL
      SELECT *
      FROM chefs
      WHERE chef_id = ?
    SQL
    chef_data = RestaurantsDatabase.execute(sql, id)
    return nil if chef_data.empty?
    Chef.new(chef_data[0])
  end

  def initialize(data)
    @chef_id = data["chef_id"]
    @first_name = data["first_name"]
    @last_name = data["last_name"]
    @mentor_id = data["mentor_id"]
  end

  attr_accessor :first_name, :last_name, :mentor_id

end

class Restaurant
  def self.find(id)
    sql = <<-SQL
      SELECT *
      FROM restaurants
      WHERE restaurant_id = ?
    SQL
    restaurant_data = RestaurantsDatabase.execute(sql, id)
    return nil if restaurant_data.empty?
    Restaurant.new(restaurant_data[0])
  end

  def initialize(data)
    @restaurant_id = data["restaurant_id"]
    @name = data["name"]
    @neighborhood = data["neighborhood"]
    @cuisine = data["cuisine"]
  end

  def self.find_by_neighborhood(neighborhood)
    sql = <<-SQL
      SELECT *
      FROM restaurants
      WHERE neighborhood = ?
    SQL
    data = RestaurantsDatabase.execute(sql, neighborhood)
    data.map {|restaurant| Restaurant.new(restaurant)}
  end

  attr_accessor :restaurant_id, :name, :neighborhood, :cuisine

end