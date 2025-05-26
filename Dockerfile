# --------- 1️⃣ Build Stage ---------
FROM node:20-slim AS builder

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm install --legacy-peer-deps

# Copy source and build
COPY . .
ENV NEXT_TELEMETRY_DISABLED=1
RUN npm run build && npm run export

# --------- 2️⃣ Runtime Stage ---------
FROM nginx:1.27-alpine

# Clean default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy exported Next.js static files
COPY --from=builder /app/out /usr/share/nginx/html

# Write nginx.conf to handle /FF_Project path
RUN printf "%s\n" \
"server {" \
"  listen 80;" \
"" \
"  location = / {" \
"    return 302 /FF_Project/;" \
"  }" \
"" \
"  location /FF_Project/ {" \
"    alias /usr/share/nginx/html/;" \
"    index index.html index.htm;" \
"    try_files \$uri \$uri/ /index.html;" \
"  }" \
"}" > /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
