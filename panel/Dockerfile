# 📄 /panel/Dockerfile
FROM node:20-alpine AS builder

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

# ---- Serve Static Files with nginx ----
FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
