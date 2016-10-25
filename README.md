# grafana_elixir

**Elixir client for Grafana API**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `grafana_elixir` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:grafana_elixir, "~> 0.1.0"}]
    end
    ```

  2. Ensure `grafana_elixir` is started before your application:

    ```elixir
    def application do
      [applications: [:grafana_elixir]]
    end
    ```

  3. Configure API access in your project's configuration file `config/config.exs`:

  ```elixir
  config :grafana_elixir,
    api_host: "<url of your grafana server>",
    api_token: "<your api token>"
  ```
