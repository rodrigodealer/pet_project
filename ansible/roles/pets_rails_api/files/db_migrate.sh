DOCKER_ID=`sudo docker ps | grep "registry.gitlab.com/rodrigodealer/pets" | awk '{print $1}'`

sudo docker exec $DOCKER_ID bundle exec rake db:create
sudo docker exec $DOCKER_ID bundle exec rake db:migrate
