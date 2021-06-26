echo "-- Start Laravel init script --"
cd laravel
cp .env.example .env

composer install

php artisan key:generate
php artisan migrate:fresh --seed

npm install
echo "-- Setup is ready --"