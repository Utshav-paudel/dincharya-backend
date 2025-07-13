FROM alpine:latest

# Install ca-certificates for HTTPS
RUN apk --no-cache add ca-certificates tzdata
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase ./
RUN chmod +x ./pocketbase

# Create data directory
RUN mkdir -p /app/pb_data

# Set default port
ENV PORT=8080

# Expose port
EXPOSE $PORT

# Start PocketBase with environment variable handling
CMD ["sh", "-c", "./pocketbase serve --http 0.0.0.0:${PORT:-8080}"]
