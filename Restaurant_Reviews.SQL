CREATE TABLE chefs (
  chef_id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  mentor_id INTEGER,
  FOREIGN KEY(mentor_id) REFERENCES chefs(chef_id));

CREATE TABLE restaurants (
  restaurant_id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  neighborhood VARCHAR(255),
  cuisine VARCHAR(255)
  );

CREATE TABLE chef_tenures (
  tenure_id INTEGER PRIMARY KEY,
  chef_id INTEGER NOT NULL,
  restaurant_id INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  FOREIGN KEY(chef_id) REFERENCES chefs(chef_id),
  FOREIGN KEY(restaurant_id) REFERENCES restaurants(restaurant_id)
  );

CREATE TABLE critic (
  critic_id INTEGER PRIMARY KEY,
  screen_name VARCHAR(255)
  );

CREATE TABLE reviews (
  review_id INTEGER PRIMARY KEY,
  reviewer_id INTEGER NOT NULL,
  restaurant_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  score INTEGER NOT NULL,
  date_of_review DATE,
  FOREIGN KEY(reviewer_id) REFERENCES critic(critic_id)
  FOREIGN KEY(restaurant_id) REFERENCES restaurants(restaurant_id)
  CHECK(score BETWEEN 1 AND 20)
  );

INSERT INTO chefs ('first_name', 'last_name', 'mentor_id')
  VALUES ('Thomas', 'McNaughton', 2);

INSERT INTO chefs ('first_name', 'last_name', 'mentor_id')
  VALUES ('Alice', 'Waters', null);

INSERT INTO chefs ('first_name', 'last_name', 'mentor_id')
  VALUES ('Gordon', 'Ramsay', 4);

INSERT INTO chefs ('first_name', 'last_name', 'mentor_id')
  VALUES ('Von Claude', 'Boont', 2);

INSERT INTO restaurants('name', 'neighborhood', 'cuisine')
  VALUES ('Flour and Water', 'The Mish', 'Italian');

INSERT INTO restaurants('name', 'neighborhood', 'cuisine')
  VALUES ('Subway', 'Downtown', 'Subs');

INSERT INTO restaurants('name', 'neighborhood', 'cuisine')
  VALUES ('Chez Panisse', 'Berekeley', 'Californian');

INSERT INTO restaurants('name', 'neighborhood', 'cuisine')
  VALUES ('Range', 'The Mish', 'Californian');

INSERT INTO restaurants('name', 'neighborhood', 'cuisine')
  VALUES ('Nom nom', 'Richmond', 'Sushi');

INSERT INTO chef_tenures('chef_id', 'restaurant_id', 'start_date', 'end_date')
  VALUES (1, 1, 01-01-2002, null);

INSERT INTO chef_tenures('chef_id', 'restaurant_id', 'start_date', 'end_date')
  VALUES (3, 5, 03-01-2004, 05-01-2009);

INSERT INTO chef_tenures('chef_id', 'restaurant_id', 'start_date', 'end_date')
  VALUES (3, 2, 06-01-2009, 12-01-2009);

INSERT INTO chef_tenures('chef_id', 'restaurant_id', 'start_date', 'end_date')
  VALUES (2, 3, 01-01-1980, null);

INSERT INTO chef_tenures('chef_id', 'restaurant_id', 'start_date', 'end_date')
  VALUES (4, 1, 06-01-2007, 06-06-2007);

INSERT INTO chef_tenures('chef_id', 'restaurant_id', 'start_date', 'end_date')
  VALUES (4, 2, 07-01-2007, 07-06-2007);

INSERT INTO chef_tenures('chef_id', 'restaurant_id', 'start_date', 'end_date')
  VALUES (4, 5, 08-01-2007, 09-01-2007);

INSERT INTO chef_tenures('chef_id', 'restaurant_id', 'start_date', 'end_date')
  VALUES (4, 5, 08-01-2007, 09-01-2007);

INSERT INTO critic('screen_name')
  VALUES ('LFitz');

INSERT INTO critic('screen_name')
  VALUES ('NoReservations');

INSERT INTO reviews('reviewer_id', 'restaurant_id', 'body', 'score', 'date_of_review')
  VALUES (1, 1, 'Was very dissapointed to discover that this place did not actually serve flour. Their water on the otherhand was exquisite.', 3, 03-04-2005);

INSERT INTO reviews('reviewer_id', 'restaurant_id', 'body', 'score', 'date_of_review')
  VALUES (1, 2, 'OMG Italian BLT.', 20, 08-05-2009);

INSERT INTO reviews('reviewer_id', 'restaurant_id', 'body', 'score', 'date_of_review')
  VALUES (2, 2, 'Teriyaki Chicken init? I luv this subway. Chef is kinda a buffoon tho.', 5, 08-05-2009);