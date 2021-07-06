-- TABLE USER
DROP TABLE IF EXISTS instagram.user;
 
CREATE TABLE instagram.user(
	user_id int PRIMARY KEY,
	user_username VARCHAR(50) UNIQUE,
	user_email VARCHAR(100) UNIQUE,
	user_pass varchar(50) NOT NULL,
	user_name varchar(100) NOT NULL,
	user_ip varchar(100),
	date_created timestamp DEFAULT current_timestamp,
	date_updated timestamp DEFAULT current_timestamp
);

-- TABLE USER FOLLOWING
DROP TABLE IF EXISTS instagram.user_following;
 
CREATE TABLE instagram.user_following(
	ufing_id int PRIMARY KEY,
	user_id int REFERENCES instagram.user(user_id),
	following_id int
);

-- TABLE USER FOLLOWERS
DROP TABLE IF EXISTS instagram.user_followers;
 
CREATE TABLE instagram.user_followers(
	ufer_id int PRIMARY KEY,
	user_id int REFERENCES instagram.user(user_id),
	follower_id int
);

-- TABLE JENIS POST
DROP TABLE IF EXISTS instagram.jenis_post;
 
CREATE TABLE instagram.jenis_post(
	jp_id int PRIMARY KEY,
	jp_name VARCHAR(20) NOT NULL
);

-- TABLE POST
DROP TABLE IF EXISTS instagram.post;
 
CREATE TABLE instagram.post(
	post_id int PRIMARY KEY,
	jp_id int REFERENCES instagram.jenis_post(jp_id),
	user_id int REFERENCES instagram.user(user_id),
	post_caption VARCHAR(200),
	post_latitude float NOT NULL,
	post_longtitude float NOT NULL,
	post_path VARCHAR(200) NOT NULL,
	post_size integer CHECK(post_size > 0),
	post_total_like integer DEFAULT 0,
	post_total_comment integer DEFAULT 0,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE LIKES
DROP TABLE IF EXISTS instagram.likes;
 
CREATE TABLE instagram.likes(
	post_id int REFERENCES instagram.post(post_id),
	user_id int REFERENCES instagram.user(user_id),
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE COMMENT
DROP TABLE IF EXISTS instagram.comments;
 
CREATE TABLE instagram.comments(
	com_id int PRIMARY KEY,
	user_id int REFERENCES instagram.user(user_id),
	post_id int REFERENCES instagram.post(post_id),
	com_text varchar(200) NOT NULL,
	date_created timestamp DEFAULT current_timestamp,
	date_updated timestamp DEFAULT current_timestamp
);

-- TABLE TAGS
DROP TABLE IF EXISTS instagram.tags;
 
CREATE TABLE instagram.tags(
	tag_id int PRIMARY KEY,
	tag_name VARCHAR(50) UNIQUE
);

-- TABLE HASHTAG
DROP TABLE IF EXISTS instagram.hashtags;
 
CREATE TABLE instagram.hashtags(
	hashtag_id int PRIMARY KEY,
	hashtag_text VARCHAR(50) UNIQUE
);

-- TABLE ARCHIVE_STORY
DROP TABLE IF EXISTS instagram.archive_story;
 
CREATE TABLE instagram.archive_story(
	arcs_id int PRIMARY KEY,
	user_id int REFERENCES instagram.user(user_id),
	arcs_caption VARCHAR(200),
	arcs_path VARCHAR(200) NOT NULL,
	arcs_size integer CHECK(arcs_size > 0),
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE STORY
DROP TABLE IF EXISTS instagram.story;
 
CREATE TABLE instagram.story(
	story_id int PRIMARY KEY,
	user_id int REFERENCES instagram.user(user_id),
	story_caption VARCHAR(200),
	story_path VARCHAR(200) NOT NULL,
	story_size integer CHECK(story_size > 0),
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE ARCHIVE TAG
DROP TABLE IF EXISTS instagram.archive_tag;
 
CREATE TABLE instagram.archive_tag(
	arcs_id int REFERENCES instagram.archive_story(arcs_id),
	tag_id int REFERENCES instagram.tags(tag_id)
);

-- TABLE ARCHIVE HASHTAG
DROP TABLE IF EXISTS instagram.archive_hashtag;

CREATE TABLE instagram.archive_hashtag(
	arcs_id int REFERENCES instagram.archive_story(arcs_id),
	hashtag_id int REFERENCES instagram.hashtags(hashtag_id)
);

-- TABLE POST TAG
DROP TABLE IF EXISTS instagram.post_tag;
 
CREATE TABLE instagram.post_tag(
	post_id int REFERENCES instagram.post(post_id),
	tag_id int REFERENCES instagram.tags(tag_id)
);

-- TABLE POST HASHTAG
DROP TABLE IF EXISTS instagram.post_hashtag;

CREATE TABLE instagram.post_hashtag(
	post_id int REFERENCES instagram.post(post_id),
	hashtag_id int REFERENCES instagram.hashtags(hashtag_id)
);

-- TABLE STORY TAG
DROP TABLE IF EXISTS instagram.story_tag;
 
CREATE TABLE instagram.story_tag(
	story_id int REFERENCES instagram.story(story_id),
	tag_id int REFERENCES instagram.tags(tag_id)
);

-- TABLE STORY HASHTAG
DROP TABLE IF EXISTS instagram.story_hashtag;

CREATE TABLE instagram.story_hashtag(
	story_id int REFERENCES instagram.story(story_id),
	hashtag_id int REFERENCES instagram.hashtags(hashtag_id)
);