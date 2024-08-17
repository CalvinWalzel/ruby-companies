# Ruby Companies

A repository of companies using Ruby as their primary programming language.

## Project Description

Ruby Companies is a community-driven repository that lists companies worldwide using Ruby in their technology stack. It serves as a resource for job seekers and researchers interested in the Ruby ecosystem.

## Prerequisites

- Ruby (version specified in `.ruby-version`)
- PostgreSQL 16
- Node.js (version specified in `.node-version`)
- Yarn (managed via corepack, version specified in `package.json`)
- (Optional) [puma-dev](https://github.com/puma/puma-dev) for local development

## Setup

1. Clone the repository:

   ```
   git clone -b version-2 https://github.com/CalvinWalzel/ruby-companies.git
   cd ruby-companies
   ```

2. Run the setup script:
   ```
   bin/setup
   ```

This script will install dependencies, set up the database, and perform any other necessary setup tasks.

## Usage

To run the project:

```
bin/dev
```

Access the application:

- Without puma-dev: [http://localhost:3000](http://localhost:3000)
- With puma-dev: [https://ruby-companies.test](https://ruby-companies.test)

## Testing

Run the tests using:

```
bin/rspec
```

This will execute all the tests in the `spec` directory.

## Contributing

We welcome contributions! To contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin feature/your-feature-name`)
6. Create a new Pull Request

Please update tests as appropriate and adhere to the project's coding standards.

## License

[TODO: Add information about the project's license]

---

For more information or questions, please open an issue in the GitHub repository.
