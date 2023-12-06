# `node-xskak` - Docker Image

A minimal TexLive server with `xskak`, running in a Node v20 Alpine image. 
To be used as part of a multi-stage build in a Node application, where `xskak` is a required part of a TexLive server.

## Example Usage

```bash
FROM owenrees/node-xskak:latest
WORKDIR /usr/src/app
COPY ./package*.json ./
RUN npm ci
COPY . .
CMD ["npm", "run", "start"]
```

This will copy your `package.json` and `package-lock.json` files into the image, install the dependencies, copy the rest of your project into the image, build it, and then run it.