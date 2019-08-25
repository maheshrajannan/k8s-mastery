## Starting the Web App Locally
` $ yarn start `

## Building the application
` $ yarn build `

## Building the container
` $ docker build -f Dockerfile -t $DOCKER_USER_ID/sentiment-analysis-frontend . `

## Running the container
` $ docker run -d -p 80:80 $DOCKER_USER_ID/sentiment-analysis-frontend `

## Pushing the container
` $ docker push $DOCKER_USER_ID/sentiment-analysis-frontend `

Local Mac

Nginx

Maheshs-MBP-2:sa-frontend maheshrajannan$ sudo brew services start nginx
Password:
Service `nginx` already started, use `brew services restart nginx` to restart.
Maheshs-MBP-2:sa-frontend maheshrajannan$ 
