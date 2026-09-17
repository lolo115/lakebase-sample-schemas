-- Generated from Oracle sample schemas (MIT). Do not edit by hand.
SET search_path TO sh, public;

INSERT INTO channels VALUES
      ( 3, 'Direct Sales', 'Direct',   12, 'Channel total', 1 );
   INSERT INTO channels VALUES
      ( 9, 'Tele Sales',   'Direct',   12, 'Channel total', 1 );
   INSERT INTO channels VALUES
      ( 5, 'Catalog',      'Indirect', 13, 'Channel total', 1 );
   INSERT INTO channels VALUES
      ( 4, 'Internet',     'Indirect', 13, 'Channel total', 1 );
   INSERT INTO channels VALUES
      ( 2, 'Partners',     'Others',   14, 'Channel total', 1 );
   INSERT INTO countries VALUES
      (52790, 'US', 'United States of America', 'Northern America', 52797, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52776, 'DE', 'Germany',        'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52789, 'GB', 'United Kingdom', 'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52784, 'NL', 'Netherlands',    'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52780, 'IE', 'Ireland',        'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52777, 'DK', 'Denmark',        'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52779, 'FR', 'France',         'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52778, 'ES', 'Spain',          'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52788, 'TR', 'Turkey',         'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52786, 'PL', 'Poland',         'Eastern Europe', 52795, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52775, 'BR', 'Brazil',         'Southern America', 52798, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52773, 'AR', 'Argentina',      'Southern America', 52798, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52783, 'MY', 'Malaysia',       'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52782, 'JP', 'Japan',          'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52781, 'IN', 'India',          'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52774, 'AU', 'Australia',      'Australia', 52794, 'Oceania', 52805, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52785, 'NZ', 'New Zealand',    'Australia', 52794, 'Oceania', 52805, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52791, 'ZA', 'South Africa',   'Africa', 52792, 'Africa', 52800, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52787, 'SA', 'Saudi Arabia',   'Middle East', 52796, 'Middle East', 52804, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52772, 'CA', 'Canada',         'Northern America', 52797, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52771, 'CN', 'China',          'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52769, 'SG', 'Singapore',      'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52770, 'IT', 'Italy',          'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52792, 'MX', 'Mexico',         'Northern America', 52797, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52793, 'SE', 'Sweden',         'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52794, 'CH', 'Switzerland',    'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52795, 'CL', 'Chile',          'Southern America', 52798, 'Americas', 52798, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52796, 'TH', 'Thailand',       'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52797, 'NG', 'Nigeria',        'Africa', 52792, 'Africa', 52800, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52798, 'EG', 'Egypt',          'Middle East', 52796, 'Middle East', 52804, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52799, 'ZW', 'Zimbabwe',       'Africa', 52792, 'Africa', 52800, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52800, 'KW', 'Kuwait',         'Middle East', 52796, 'Middle East', 52804, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52801, 'IL', 'Israel',         'Middle East', 52796, 'Middle East', 52804, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52802, 'RO', 'Romania',        'Eastern Europe', 52795, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52803, 'HU', 'Hungary',        'Eastern Europe', 52795, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO products VALUES 
      (14,      'Pitching Machine and Batting Cage Combo', 'Pitching Machine and Batting Cage Combo', 'Training Aids and Equipment',
       2035,    'Training Aids and Equipment', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 999.99, 999.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (21,      'Speed Trainer Bats and Training Program', 'Speed Trainer Bats and Training Program', 'Training Aids and Equipment',
       2035,    'Training Aids and Equipment', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 899.99, 899.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (22,      'MLB Official Game Baseball w/ Display Case', 'MLB Official Game Baseball w/ Display Case', 'Baseballs',
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 24.99, 24.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (46,      '2 Competition Grade NFHS Baseballs', '2 Competition Grade NFHS Baseballs', 'Baseballs',
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 22.99, 22.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (47,      '6 Gallon Empty Ball Bucket', '6 Gallon Empty Ball Bucket', 'Baseballs',
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 28.99, 28.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (127,     'Genuine Series MIX Wood Bat', 'Genuine Series MIX Wood Bat', 'Bats',
       2036,    'Bats', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 36.99, 36.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (128,     'Slugger Youth Series Maple Bat', 'Slugger Youth Series Maple Bat', 'Bats',
       2036,    'Bats', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 27.99, 27.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (129,     'Pro Maple Bat', 'Pro Maple Bat', 'Bats',
       2036,    'Bats', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 192.99, 192.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (130,     'Pro Maple Youth Bat', 'Pro Maple Youth Bat', 'Bats',
       2036,    'Bats', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 89.99, 89.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (19,      'Cricket Bat Bag', 'Cricket bat bag', 'Cricket Bat',
       2051,    'Cricket Bat', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 55.99, 55.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (23,      'Plastic Cricket Bat', 'Plastic - Beach Cricket Bat', 'Cricket Bat',
       2051,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 21.99, 21.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (28,      'English Willow Cricket Bat', 'English Willow Cricket Bat', 'Cricket Bat',
       2051,    'Cricket Bat', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 199.99, 199.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (30,      'Linseed Oil', 'Cricket Bat - Linseed Oil', 'Cricket Bat',
       2051,    'Cricket Bat', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 9.99, 9.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (31,      'Fiber Tape', 'Cricket Bat - Fiber Tape', 'Cricket Bat',
       2051,    'Cricket Bat', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 8.99, 8.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (40,      'Team shirt', 'West Indies Team', 'Cricket Fan Gear',
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (41,      'Team shirt', 'South African Team', 'Cricket Fan Gear',
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (42,      'Team shirt', 'New Zealand Cricket Team', 'Cricket Fan Gear',
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (43,      'Team shirt', 'Australian Cricket Team', 'Cricket Fan Gear',
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (44,      'Team shirt', 'Indian Cricket Team', 'Cricket Fan Gear',
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (45,      'Team shirt', 'English Cricket Team', 'Cricket Fan Gear',
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (48,      'Indoor Cricket Ball', 'Indoor Cricket Ball', 'Cricket',
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 11.99, 11.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (113,     'Cricket Ball', 'Cricket Ball - Leather', 'Cricket',
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 22.99, 22.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (114,     'Cricket Ball - Training Ball', 'Cricket Ball - Training', 'Cricket',
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 18.99, 18.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (115,     'Plastic - Beach Cricket Ball', 'Plastic - Beach Cricket Ball', 'Cricket',
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 8.99, 8.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (116,     'Catchers Helmet', 'Catchers Helmet', 'Cricket',
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 11.99, 11.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (117,     'Plastic - Beach Cricket Wickets', 'Plastic - Beach Cricket Wickets', 'Cricket',
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 8.99, 8.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (118,     'Cricket Bails', 'Cricket Bails', 'Cricket',
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 7.99, 7.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (119,     'Cricket Bails - Junior', 'Cricket Bails - Junior', 'Cricket',
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 6.99, 6.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (120,     'Cricket Peak Cap', 'Cricket Peak Cap', 'Cricket Clothing',
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 6.99, 6.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (121,     'Cricket - Athletic Guard Cup', 'Cricket - Athletic Guard Cup', 'Cricket Clothing',
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 10.99, 10.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (122,     'Wide Brim Hat', 'Cricket Wide Brim Hat', 'Cricket Clothing',
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 18.99, 18.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (123,     'Helmet', 'Cricket Helmet', 'Cricket Clothing',
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 49.99, 49.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (124,     'Wicket Keeper Gloves', 'Wicket Keeper Gloves', 'Cricket Clothing',
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 18.99, 18.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (125,     'Bucket Hat', 'Cricket Bucket Hat', 'Cricket Clothing',
       2053,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 15.99, 15.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (126,     'Spiked Shoes', 'Spiked Cricket Shoes', 'Cricket Clothing',
       2053,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 28.99, 28.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (15,      'Right-Handed Graphite Shaft Iron Set', 'Right-Handed Graphite Shaft Iron Set', 'Irons and Iron Sets',
       2021,    'Irons and Iron Sets', 'Golf', 202, 'Golf', 1, 'U', 'P', 1, 'STATUS', 999.99, 999.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (18,      'Lithium Electric Golf Caddy', 'Lithium Electric Golf Caddy', 'Golf Bags and Carts',
       2022,    'Golf Bags and Carts', 'Golf', 202, 'Golf', 1, 'U', 'P', 1, 'STATUS', 1299.99, 1299.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (13,      'Soccer Goal - Portable', 'Soccer Goal - Portable', 'Soccer / Football',
       2044,    'Soccer / Football', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 899.99, 899.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (17,      'Soccer Goal - Official', 'Soccer Goal - Official', 'Soccer / Football',
       2041,    'Soccer / Football', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 1099.99, 1099.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (131,     'Soccer Ball - Size 4', 'Soccer Ball - Size 4 Youth', 'Soccer Equipment',
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 18.99, 18.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (132,     'Soccer Ball - Size 5', 'Soccer Ball - Size 5', 'Soccer Equipment',
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 24.99, 24.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (133,     'Goal Keeper Gloves', 'Goal Keeper Gloves', 'Soccer Equipment',
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 30.99, 30.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (134,     'Shin Guards', 'Shin Guards', 'Soccer Equipment',
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 20.99, 20.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (135,     'Gear Bag', 'Gear Bag', 'Soccer Equipment',
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 49.99, 49.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (136,     'Soccer Jersey', 'Soccer Jersey', 'Soccer Clothing',
       2043,    'Soccer Clothing', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 32.99, 32.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (137,     'Soccer Cleats - Junior', 'Soccer Cleats - Junior', 'Soccer Clothing',
       2043,    'Soccer Clothing', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 52.99, 52.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (138,     'Soccer Cleats - Adult', 'Soccer Cleats - Adult', 'Soccer Clothing',
       2043,    'Soccer Clothing', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 69.99, 69.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (16,      'Sonic Core Graphite Racquet', 'Sonic Core Graphite Racquet', 'Tennis Racquet',
       2011,    'Tennis Racquet', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 299.99, 299.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (20,      'Match Used Autograph Racquet', 'Match Used Autograph Racquet', 'Tennis Racquet',
       2012,    'Tennis Racquet', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 599.99, 599.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (29,      'Limited Edition Racquet', 'Limited Edition Racquet', 'Tennis Racquet',
       2012,    'Tennis Racquet', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 499.99, 499.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (139,     'Tennis Balls Heavy Duty Felt 3', 'Tennis Balls Heavy Duty Felt 3 can', 'Tennis Balls',
       2014,    'Tennis Balls', 'Tennis', 201, 'Tennis', 4, 'U', 'P', 1, 'STATUS', 19.99, 19.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (140,     'Tennis Strings Natural Gut', 'Tennis Strings Natural Gut', 'Tennis Strings',
       2014,    'Tennis Strings', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 29.99, 29.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (141,     'Tennis Strings Synthetic Gut', 'Tennis Strings Synthetic Gut', 'Tennis Strings',
       2014,    'Tennis Strings', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 29.99, 29.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (142,     'Tennis Strings Hybrids', 'Tennis Strings Hybrids', 'Tennis Strings',
       2014,    'Tennis Strings', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 19.99, 19.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (143,     'Tennis Strings Polyester', 'Tennis Strings Polyester', 'Tennis Strings',
       2014,    'Tennis Strings', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 19.99, 19.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (144,     'Tennis Grip Overgrip Tacky', 'Tennis Grip Overgrip Tacky', 'Tennis Racquet Grip',
       2014,    'Tennis Racquet Grip', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 7.99, 7.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (145,     'Practice Tennis Balls', 'Practice Tennis Balls', 'Tennis Balls',
       2014,    'Tennis Balls', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 12.99, 12.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (146,     'Regular Duty Tennis Balls', 'Regular Duty Tennis Balls', 'Tennis Balls',
       2014,    'Tennis Balls', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 11.99, 11.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (147,     'Cushioned Grip', 'Cushioned Grip', 'Tennis Racquet Grip',
       2013,    'Tennis Racquet Grip', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 7.99, 7.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (148,     'Tennis Balls 12 Pack', 'Tennis Balls 12 Pack', 'Tennis Balls',
       2013,    'Tennis Balls', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 20.99, 20.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (24,      'Endurance Coolcore 1/2 Zip Pullover', 'Endurance Coolcore 1/2 Zip Pullover', 'Baseball Clothing',
       2034,    'Baseball Clothing', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 45.99, 45.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (25,      '5 Point Batting Tee', '5 Point Batting Tee', 'Batting Tees',
       2033,    'Batting Tees', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 112.99, 112.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (26,      'Pro Style Batting Tee', 'Pro Style Batting Tee', 'Batting Tees',
       2033,    'Batting Tees', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 149.99, 149.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (27,      'Bucket of 24 Synthetic Baseballs', 'Bucket of 24 Synthetic Baseballs', 'Baseballs',
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (32,      'Bucket of 24 Leather Baseballs', 'Bucket of 24 Leather Baseballs', 'Baseballs',
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 67.99, 67.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (33,      'Baseball Is Life Cap', 'Baseball Is Life Cap', 'Baseball Clothing',
       2034,    'Baseball Clothing', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (34,      '11.5" Youth Triple Stripe Series Glove', '11.5" Youth Triple Stripe Series Glove', 'Gloves and Mitts',
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 39.99, 39.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (35,      'Catchers Mitt', 'Catchers Mitt', 'Gloves and Mitts',
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 49.99, 49.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (36,      '12" Premium Series Glove', '12" Premium Series Glove', 'Gloves and Mitts',
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (37,      '12.75" Premium Series Glove', '12.75" Premium Series Glove', 'Gloves and Mitts',
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 54.99, 54.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (38,      '11" Youth Field Master Glove', '11" Youth Field Master Glove', 'Gloves and Mitts',
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 29.99, 29.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
   INSERT INTO products VALUES 
      (39,      '13" Field Master Series Glove', '13" Field Master Series Glove', 'Gloves and Mitts',
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 34.99, 34.99,
       'TOTAL', 1, NULL, to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), NULL, 'A');
