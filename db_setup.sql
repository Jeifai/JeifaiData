create table sessions (
  id            serial primary key,
  uuid          varchar(64) not null unique,
  email         varchar(255),
  userid        integer references users(id),
  createdat     timestamp not null,
  deletedat     timestamp
);

create table users (
  id            serial primary key,
  username      varchar(255),
  email         varchar(255) not null unique,
  password      varchar(255) not null,
  createdat     timestamp not null,
  updatedat     timestamp not null,
  deletedat     timestamp
);

create table usersupdates (
  id            serial primary key,
  userid	    integer references users(id),
  data          json,
  createdat     timestamp not null
);

create table targets (
  id            serial primary key,
  url           varchar(500) not null unique,
  host          varchar(64) not null,             
  createdat     timestamp not null,
  name          varchar(64),
  linkedinurl   varchar(100)
);

create table scrapers (
  id            serial primary key,
  name          varchar(64) not null,
  targetid      integer references targets(id),
  createdat     timestamp not null  
);

create table scrapings (
  id            serial primary key,
  scraperid     integer references scrapers(id),
  createdat     timestamp,
  countresults  int
);

create table results (
  id            serial primary key,
  scraperid     integer references scrapers(id),
  scrapingid    integer references scraping(id),
  title         varchar(1000) not null,
  url           varchar(1000) not null unique,
  urlshort      varchar(10),
  location      varchar(1000),
  createdat     timestamp,
  updatedat     timestamp,
  data          json
);

create table invitations (
  id               serial primary key,
  uuid             varchar(64) not null unique,
  email            varchar(255) not null unique,
  whoareyou        varchar(100),
  whyjoin          varchar(1000),
  whichcompanies   varchar(1000),
  anythingelse     varchar(1000),
  createdat        timestamp not null,
  usedat           timestamp
);

create table resetpasswords (
  id              serial primary key,
  userid          integer references users(id),
  token           varchar(40) not null unique,
  createdat       timestamp not null,
  expiredat       timestamp,
  consumedat      timestamp
);

create table sentemails (
  id              serial primary key,
  email           varchar(255),
  action          varchar(255),
  sentat          timestamp not null
);

create table usersresultsvisits (
  id              serial primary key,
  userid          integer references users(id),      
  resultid        integer references results(id),
  createdat       timestamp not null
)

create table subscribers (
  id              serial primary key,
  email           text not null unique,
  createdat       timestamp not null
)