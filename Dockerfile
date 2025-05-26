###
### 1️⃣ — Build stage  (Node 20‑slim)
###
FROM node:20-slim AS builder

# 1. Install system tools the official slim image lacks
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# 2. Create app directory
WORKDIR /app

# 3. Copy only package files first to leverage Docker layer caching
COPY package.json package-lock.json* ./

# 4. Install production + build deps
RUN npm ci --legacy-peer-deps

# 5. Copy the rest of the source code
COPY . .

# 6. Build the static export (writes to ./out by default)
RUN npm run build

###
### 2️⃣ — Runtime stage (tiny Nginx)
###
FROM nginx:1.27-alpine AS runtime

# 1. Remove default landing page
RUN rm -rf /usr/share/nginx/html/*

# 2. Copy static output from the build stage
COPY --from=builder /app/out /usr/share/nginx/html

# 3. Optional: custom Nginx config (adds gzip & cache headers)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 4. Expose the web port
EXPOSE 80

# 5. Start Nginx (on Alpine the default CMD is fine)
CMD ["nginx", "-g", "daemon off;"]

