# docker-selenium

docker build for a simple selenium test using both v2 and v3
Selenium v2 (Selenium2 branch) uses Firefox v43
Selenium v3 (master branch) uses Firefox v66 (latest at the time)

docker build -t docker-sel:2 . && docker run docker-sel:2
docker build -t docker-sel:3 . && docker run docker-sel:3
