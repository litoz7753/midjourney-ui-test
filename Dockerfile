# ---- Production ----
FROM node:18-alpine AS production
WORKDIR /dist
ADD .next ./.next
ADD public ./public
ADD package*.json ./
ADD yarn.lock ./
ADD next.config.js ./next.config.js
RUN yarn install --prod

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]