FROM alpine:latest

# Install ca-certificates for HTTPS
RUN apk --no-cache add ca-certificates tzdata
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase ./
RUN chmod +x ./pocketbase

# Create data directory
RUN mkdir -p /app/pb_data

# Expose port
EXPOSE 8080

# Start PocketBase
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8080", "--dir", "/app/pb_data"]
