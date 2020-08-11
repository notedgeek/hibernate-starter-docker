CREATE database test;

CREATE USER 'test'@'%' IDENTIFIED BY 'test';
CREATE USER 'test'@'localhost' IDENTIFIED BY 'test';

GRANT ALL ON test.* TO 'test'@'%';
GRANT ALL ON test.* TO 'test'@'localhost';

use test;

create table simon(a integer);
insert into simon values(48);
commit;
