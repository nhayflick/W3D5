require_relative 'restaurants_database'

class Review
  def self.find(id)
    sql = <<-SQL
      SELECT *
      FROM reviews
      Where review_id = ?
    SQL
    data = RestaurantsDatabase.execute(sql, id)[0]
    Review.new(data)
  end

  def self.find_by_critic(id)
   sql = <<-SQL
      SELECT *
      FROM reviews
      Where reviewer_id = ?
    SQL
    data = RestaurantsDatabase.execute(sql, id)
    data.map {|review| Review.new(review)}
  end

  def self.find_by_restaurant(id)
    sql = <<-SQL
      SELECT *
      FROM reviews
      Where restaurant_id = ?
    SQL
    data = RestaurantsDatabase.execute(sql, id)
    data.map {|review| Review.new(review)}
  end

  def initialize(data)
    @review_id = data["review_id"]
    @reviewer_id = data["reviewer_id"]
    @restaurant_id = data["restaurant_id"]
    @body = data["body"]
    @score = data["score"]
    @date_of_review = data["date_of_review"]
  end

  def self.find_by_chef(id)
    sql = <<-SQL
      SELECT *
      FROM chef_tenures AS ct JOIN reviews AS r ON (ct.restaurant_id = r.restaurant_id)
      WHERE ct.chef_id = ?
      AND r.date_of_review BETWEEN ct.start_date AND ct.end_date
    SQL
    data = RestaurantsDatabase.execute(sql, id)
    data.each {|chef| p (chef.values)}
    data.map {|review| Review.new(review)}
  end

end