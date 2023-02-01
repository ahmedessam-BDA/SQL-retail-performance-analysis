CREATE TABLE products(
  id         integer PRIMARY KEY,
  created_at text,
  date_time timestamp,
  category   text,
  ean        text,
  price      float,
  quantity   int default(5000),
  rating     float,
  title      text,
  vendor     text
);

CREATE TABLE users(
  id         integer PRIMARY KEY,
  created_at text,
  date_time timestamp,
  name       text,
  email      text,
  address    text,
  city       text,
  state      text,
  zip        text,
  birth_date text,
  latitude   float,
  longitude  float,
  password   text,
  source     text
);

CREATE TABLE orders(
  id         integer PRIMARY KEY,
  created_at text,
  date_time timestamp,
  user_id    bigint,
  product_id bigint,
  discount   float,
  quantity   int,
  subtotal   float,
  tax        float,
  total      float
);

CREATE TABLE reviews(
  id         integer PRIMARY KEY,
  created_at text,
  date_time timestamp,
  reviewer   text,
  product_id bigint,
  rating     int,
  body       text
);

