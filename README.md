# Countrylist Filteration Riverpod

This feature allows users to filter a list of countries in real-time based on search input. Riverpod is used to manage the state of the country list and apply the filter logic efficiently.

Key Steps:
Data Source: The list of countries is either fetched from an API or stored locally in a model class. Each country has attributes like name, currency, and flagUrl for easy display and filtering.

Riverpod State Management: We use a StateNotifier or StateNotifierProvider from Riverpod to manage the state of the country list. The state contains both the full list of countries and a filtered list, which gets updated based on user input.

State: The state holds:
allCountries: The full list of countries.
filteredCountries: The list that matches the user's search query.
isLoading: A boolean to track if data is being loaded.
Filtering Logic: The filtering is triggered when the user types in the search bar. A StateNotifier method listens for changes to the search query and filters the country list based on whether the country name contains the search string.

## Getting Started

1. **Clone the repository:**

   ```sh
   git clone https://your-repo-url/hCareV1.git
   ```

2. **Navigate to the project directory:**

   ```sh
   cd hCareV1
   ```

3. **Install dependencies:**

   ```sh
   flutter pub get
   ```

4. **Run build_runner:**

   ```sh
   dart run build_runner build -d
   ```

5. **Run the app:**

   ```sh
   flutter run
   ```

### 1. `main.dart`

- **Description**: Application entry point.
