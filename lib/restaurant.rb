require_relative 'restaurants_database'
require_relative 'review'

class Restaurant < Model
  # def self.find(id)
  #   sql = <<-SQL
  #     SELECT *
  #     FROM restaurants
  #     WHERE restaurant_id = ?
  #   SQL
  #   restaurant_data = RestaurantsDatabase.execute(sql, id)
  #   return nil if restaurant_data.empty?
  #   Restaurant.new(restaurant_data[0])
  # end

  # def initialize(data)
  #   @restaurant_id = data["restaurant_id"]
  #   @name = data["name"]
  #   @neighborhood = data["neighborhood"]
  #   @cuisine = data["cuisine"]
  # end

  # def self.find_by_neighborhood(neighborhood)
  #   sql = <<-SQL
  #     SELECT *
  #     FROM restaurants
  #     WHERE neighborhood = ?
  #   SQL
  #   data = RestaurantsDatabase.execute(sql, neighborhood)
  #   data.map {|restaurant| Restaurant.new(restaurant)}
  # end

  # def self.find_unreviewed_by_critic(id)
  #   sql = <<-SQL
  #     SELECT *
  #     FROM restaurants
  #     WHERE restaurant_id NOT IN(SELECT restaurant_id FROM reviews WHERE reviewer_id = ?)
  #   SQL
  #   data = RestaurantsDatabase.execute(sql, id)
  #   data.map {|restaurant| Restaurant.new(restaurant)}
  # end

  # def self.top_restaurants(n = 5)
  #   sql = <<-SQL
  #     SELECT *
  #     FROM restaurants AS res JOIN reviews AS rev ON (res.restaurant_id = rev.restaurant_id)
  #     GROUP BY restaurant_id
  #     ORDER BY AVG(score) DESC
  #     LIMIT(?)
  #   SQL
  #   data = RestaurantsDatabase.execute(sql, n)
  #   data.map {|restaurant| Restaurant.new(restaurant)}
  # end

  # def self.highly_reviewed_restaurants(min_reviews = 2)
  #   sql = <<-SQL
  #     SELECT COUNT(reviewer_id) AS reviews
  #     FROM restaurants AS res JOIN reviews AS rev ON (res.restaurant_id = rev.restaurant_id)
  #     GROUP BY rev.restaurant_id
  #     WHERE reviews > 1
  #     ORDER BY Count(rev.reviewer_id) DESC
  #   SQL
  #   data = RestaurantsDatabase.execute(sql, min_reviews)
  #   data.map {|restaurant| Restaurant.new(restaurant)}
  # end 

  #  def self.highly_reviewed_restaurants(min_reviews = 2)
  #   sql = <<-SQL
  #     SELECT *, COUNT(reviewer_id) AS review
  #     FROM restaurants AS res JOIN reviews AS rev ON (res.restaurant_id = rev.restaurant_id)
  #     GROUP BY rev.restaurant_id
  #     HAVING reviews >= ?
  #     ORDER BY reviews DESC
  #   SQL
  #   data = RestaurantsDatabase.execute(sql, min_reviews)
  #   data.map {|restaurant| Restaurant.new(restaurant)}
  # end 

  # def reviews
  #   Review.find_by_restaurant(@restaurant_id)
  # end

  # def average_review_score
  #   sql = <<-SQL
  #     SELECT AVG(score) AS average_review_score
  #     FROM reviews
  #     WHERE restaurant_id = ?
  #   SQL
  #   RestaurantsDatabase.execute(sql, @restaurant_id)
  # end

  # attr_accessor :restaurant_id, :name, :neighborhood, :cuisine

end