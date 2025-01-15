#!/bin/sh
set -ea

if [ "$*" = "strapi" ]; then

  if [ ! -f "package.json" ]; then

    echo "Using create-strapi"
    echo "No project found at /app. Creating a new strapi project ..."

    npx create-strapi . \
      --no-run \
      --ts \
      --use-yarn \
      --install \
      --skip-cloud \
      --no-example \
      --no-git-init \
      --dbfile app.db \
      --dbclient sqlite

  elif [ ! -d "node_modules" ] || [ ! "$(ls -qAL node_modules 2>/dev/null)" ]; then

      echo "Node modules not installed. Installing using yarn ..."
      yarn install --prod --silent

  fi

  if [ "$NODE_ENV" = "production" ]; then
    STRAPI_MODE="start"
  elif [ "$NODE_ENV" = "development" ]; then
    STRAPI_MODE="develop"
  fi

  echo "Starting your app (with yarn run ${STRAPI_MODE:-develop})..."
  exec yarn run "${STRAPI_MODE:-develop}"

else
  exec "$@"
fi