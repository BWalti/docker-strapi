# strapi (v4+) containerized

![Strapi](https://github.com/bwalti/docker-strapi/blob/main/assets/PNG.logo.purple.dark.png?raw=true)

> Docker image for strapi version 5 (latest version)

API creation made simple, secure and fast. The most advanced open-source Content Management Framework to build powerful
API with no effort.

[GitHub repository](https://github.com/bwalti/docker-strapi)

[Docker Hub](https://hub.docker.com/r/bibolorean/strapi)

[![Docker Pulls](https://img.shields.io/docker/pulls/bibolorean/strapi.svg?style=for-the-badge)](https://hub.docker.com/r/bibolorean/strapi)

---

# Example

Using Docker Compose, create `docker-compose.yml` file with the following content:

```yaml
version: "3"
services:
  strapi:
    image: bibolorean/strapi
    environment:
      NODE_ENV: development # or production
    ports:
      - "1337:1337"
    # volumes:
    #   - ./app:/srv/app # mount an existing strapi project
```

or using Docker:

```shell
docker run -d -p 1337:1337 bibolorean/strapi --env NODE_ENV=development
```

---

# How to use ?

This image allows you to create a new strapi project or run an existing strapi project.

- for `$NODE_ENV = development`: The command that will run in your project
  is [`strapi develop`](https://docs.strapi.io/developer-docs/latest/developer-resources/cli/CLI.html#strapi-develop).
- for `$NODE_ENV = production`: The command that will run in your project
  is [`strapi start`](https://docs.strapi.io/developer-docs/latest/developer-resources/cli/CLI.html#strapi-start).

> The [Content-Type Builder](https://strapi.io/features/content-types-builder) plugin is disabled WHEN `$NODE_ENV = production`.

## Creating a new strapi project

When running this image, strapi will check if there is a project in the `/srv/app` folder of the container. If there is
nothing then it will run
the [`create-strapi`](https://docs.strapi.io/dev-docs/quick-start)
command in the container /srv/app folder.

This command creates a project with an SQLite database. Then starts it on port `1337`.

**Environment variables**

When creating a new project with this image you can pass database configurations to
the [`create-strapi`](https://docs.strapi.io/dev-docs/quick-start)
command.

- `DATABASE_CLIENT` a database provider supported by Strapi: (sqlite, postgres, mysql ,mongo).
- `DATABASE_HOST` database host.
- `DATABASE_PORT` database port.
- `DATABASE_NAME` database name.
- `DATABASE_USERNAME` database username.
- `DATABASE_PASSWORD` database password.
- `DATABASE_SSL` boolean for SSL.
- `EXTRA_ARGS` pass extra args to
  the [`create-strapi`](https://docs.strapi.io/dev-docs/quick-start).

## Running an existing strapi project

To run an existing project, you can mount the project folder in the container at `/srv/app`.

---

# Official Documentation

- The official documentation of strapi is available on [https://docs.strapi.io/](https://docs.strapi.io/).

- The official strapi docker image is available on [GitHub](https://github.com/strapi/strapi-docker) (not yet upgraded
  to v4).

---

# Based on

- [naskio/docker-strapi](https://github.com/naskio/docker-strapi)