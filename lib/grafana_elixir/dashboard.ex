defmodule GrafanaElixir.Dashboard do

  alias GrafanaElixir.HTTPClient

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
  def home, do: HTTPClient.get "#{@base_url}/home"
  def get, do: home

	@doc """
  Retrieve a dashboard with the given slug (URL-friendly version
  of dashboard title)
    iex> {:ok, dash} = GrafanaElixir.Dashboard.get "my-fancy-dashboard"
    ...> Map.keys(dash)
    ["dashboard", "meta"]
  """
  def get(slug), do: HTTPClient.get "#{@base_url}/db/#{slug}"

end