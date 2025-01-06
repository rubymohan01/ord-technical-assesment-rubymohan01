* To get started with this project, clone the repository to your local machine and install the necessary dependencies. Ensure your system meets the prerequisites mentioned below.

# Steps to set up and run the project.

    * Clone the repository
      git clone  git@github.com:rubymohan01/ord-technical-assesment-rubymohan01.git

    * Install dependencies
        bundle install

    * Verify your Ruby and Rails versions
        Ruby: Version 3.2.5
        Rails: Version 8.0.1

    * Modify the config/database.yml according to your database credentials

    * Setup the database
        rails db:create db:migrate db:seed

    * To run build tailwindcss
        rails tailwindcss:build
    
    * To run build in watch mode tailwindcss
        rails tailwindcss:watch

    * To start the Rails server, run:
        rails server

    * You can now access the application on http://localhost:3000 in your browser.

    * To access the admin panel of application go to http://localhost:3000/admins/sign_in in your browser.

    * Use the below credentials to login as Admin
        - Username: admin@example.com
        - Password: password123

        Note: After login you will be redirected to http://localhost:3000/admins/dashboard


# Code Architecture Description

    * The application follows the MVC (Model-View-Controller) architecture:

        Models: Handle the business logic and interact with the database (e.g. Admin, Agency, Agent, Company, Employee ). 

        Views: Manage the user interface and presentation logic (e.g. Admin Dashboard ).

        Controllers: Handle user requests, process them through models, and return appropriate responses via views(e.g. Employees, Dashboard, CsvImports).

    * Key Components

        Routes: Used custom routes for admin and contact so in future both can manage their entities seaprately.

        Database: Using postgresql and ActiveRecord for handling and setting up the tables and relationships

        Background Jobs: For long-running tasks (e.g., CsvImportJob).

        Services: Encapsulate reusable business logic that doesn't belong directly in controllers or models(e.g. CsvImportService).

        Javascript: Using Turbo and Stimulus to make application interactive, serving content via turbo streams.

        Action Calble: Turbo::StreamsChannel for real time updates e.g. while importing csv.

# Technical Notes

    * Ensure compatibility with Ruby 3.2.5 and Rails 8.0.1.

    * Database configuration defaults to Postgres for development. Modify config/database.yml for other environments.

    * Precompile assets before deploying to production:
        rails assets:precompile