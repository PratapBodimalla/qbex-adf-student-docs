
drop database if exists ipl;
create database ipl;

drop schema if exists ipl.schema_datasets;
create schema ipl.schema_datasets;

drop table if exists schema_datasets.ipl_matches;

create table schema_datasets.ipl_matches
(
match_id integer primary key,
season varchar(10),
city varchar(100),
match_date varchar(10),
match_type varchar(100),
player_of_match text,
venue text,
team1 text,
team2 text,
toss_winner text,
toss_decision varchar(20),
winner text,
match_result varchar(20),
match_result_margin varchar(10),
target_runs varchar(10),
super_over varchar(1),
method varchar(5),
umpire1 text,
umpire2 text
);


drop table if exists ipl.schema_datasets.ipl_matche_deliveries;

create table ipl.schema_datasets.ipl_matche_deliveries
(
match_id integer primary key,
innings integer,
batting_team text,
bowling_team text,
innings_over integer,
over_ball integer,
batsman text,
bowler text,
non_striker text,
batsman_runs integer,
extra_runs integer,
total_runs integer,
extras_type text,
is_wicket integer,
player_dismissed text,
dismissal_kind text,
fielder text
);