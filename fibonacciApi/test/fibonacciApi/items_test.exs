defmodule FibonacciApi.ItemsTest do
  use FibonacciApi.DataCase

  alias FibonacciApi.Items

  describe "numbers" do
    alias FibonacciApi.Items.Number

    import FibonacciApi.ItemsFixtures

    @invalid_attrs %{extra: nil, shown: nil, value: nil}

    test "list_numbers/0 returns all numbers" do
      number = number_fixture()
      assert Items.list_numbers() == [number]
    end

    test "get_number!/1 returns the number with given id" do
      number = number_fixture()
      assert Items.get_number!(number.id) == number
    end

    test "create_number/1 with valid data creates a number" do
      valid_attrs = %{extra: "some extra", shown: true, value: 42}

      assert {:ok, %Number{} = number} = Items.create_number(valid_attrs)
      assert number.extra == "some extra"
      assert number.shown == true
      assert number.value == 42
    end

    test "create_number/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_number(@invalid_attrs)
    end

    test "update_number/2 with valid data updates the number" do
      number = number_fixture()
      update_attrs = %{extra: "some updated extra", shown: false, value: 43}

      assert {:ok, %Number{} = number} = Items.update_number(number, update_attrs)
      assert number.extra == "some updated extra"
      assert number.shown == false
      assert number.value == 43
    end

    test "update_number/2 with invalid data returns error changeset" do
      number = number_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_number(number, @invalid_attrs)
      assert number == Items.get_number!(number.id)
    end

    test "delete_number/1 deletes the number" do
      number = number_fixture()
      assert {:ok, %Number{}} = Items.delete_number(number)
      assert_raise Ecto.NoResultsError, fn -> Items.get_number!(number.id) end
    end

    test "change_number/1 returns a number changeset" do
      number = number_fixture()
      assert %Ecto.Changeset{} = Items.change_number(number)
    end
  end
end
