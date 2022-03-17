defmodule FibonacciApiWeb.NumberView do
  use FibonacciApiWeb, :view

  def render("index.json", %{numbers: numbers}) do
    render_many(numbers, FibonacciApiWeb.NumberView, "number.json")
  end

  def render("number.json", %{number: number}) do
    %{id: number.id,
      value: number.value,
      blacklisted: number.blacklisted}
  end
end