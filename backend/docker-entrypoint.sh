#!/bin/sh
set -e

SECRETS_DIR="/run/secrets"

# Export a secret file as an environment variable
# $1 = ENV variable name
# $2 = secret file name
# $3 = required (true/false)
export_secret() {
  VAR_NAME="$1"
  SECRET_NAME="$2"
  REQUIRED="${3:-false}"

  SECRET_FILE="$SECRETS_DIR/$SECRET_NAME"

  if [ -f "$SECRET_FILE" ]; then
    export "$VAR_NAME=$(cat "$SECRET_FILE")"
  else
    if [ "$REQUIRED" = "true" ]; then
      echo "ERROR: Required secret '$SECRET_NAME' not found!"
      exit 1
    fi
  fi
}

# ---------------------------
# Database
# ---------------------------
export_secret SPRING_DATASOURCE_USERNAME postgres_user true
export_secret SPRING_DATASOURCE_PASSWORD postgres_password true
export_secret SPRING_DATASOURCE_DB postgres_db true

# ---------------------------
# Security
# ---------------------------
export_secret JWT_SECRET jwt_secret true

# ---------------------------
# OAuth
# ---------------------------
export_secret GOOGLE_CLIENT_ID google_client_id false
export_secret GOOGLE_CLIENT_SECRET google_client_secret false

echo "Secrets loaded successfully."

# Start Spring Boot
exec java -jar app.jar