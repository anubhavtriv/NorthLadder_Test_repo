# Use a lightweight base image
FROM node:alpine as base

# Set working directory
WORKDIR /usr/src/opt

# Copy application source code
COPY /node/ .

# Install dependencies
RUN npm install

# Bundle app source

FROM node:alpine

WORKDIR "/usr/src/opt"

RUN addgroup -S app && adduser -S -G app app && chown -R app:app /usr/src/opt

COPY --from=base /usr/src/opt/ /usr/src/opt/

# Switch to the "app" user
USER app

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["npm", "run", "start"]
