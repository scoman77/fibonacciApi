defmodule FibonacciApiWeb.NumberControllerTest do
  use FibonacciApiWeb.ConnCase

  import FibonacciApi.ItemsFixtures

  alias FibonacciApi.Items.Number

  @create_attrs %{
    blacklisted: true,
    description: "some description",
    value: 42
  }
  @update_attrs %{
    blacklisted: false,
    description: "some updated description",
    value: 43
  }
  @invalid_attrs %{blacklisted: nil, description: nil, value: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all numbers", %{conn: conn} do
      conn = get(conn, Routes.number_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create number" do
    test "renders number when data is valid", %{conn: conn} do
      conn = post(conn, Routes.number_path(conn, :create), number: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.number_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "blacklisted" => true,
               "description" => "some description",
               "value" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.number_path(conn, :create), number: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update number" do
    setup [:create_number]

    test "renders number when data is valid", %{conn: conn, number: %Number{id: id} = number} do
      conn = put(conn, Routes.number_path(conn, :update, number), number: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.number_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "blacklisted" => false,
               "description" => "some updated description",
               "value" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, number: number} do
      conn = put(conn, Routes.number_path(conn, :update, number), number: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete number" do
    setup [:create_number]

    test "deletes chosen number", %{conn: conn, number: number} do
      conn = delete(conn, Routes.number_path(conn, :delete, number))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.number_path(conn, :show, number))
      end
    end
  end

  defp create_number(_) do
    number = number_fixture()
    %{number: number}
  end
end
