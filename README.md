## EcommerceCart

A Ecommerce Cart application that allows checkout system/cart that confirms to following discount/promotion rule interface.

## Getting Started

1. Clone the repository:

   ```
   $ git clone https://github.com/JayaramVenugoapl/ecommerce_cart
   ```

2. Navigate into the cloned repository folder:

   ```
   $ cd ecommerce_cart
   ```

3. Install dependencies:

   ```
   $ bundle install
   ```

4. Setup database:
   ```
   $ rake db:create db:migrate db:setup
   ```

## Usage

1. Start rails server

   ```
   $ rails s
   ```

2. Navigate to your browser and type in: http://localhost:3000

## External Dependencies/Gems

~ Rails Framework<br>
~ PostgreSQL<br>
~ Puma Web Server<br>
~ active_model_serializers<br>
~ faker<br>

## Running Tests

1. Make sure "rspec" is installed by running:

   ```sh
       $ bundle show rspec
   ```

   If a path is listed, then rspec is installed.

2. Run rspec for the spec folder through bundle:
   ```sh
       $ bundle exec rspec spec
   ```
