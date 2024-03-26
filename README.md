# Weather Forecast Application

The Weather Forecast Application is a Ruby on Rails web application that allows users to search for weather forecasts based on an address input. It retrieves forecast data from an external API, caches the results using Redis for improved performance, and displays the forecast details to the user.

## Features

- **Weather Forecast Search**: Users can search for weather forecasts by entering an address.
- **Forecast Display**: Displays forecast details including current temperature, high/low temperatures, wind speed, precipitation, and more.
- **Recently Searched Forecasts**: Provides a list of recently searched forecasts for quick access.
- **Caching with Redis**: Utilizes Redis for caching forecast data to reduce API calls and improve response times.
- **Responsive Design**: Built with a responsive design using Bootstrap for compatibility across various devices.

## Getting Started

To run this application locally, follow these steps:

1. Ensure you have Ruby and Ruby on Rails installed on your machine.
2. Clone this repository to your local machine.
3. Install dependencies by running `bundle install`.
4. Set up the required environment variables, including API keys and Redis configuration.
5. Start the Rails server by running `rails server`.
6. Open your web browser and navigate to `http://localhost:3000` to access the application.

## Usage

- **Searching for Forecasts**: Enter an address in the search bar on the home page and click the "Search" button to view the forecast details.
- **Recently Searched Forecasts**: View the list of recently searched forecasts on the home page and click on any forecast to view its details.

## Components

### Controllers

- **`ForecastsController`**: Handles requests related to weather forecasts.

### Views

- **`index.html.erb`**: Displays the home page with the search bar and recently searched forecasts.
- **`show.html.erb`**: Displays forecast details for a specific address.

### Services

- **`ForecastService`**: Fetches weather forecast data from the external API, caches it using Redis, and retrieves cached data for subsequent requests.

### Cache (Redis)

- Utilizes Redis for caching forecast data. Cached data is stored with a default expiration time to ensure freshness.

## Dependencies

- **Ruby**: Programming language used for implementation.
- **Ruby on Rails**: Web application framework for building the application.
- **Bootstrap**: Front-end framework for styling the user interface.
- **Redis**: In-memory data store used for caching forecast data.
- **HTTParty**: Gem used for making HTTP requests to external APIs.

## Configuration

Before running the application, make sure to configure any required environment variables, API keys, Redis settings, and other configurations as specified in the code.

## Contributing

Contributions to the Weather Forecast Application are welcome! If you'd like to contribute, please follow the standard GitHub workflow:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Implement your changes.
4. Write tests for your changes (if applicable).
5. Run the existing tests to ensure they pass.
6. Commit your changes and push your branch to your fork.
7. Create a new pull request.
