class Model

  def self.table_name
    raise NotImplementedError
  end

  def self.find(id)
    sql = <<-SQL 
      SELECT *
      FROM #{self.table_name}
      WHERE id = ?
      SQL
    data = RestaurantsDatabase.execute(sql, id)
  end

   def self.find(id)
    sql = <<-SQL 
      SELECT *
      FROM #{self.table_name}
      SQL
    data = RestaurantsDatabase.execute(sql)
  end

  def update
   query = self.class.column_names.map do {|column| "#{column} = ?"}.join(", ")
    sql = <<-SQL
      UPDATE #{self.table_name}
      SET #{query}
      WHERE user_id = ?
    SQL
    a = (sql) + self.send(:method_name)
    QuestionsDatabase.instance.execute(sql)
  end


  def save
    if @user_id
      update
    else
      sql = <<-SQL

      SQL
    end
  end

  protected

  def self.attr_accessible(*column_names)
    column_names.each do |name|
      self.send(attr_accessor, name)
    end
    @column_names = column_names
  end

  def self.column_names
    @column_names
  end
end
