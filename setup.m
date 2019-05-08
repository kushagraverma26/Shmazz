function conn = setup()
  pkg load database;
  pkg load image;
  pkg load signal;
  pkg load control;
  conn = pq_connect (setdbopts ('host', 'localhost', "dbname", "dsaa", "user", "dsaa_user", "password", "password"));
end