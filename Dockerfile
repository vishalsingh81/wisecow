# Use Debian slim
FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune-mod \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Ensure fortune binary is accessible
RUN ln -s /usr/games/fortune /usr/bin/fortune

# Add /usr/games to PATH
ENV PATH="/usr/games:${PATH}"

WORKDIR /app

# Copy script from src folder
COPY src/wisecow.sh /app/wisecow.sh
RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]

