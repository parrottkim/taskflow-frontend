# Use prebuilt Flutter web artifacts from CI (build/web)
FROM nginx:alpine AS production

ARG ENVIRONMENT=dev

# Copy Flutter web build output generated in CI
COPY build/web /usr/share/nginx/html

# Apply environment-specific nginx config
COPY nginx/${ENVIRONMENT}.conf /etc/nginx/conf.d/default.conf
COPY nginx/security_headers.conf /etc/nginx/snippets/security_headers.conf

CMD ["nginx", "-g", "daemon off;"]
