# Based on:
* http://blog.gopheracademy.com/advent-2014/easy-deployment/
* https://github.com/ArturoBlas/docker-captainhook

# Pull captainhook Docker image
sudo docker pull cannin/captainhook

# Run captainhook Docker image
sudo docker run -d -p 8080:8080 -v /webhooks:/webhooks cannin/captainhook

# Run from local installation
export GOPATH=~/gosource
go get github.com/bketelsen/captainhook
sudo mv captainhook /usr/local/bin/
chmod a+x /usr/local/bin/captainhook

# Start captainhook
## https://github.com/bketelsen/captainhook
captainhook -listen-addr=0.0.0.0:3830 -echo -configdir /webhooks &

## Service
sudo service captainhook restart

# Trigger captainhook
# NOTE: Must run: chmod +x project.sh
curl -X POST http://127.0.0.1:3830/project
