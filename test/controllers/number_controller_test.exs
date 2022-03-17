defmodule FibonacciApi.NumberControllerTest do
  use FibonacciApiWeb.ConnCase

  alias FibonacciApi.Number

  test "index returns 200" do
    response = get conn, "/api/numbers"
    assert response.status == 200
  end

  test "index returns all contacts" do
    number = %Number{value: 13, blacklisted: true}
              |> Repo.insert

    numbers_as_json = Repo.all(Number)
                       |> Poison.encode!

    response = get conn, "/api/numbers"
    assert response.resp_body == numbers_as_json
  end
end
