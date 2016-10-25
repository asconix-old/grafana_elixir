defmodule GrafanaElixir.HttpClient do
	use HTTPoison.Base

  def process_url(url) do
    IO.inspect (Application.get_env(:grafana_elixir, :api_host) <> url)
    Application.get_env(:grafana_elixir, :api_host) <> url
  end

  def process_request_headers(headers) do
    headers ++ [
      {"Accept", "application/json"},
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer " <> Application.get_env(:grafana_elixir, :api_token)}
    ]
  end

  def process_response_body(body) do
    body
    |> IO.inspect
  end
end