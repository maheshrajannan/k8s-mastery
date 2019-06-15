# TODO: stretch goal.
# https://github.com/emmyyusufu/sample-nodejs-app/blob/master/Dockerfile
# Tried it halfway through then left.
# https://mherman.org/blog/dockerizing-a-react-app/
# ---

FROM node:10.14.2-alpine as builder
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json
RUN npm install --silent
COPY . /app
RUN pwd
RUN ls -lrt
RUN ls -lrt build
#Failing with error index.html not found.
RUN npm install react-scripts -g --silent
RUN npm run build

# production environment
FROM nginx:1.16.0-alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]