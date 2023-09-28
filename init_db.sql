DROP TABLE if EXISTS worker, client, project, project_worker;

CREATE TYPE levelType AS ENUM ('Trainee', 'Junior', 'Middle', 'Senior');
CREATE TABLE worker (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) >= 2),
    BIRTHDAY DATE CHECK (EXTRACT(YEAR FROM BIRTHDAY) > 1900),
    level levelType not null,
    SALARY INT CHECK (SALARY >= 100 AND SALARY <= 100000)
);

INSERT INTO client (NAME)
VALUES
    ('Client A'),
    ('Client B'),
    ('Client C'),
    ('Client D'),
    ('Client E');

CREATE TABLE project (
    ID SERIAL PRIMARY KEY,
    CLIENT_ID INT NOT NULL,
    START_DATE DATE,
    FINISH_DATE DATE,
    FOREIGN KEY (CLIENT_ID) REFERENCES client (ID)
);

CREATE TABLE project_worker (
    PROJECT_ID INT NOT NULL,
    WORKER_ID INT NOT NULL,
    PRIMARY KEY (PROJECT_ID, WORKER_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES project (ID),
    FOREIGN KEY (WORKER_ID) REFERENCES worker (ID)
);