CREATE TABLE team (
id_team INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1),
team_name VARCHAR2(50) NOT NULL,
CONSTRAINT team_pk PRIMARY KEY (id_team)
);

CREATE TABLE stadium (
id_stadium INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1),
stadium_name VARCHAR2(40) NOT NULL,
city VARCHAR2(40) NOT NULL,
CONSTRAINT stadium_pk PRIMARY KEY (id_stadium)
);

CREATE TABLE course (
id_course INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1),
id_information_match INTEGER NOT NULL,
course NUMBER (5,2) NOT NULL,
id_team INTEGER,
CONSTRAINT course_pk PRIMARY KEY (id_course),
CONSTRAINT course_team_fk FOREIGN KEY (id_team) REFERENCES team(id_team),
CONSTRAINT course_information_match FOREIGN KEY (id_information_match) REFERENCES information_match(id_information_match)
);

CREATE TABLE information_match (
id_information_match INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1),
first_team INTEGER,
second_team INTEGER,
date_match DATE NOT NULL,
id_stadium INTEGER NOT NULL,
league CHAR(1) DEFAULT 0,
CONSTRAINT information_match_pk PRIMARY KEY (id_information_match),
CONSTRAINT info_match_stadium_fk FOREIGN KEY (id_stadium) REFERENCES stadium(id_stadium),
CONSTRAINT info_match_team FOREIGN KEY (second_team) REFERENCES team(id_team)
);