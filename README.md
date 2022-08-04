# Quotes

### Requirements

- Ruby 3.1.2
- Rails 6.1.6
- nodejs 16.15.0 or higher
- yarn 1.22.18 or higher

#### 1. Clone the repository

```bash
git clone git@github.com:yuliatokaryk/quotes.git
cd quotes
```

#### 2. Create .env file

Copy the .env.example file.

```bash
cp .env.example .env
```

#### 3. Install dependencies

```bash
bundle && yarn
```

#### 4. Create and setup the database

```ruby
rails db:create && rails db:migrate && rails db:seed
```

#### 5. Start the app

```bash
rails s
bin/webpack-dev-server
```

Visit the app at http://localhost:3000
