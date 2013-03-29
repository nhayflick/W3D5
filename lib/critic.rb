require_relative 'restaurants_database'
require_relative 'review.rb'

class Critic
  def self.find(id)
    sql = <<-SQL
      SELECT *
      FROM critics
      WHERE critic_id = ?
    SQL
    data = RestaurantsDatabase.execute(sql, id)[0]
    Critic.new(data)
  end

  def initialize(data)
    @critic_id = data["critic_id"]
    @screen_name = data["screen_name"]
  end

  attr_accessor :critic_id, :screen_namea

  def reviews
    Review.find_by_critic(@critic_id)
  end

  def average_review_score
    sql = <<-SQL
      SELECT AVG(score) AS average_review_score
      FROM reviews
      WHERE reviewer_id = ?
    SQL
    RestaurantsDatabase.execute(sql, @critic_id)
  end

  def unreviewed_restaurants
    Restaurant.find_unreviewed_by_critic(@critic_id)
  end
end