create user 'showterm'@'localhost';

grant all privileges on 'showterm'.* to 'showterm'@'localhost';

set password for 'showterm'@'localhost' = password('showterm');
