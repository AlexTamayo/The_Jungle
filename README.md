# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of learning Rails by example.

 * Browse and search products by category.
 * View detailed product descriptions, prices, and availability.
 * Add products to your cart and proceed to checkout.
 * Apply discounts and view the final order total.
 * User authentication and account management.
 * Admin dashboard for managing products, categories, and sales.

# Demo

https://github.com/AlexTamayo/jungle-rails/assets/3316856/7982f5b6-7c9c-41ef-b9fc-fd0d7ad14e07


![image_1](./docs/README_assets/images/1.png)

![image_2](./docs/README_assets/images/2.png)

![image_3](./docs/README_assets/images/3.png)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe


