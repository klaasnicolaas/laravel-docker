<!--
*** To avoid retyping too much info. Do a search and replace for the following:
*** github_username, repo_name
-->

# 🐳 Laravel docker prod/dev setup
<!-- PROJECT SHIELDS -->
![Project Maintenance][maintenance-shield]
[![License][license-shield]](LICENSE.md)

[![GitHub Activity][commits-shield]][commits]
[![GitHub Last Commit][last-commit-shield]][commits]
[![Contributors][contributors-shield]][contributors-url]

[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

## About

This is a template repository for running Laravel within a Docker environment.

## Development - Get started

<details>
  <summary>Click to expand!</summary>

## Requirements

- [Docker](https://www.docker.com) (and docker-compose)
- [Composer](https://getcomposer.org)
- [Nginx proxy manager](https://nginxproxymanager.com) (when you want to run multiple instances on 1 server)

You can start developing in 2 ways:

### Devcontainers

1. Clone the repository
2. Reopen in container
3. When the container build is finished: `bash init.sh`

### Docker

How to start with this Laravel Docker template:

1. Clone the repository
2. Create a `.env` file and make an symbolik link

```bash
cp ./laravel/.env.example ./laravel/.env
ln -s laravel/.env .env
```

3. Inside the `.env` file give the following variables a value
    - `APP_NAME`
    - `DOCKER_IMAGE_NAME`
    - `DB_HOST`
    - `DB_DATABASE`
    - `DB_USERNAME`
    - `DB_PASSWORD`
    - `DB_ROOT_PASSWORD`

4. Change the port numbers according to your situation
    - `DB_PORT`
    - `HOST_HTTP_PORT`
    - `HOST_HTTPS_PORT`

> NOTE: if you are going to use your Laravel environment in combination with a domain name and SSL, change the `APP_ENV` to **production**.

5. Install the composer packages and generate a key

```bash
cd laravel && composer install && php artisan key:generate && cd ..
```

## Run

When you have done the getting started part, it's time to start the docker containers.

```bash
docker-compose up -d --build
```

After this only do a Laravel migration to the database and you are ready!

```bash
cd laravel && php artisan migrate
```
</details>

## Contributing

Would you like to contribute to the development of this project? Then read the prepared [contribution guidelines](CONTRIBUTING.md) and go ahead!

Thank you for being involved! :heart_eyes:

## License

MIT License

Copyright (c) 2021-2022 Klaas Schoute

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<!-- MARKDOWN LINKS & IMAGES -->
[maintenance-shield]: https://img.shields.io/maintenance/yes/2022.svg?style=for-the-badge
[contributors-shield]: https://img.shields.io/github/contributors/klaasnicolaas/laravel-docker.svg?style=for-the-badge
[contributors-url]: https://github.com/klaasnicolaas/laravel-docker/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/klaasnicolaas/laravel-docker.svg?style=for-the-badge
[forks-url]: https://github.com/klaasnicolaas/laravel-docker/network/members
[stars-shield]: https://img.shields.io/github/stars/klaasnicolaas/laravel-docker.svg?style=for-the-badge
[stars-url]: https://github.com/klaasnicolaas/laravel-docker/stargazers
[issues-shield]: https://img.shields.io/github/issues/klaasnicolaas/laravel-docker.svg?style=for-the-badge
[issues-url]: https://github.com/klaasnicolaas/laravel-docker/issues
[license-shield]: https://img.shields.io/github/license/klaasnicolaas/laravel-docker.svg?style=for-the-badge
[commits-shield]: https://img.shields.io/github/commit-activity/y/klaasnicolaas/laravel-docker.svg?style=for-the-badge
[commits]: https://github.com/klaasnicolaas/laravel-docker/commits/master
[last-commit-shield]: https://img.shields.io/github/last-commit/klaasnicolaas/laravel-docker.svg?style=for-the-badge