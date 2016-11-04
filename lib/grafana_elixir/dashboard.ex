defmodule GrafanaElixir.Dashboard do

  alias GrafanaElixir.HttpClient

  @base_path "api/dashboards"

  @doc """
  Fetch home dashboard
    iex> {:ok, dash} = GrafanaElixir.Dashboard.home
    ...> Map.keys(dash)
    ["dashboard", "meta"]
    iex> {:ok, dash} = GrafanaElixir.Dashboard.get
    ...> Map.keys(dash)
    ["dashboard", "meta"]
  """
  def home, do: "#{@base_path}/home" |> HttpClient.get!
  def get, do: home

	@doc """
  Fetch a dashboard with given slug (URL-friendly version
  of dashboard title)
    iex> {:ok, dash} = GrafanaElixir.Dashboard.get("my-fancy-dashboard")
    ...> Map.keys(dash)
    ["dashboard", "meta"]
  """
  def get(slug), do: "#{@base_path}/db/#{slug}" |> HttpClient.get!

  @doc """
  Update an existing dashboard
    iex> {:ok, dash} = GrafanaElixir.Dashboard.update(%{})
    ...> Map.keys(dash)
    ["slug", "status", "version"]
  """
  def update(json), do: "#{@base_path}/db" |> HttpClient.post!(json)

  @doc """
  Create a new dashboard

  ## Examples

    # iex> GrafanaElixir.Dashboard.delete("non-existing-dashboard")

    ...> GrafanaElixir.Dashboard.new(json)
    ["foo"]
    # 

  """
  def new(json), do: update(json)

  @doc """
  Delete an existing dashboard with given slug (URL-friendly
  version of the dashboard title)
  
  ## Examples

    iex> slug = "non-existing-dashboard"
    ...> GrafanaElixir.Dashboard.delete(slug)
    ["bar"]

  """
  def delete(slug), do: "#{@base_path}/db/#{slug}" |> HttpClient.delete!
end
