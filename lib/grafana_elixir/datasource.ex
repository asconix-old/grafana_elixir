defmodule GrafanaElixir.Datasource do
	
  alias GrafanaElixir.HttpClient

  @base_path "api/datasources"

  @doc ~S"""
  Get all datasources (GET /api/datasources). Example:

    iex> %HTTPoison.Response{body: _body, headers: _headers, status_code: _status_code} = GrafanaElixir.Datasource.get
  """
  def get, do: @base_path |> HttpClient.get!

  @doc """
  Get a single data source by Id (GET /api/datasources/:datasourceId). Example:

    iex> %HTTPoison.Response{body: _body, headers: _headers, status_code: _status_code} = GrafanaElixir.Datasource.get(1)
  """
  def get(id), do: @base_path <> "/#{id}" |> HttpClient.get!

  @doc """
  Create data source (POST /api/datasources). Example:

    iex> GrafanaElixir.Datasource.create('{"name": "test datasource", "type": "influxdb", "url": "http://localhost:8086", "access": "proxy"}')
    %HTTPoison.Response{_body, _headers, status_code: 200}
  """
  def create(json), do: @base_path |> HttpClient.post!(json)

  @doc """
  Update an existing datasource (PUT /api/datasources/:datasourceId). Example:

    iex> %HTTPoisonResponse{} = GrafanaElixir.Datasource.update(1, json)
  """
  def update(id, json), do: @base_path <> "/#{id}" |> HttpClient.put!(json)

  @doc """
  Delete an existing data source (DELETE /api/datasource/:datasourceId). Example:

    iex> %HTTPoisonResponse{} = GrafanaElixir.Datasource.delete(1)
  """
  def delete(id), do: @base_path <> "/#{id}" |> HttpClient.delete! 
end