defmodule GrafanaElixir.Dashboard do

  alias GrafanaElixir.HttpClient

  @base_url "api/dashboards"

  @doc """
  Get home dashboard
    iex> {:ok, dash} = G rafanaElixir.Dashboard.home
    ...> Map.keys(dash)
    ["dashboard", "meta"]
    iex> {:ok, dash} = GrafanaElixir.Dashboard.get
    ...> Map.keys(dash)
    ["dashboard", "meta"]
  """
  def home, do: "#{@base_url}/home" |> HttpClient.get!
  def get, do: home

	@doc """
  Retrieve a dashboard with the given slug (URL-friendly version
  of dashboard title)
    iex> {:ok, dash} = GrafanaElixir.Dashboard.get("my-fancy-dashboard")
    ...> Map.keys(dash)
    ["dashboard", "meta"]
  """
  def get(slug), do: "#{@base_url}/db/#{slug}" |> HttpClient.get!

  @doc """
  Update existing dashboard
    iex> {:ok, dash} = GrafanaElixir.Dashboard.update(%{})
    ...> Map.keys(dash)
    ["slug", "status", "version"]
  """
  def update(json), do: "#{@base_url}/db" |> HttpClient.post! json

  @doc """
  Create a new dashboard
    iex> Grafana.Dashboard.new(json)
  """
  def new(json), do: update json
end
