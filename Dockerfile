FROM node:alpine

WORKDIR /app

COPY package.json . 

RUN npm install 

COPY . . 

# Can not use CMD as that is for the last command
RUN ["npm", "run", "build"]

FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html

