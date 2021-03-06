Delivr
=========

A rails app to sell/deliver digital goods. Uses some pretty standard libraries to put it all together:

* Stripe for payment
* Money for currency calculations
* Omniauth for logins (twitter, facebook, google plus, soundcloud and identity setup by default)
* Cancan and rolify to keep track of who does what
* Zurb Foundation for the front end
* Simple Form for, well, forms
* Redcloth (textilize) for text formatting
* Figaro for sensitive (and non-sensitive) settings
* Paperclip for attaching files to database records
* Capistrano for deployment
* Mysql database
* Ruby on Rails 4.0 to pull it all together
* ...and several others

Installation
------------

I've tried to build this thing so you'll need minimal customization to get it running. You'll definitely need to take a look at config/application.example.yml. Fill in all the settings with your own, and then save it as config/application.yml. This file is ignored by git, so you'll be able to keep your settings.

Deployment
----------

Capistrano deployment is configured to look on your production environment's shared folder for the files below which are then sylinked to their designated paths in the application:

* app/assets/stylesheets/framework_and_overrides.css.scss => app/assets/stylesheets/framework_and_overrides.css.scss
* public/favicon.ico => shared/public/favicon.ico
* app/assets/images/logo.png => app/assets/images/logo.png
* app/assets/images/page_bg.png => app/assets/images/page_bg.png
* config/application.yml => config/application.yml

Unfortunately, I couldn't get capistrano to read ENV from application.yml. A quick workaround is to 
set your environment variables in a bashrc file like this:

export SITE_NAME="Site Name"
export DEPLOY_HOST=127.0.0.1
export DEPLOY_USER=deploy


DEVELOPMENT TODO
----------------
* T/C, privacy policy
* Testing (should've done this along the way)
* Better look for cart, order, confirmation
* Delayed job for mailers
* Admin settings page
* Coupon codes
* Zero-dollar orders (skip payment, mark order paid)
* VIP users get everything for free
* Item ordering within categories
* Item banner images
* Auto-generated homepage (enable/disable with admin settings)
* Merge users when logged in from different providers?

