
http://localhost:8080/self-study-mvc-ai/hello

http://54.172.58.126:8080/hello

docker buildx build --platform linux/amd64 -f ./Dockerfile -t image .
#
docker tag image:latest 197877249140.dkr.ecr.us-east-1.amazonaws.com/selfstudyrepo:latest
#
docker push 197877249140.dkr.ecr.us-east-1.amazonaws.com/selfstudyrepo:latest