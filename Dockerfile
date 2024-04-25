FROM node:20 as builder
WORKDIR /app
COPY package*.json ./
COPY tsconfig.json ./
RUN npm install
COPY index.ts .
RUN npm run build 

FROM builder as development
CMD npm run develop

FROM builder as production
RUN npm install --omit=devDependencies
CMD npm run start