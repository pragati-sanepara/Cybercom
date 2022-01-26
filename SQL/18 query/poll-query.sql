-- 1. List out all questions with it’s answer which is having maximum vote.
select pv.pollId, count(pv.id)
from poll p
join poll_vote pv
on p.id = pv.pollId
group by p.id;

-- join poll_answer pa on p.id = pa.pollId

-- 2. List out all the categories which is having multiple poll questions under it.
select c.title , count(pc.pollid) as mult_poll 
from poll_category pc
join category c
on c.id = pc.categoryId
group by c.title
having mult_poll > 1;


-- 3. List out all the polls which are currently active.
select p.title , pq.active
from poll p
join poll_question pq
on p.id = pq.pollId
where pq.active = 1;

-- 4. List out all the users who is not logged in since last week.
select firstName as user, lastLogin
from user
where lastLogin <= date_sub(now(), interval 1 week);

-- 5. List out all the users whose email provider is not google.
select firstName as user, email
from user
where email not like '%gmail.com' and email not like '%googlemail.com';   

-- 6. List out all the polls which are published in 2021.
select title , publishedAt 
from poll
where year(publishedAt) = '2021';
	
-- 7. List out all the users who did not answer any poll yet.
select u. firstName as user
from poll p
left join poll_answer pa
on p.id = pa.pollId
join user u
on u.id = p.hostId
group by p.id 
having count(pa.id) = 0;

-- 8. Create all the possible unique key and indexes for this database schema.

	CREATE UNIQUE INDEX uq_user ON user (mobile,email);
	ALTER TABLE user ADD UNIQUE (id);
	CREATE UNIQUE INDEX uq_slug ON poll (slug);
	CREATE INDEX idx_poll_host ON poll (hostId);   
	ALTER TABLE poll_met ADD UNIQUE (id);
	CREATE INDEX idx_question_poll ON poll_question (pollId);
	ALTER TABLE poll_question ADD UNIQUE (id);
    CREATE  INDEX idx_answer_poll ON poll_answer (pollId);
	CREATE INDEX idx_answer_question ON poll_answer (questionId);
	ALTER TABLE poll_answer ADD UNIQUE (id);
	CREATE INDEX idx_vote_poll ON poll_vote (pollId);
    CREATE INDEX idx_vote_question ON poll_vote (questionId);
	CREATE INDEX idx_vote_answer ON poll_vote (answerId);
	CREATE INDEX idx_vote_user ON poll_vote (userId);
	ALTER TABLE poll_vote ADD UNIQUE (id);
    CREATE INDEX idx_category_parent ON category (parentId);
    ALTER TABLE category ADD UNIQUE (id, slug);
    CREATE INDEX idx_pc_category ON poll_category (categoryId);
	CREATE INDEX idx_pc_poll ON poll_category (pollId);
    





