
## Installation
git clone https://github.com/mario56/nodebb-docker-redis.git

cd nodebb-docker-redis

npm install

docker build -t nodebb .

cd redis

docker build -t redis .

docker run --name cloud-redis -d -p 6379:6379 redis

cd ..

docker run --name cloud-nodebb --link cloud-redis:redis  -p 4567:4567 -P -t -i nodebb

## set NodeBB

go to localhost:4567

set redis host to redis

## start nodebb

docker start cloud-nodebb

## License

NodeBB is licensed under the **GNU General Public License v3 (GPL-3)** (http://www.gnu.org/copyleft/gpl.html)
