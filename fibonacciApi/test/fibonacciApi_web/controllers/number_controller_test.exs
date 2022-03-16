defmodule FibonacciApiWeb.NumberControllerTest do
  use FibonacciApiWeb.ConnCase

  import FibonacciApi.ItemsFixtures

  @create_attrs %{extra: "some extra", shown: true, value: 42}
  @update_attrs %{extra: "some updated extra", shown: false, value: 43}
  @invalid_attrs %{extra: nil, shown: nil, value: nil}

  describe "index" do
    test "lists all numbers", %{conn: conn} do
      conn = get(conn, Routes.number_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Numbers"
    end
  end

  describe "new number" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.number_path(conn, :new))
      assert html_response(conn, 200) =~ "New Number"
    end
  end

  describe "create number" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.number_path(conn, :create), number: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.number_path(conn, :show, id)

      conn = get(conn, Routes.number_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Number"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.number_path(conn, :create), number: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Number"
    end
  end

  describe "edit number" do
    setup [:create_number]

    test "renders form for editing chosen number", %{conn: conn, number: number} do
      conn = get(conn, Routes.number_path(conn, :edit, number))
      assert html_response(conn, 200) =~ "Edit Number"
    end
  end

  describe "update number" do
    setup [:create_number]

    test "redirects when data is valid", %{conn: conn, number: number} do
      conn = put(conn, Routes.number_path(conn, :update, number), number: @update_attrs)
      assert redirected_to(conn) == Routes.number_path(conn, :show, number)

      conn = get(conn, Routes.number_path(conn, :show, number))
      assert html_response(conn, 200) =~ "some updated extra"
    end

    test "renders errors when data is invalid", %{conn: conn, number: number} do
      conn = put(conn, Routes.number_path(conn, :update, number), number: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Number"
    end
  end

  describe "delete number" do
    setup [:create_number]

    test "deletes chosen number", %{conn: conn, number: number} do
      conn = delete(conn, Routes.number_path(conn, :delete, number))
      assert redirected_to(conn) == Routes.number_path(conn, :index)

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
