require_relative 'restaurants_database'


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

  def proteges
    sql = <<-SQL
      SELECT *
      FROM chefs
      WHERE mentor_id = ?
    SQL
    data = RestaurantsDatabase.execute(sql, @chef_id)
    data.map {|chef| Chef.new(chef)}
  end

  def num_proteges
    sql = <<-SQL
      SELECT COUNT(*) AS num_of_proteges
      FROM chefs
      WHERE mentor_id = ?
    SQL
    RestaurantsDatabase.execute(sql, @chef_id)[0]
  end

  def reviews
    Review.find_by_chef(@chef_id)
  end

  def coworkers
    sql = <<-SQL
      SELECT DISTINCT c.chef_id, c.first_name, c.last_name, c.mentor_id
      FROM chef_tenures AS l
      JOIN chef_tenures  AS r ON (l.restaurant_id = r.restaurant_id)
      JOIN chefs AS c ON (r.chef_id = c.chef_id)
      WHERE l.chef_id = ? 
      AND r.chef_id != l.chef_id
      AND ((l.end_date BETWEEN r.start_date AND r.end_date) 
      OR (r.end_date BETWEEN r.start_date AND r.end_date))
      SQL
    data = RestaurantsDatabase.execute(sql, @chef_id)
    data.each {|chef| p (chef.values)}
    data.map {|chef| Chef.new(chef)}
  end

end