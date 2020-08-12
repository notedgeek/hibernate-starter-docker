CREATE database test;

CREATE USER 'test'@'%' IDENTIFIED BY 'test';

GRANT ALL ON test.* TO 'test'@'%';

use test;

create table simon(a integer);
insert into simon values(51);
commit;
