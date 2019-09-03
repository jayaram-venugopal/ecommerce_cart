# EcommerceCart

A Ecommerce Cart application that allows checkout system/cart that confirms to following discount/promotion rule interface.

# Getting Started

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

# Usage

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

# API
## Products
Create Product 

   ```
   Request:
    curl -X POST http://localhost:3000/api/v1/products -H 'Accept: */*' -H 'Content-Type: application/json' -d '{"product": {"name": "Ergonomic Bronze","price": 40.0,"quantity": 10}}'

   Success Response:
    {
      "status": "Success",
      "data": {
          "id": 5,
          "name": "Ergonomic Bronze",
          "price": 40.0,
          "quantity": 10,
          "avilable_quantity": 10,
          "quantity_status": "Avilable"
      },
      "message": ""
    }

   Error Response:
    {
      "status": "Error",
      "data": {
          "message": "Validation failed: Name must be unique"
      },
      "message": ""
    }

   ```

Product List

   ```
   Request:
    curl -X GET \http://localhost:3000/api/v1/products 

   Success Response:
    {
        "status": "Success",
        "data": [
            {
                "id": 2,
                "name": "Durable Concrete Bag",
                "price": 20.0,
                "quantity": 6,
                "avilable_quantity": 6,
                "quantity_status": "Avilable"
            },
            {
                "id": 3,
                "name": "Synergistic Wool Shoes",
                "price": 50.0,
                "quantity": 5,
                "avilable_quantity": 5,
                "quantity_status": "Avilable"
            },
            {
                "id": 4,
                "name": "Gorgeous Aluminum Chair",
                "price": 15.0,
                "quantity": 9,
                "avilable_quantity": 9,
                "quantity_status": "Avilable"
            },
            {
                "id": 5,
                "name": "Ergonomic Bronze",
                "price": 40.0,
                "quantity": 10,
                "avilable_quantity": 10,
                "quantity_status": "Avilable"
            },
            {
                "id": 1,
                "name": "Ergonomic Bronze Plate",
                "price": 30.0,
                "quantity": 9,
                "avilable_quantity": 7,
                "quantity_status": "Avilable"
            }
        ],
        "message": ""
    }

   ```

## Purchase
Add to cart

   ```
   Request:
    curl -X POST http://localhost:3000/api/v1/orders -H 'Accept: */*' -d '{"order": {"order_items": [{"product_id": 1,"quantity": 2}]}}' 

   Success Response:
    {
      "status": "Success",
      "data": {
          "id": 1,
          "subtotal": "Rs. 60.0",
          "grand_total": "Rs. 60.0",
          "status": "cart",
          "order_items": [
              {
                  "id": 1,
                  "total": "Rs. 60.0",
                  "quantity": 2,
                  "product": {
                      "id": 1,
                      "name": "Ergonomic Bronze Plate",
                      "price": 30.0,
                      "quantity": 9,
                      "avilable_quantity": 7,
                      "quantity_status": "Avilable"
                  }
              }
          ]
      },
      "message": ""
    }

   ```

Update to cart

   ```
   Request:
    curl -X PUT http://localhost:3000/api/v1/orders/1 -H 'Accept: */*' -d '{"order": {"order_items": [{"product_id": 1,"quantity": 2},{"product_id": 3,"quantity": 2}]}}' 

   Success Response:
    {
      "status": "Success",
      "data": {
          "id": 1,
          "subtotal": "Rs. 60.0",
          "grand_total": "Rs. 60.0",
          "status": "cart",
          "order_items": [
              {
                  "id": 1,
                  "total": "Rs. 60.0",
                  "quantity": 2,
                  "product": {
                      "id": 1,
                      "name": "Ergonomic Bronze Plate",
                      "price": 30.0,
                      "quantity": 9,
                      "avilable_quantity": 7,
                      "quantity_status": "Avilable"
                  }
              }
          ]
      },
      "message": ""
    }

   ```

View to cart

   ```
   Request:
    curl -X GET http://localhost:3000/api/v1/orders/1  

   Success Response:
    {
        "status": "Success",
        "data": {
            "id": 1,
            "subtotal": "Rs. 75.0",
            "grand_total": "Rs. 75.0",
            "status": "cart",
            "order_items": [
                {
                    "id": 1,
                    "total": "Rs. 75.0",
                    "quantity": 3,
                    "product": {
                        "id": 1,
                        "name": "Awesome Copper Knife",
                        "price": 30.0,
                        "quantity": 5,
                        "avilable_quantity": 2,
                        "quantity_status": "Out of stock"
                    }
                },
                {
                    "id": 2,
                    "total": "Rs. 100.0",
                    "quantity": 2,
                    "product": {
                        "id": 3,
                        "name": "Lightweight Paper Gloves",
                        "price": 50.0,
                        "quantity": 5,
                        "avilable_quantity": 3,
                        "quantity_status": "Avilable"
                    }
                }
            ]
        },
        "message": ""
    }
   ```
Place Order
  ```
   Request:
    curl -X GET http://localhost:3000/api/v1/orders/1/place_order  

   Success Response:
    {
        "status": "Success",
        "data": {
            "id": 1,
            "subtotal": "Rs. 75.0",
            "grand_total": "Rs. 75.0",
            "status": "cart",
            "order_items": [
                {
                    "id": 1,
                    "total": "Rs. 75.0",
                    "quantity": 3,
                    "product": {
                        "id": 1,
                        "name": "Awesome Copper Knife",
                        "price": 30.0,
                        "quantity": 5,
                        "avilable_quantity": 2,
                        "quantity_status": "Out of stock"
                    }
                },
                {
                    "id": 2,
                    "total": "Rs. 100.0",
                    "quantity": 2,
                    "product": {
                        "id": 3,
                        "name": "Lightweight Paper Gloves",
                        "price": 50.0,
                        "quantity": 5,
                        "avilable_quantity": 3,
                        "quantity_status": "Avilable"
                    }
                }
            ]
        },
        "message": ""
    }
   ```

# Running Tests

1. Make sure "rspec" is installed by running:

   ```sh
       $ bundle show rspec
   ```

   If a path is listed, then rspec is installed.

2. Run rspec for the spec folder through bundle:
   ```sh
       $ bundle exec rspec spec
   ```
