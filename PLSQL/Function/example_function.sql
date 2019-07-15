CREATE OR REPLACE FUNCTION active_user_in_app (
date_expiration IN user_info.date_expiration%TYPE,
city IN user_info.city%TYPE)
RETURN INTEGER AS
count_user INTEGER;
BEGIN
SELECT COUNT(ua.login)
INTO count_user
FROM user_account ua INNER JOIN user_info uf
ON ua.id_user = uf.id_user
WHERE uf.date_expiration >= date_expiration AND uf.city = city;
RETURN count_user;
END active_user_in_app;
/