defmodule GrafanaElixir.DashboardTest do
	use ExUnit.Case, async: true

  @dashboard_json ~s"""
    {
      "dashboard": {
      "id": null,
      "title": "Non existing dashboard"
    }
  }
  """

  test "creates dashboard" do
    GrafanaElixir.Dashboard.delete "non-existing-dashboard"
    assert GrafanaElixir.Dashboard.new @dashboard_json ==
    %HTTPoison.Response{status_code: 200}
  end
end
