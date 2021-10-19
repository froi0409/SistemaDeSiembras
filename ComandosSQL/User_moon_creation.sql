CREATE USER 'moon'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON * . * TO 'moon'@'localhost';

FLUSH PRIVILEGES;
