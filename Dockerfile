# Pobieranie obrazu z serwera Nginx
FROM nginx

# Dodanie informacji o autorze do pliku index.html
RUN echo "<html><body><h1>Author: Alina Katrych</h1></body></html>" > /usr/share/nginx/html/index.html

# Tworzenie nowego kontekstu Buildx
docker buildx create --name mybuilder

# Aktywacja kontekstu Buildx
docker buildx use mybuilder

# Dodanie wielu platform do kontekstu Buildx
docker buildx inspect --bootstrap

# Budowanie obrazu dla architektury ARM64
docker buildx build --platform linux/arm64 -t <alinakatrych1>/nginx-arm64:v1 .

# Budowanie obrazu dla architektury x86_64
docker buildx build --platform linux/amd64 -t <alinakatrych1>/nginx-x86_64:v1 .

# Wysyłanie obrazów na konto DockerHub
docker push <katrychalina1>/nginx-arm64:v1
docker push <katrychalina1>/nginx-x86_64:v1

