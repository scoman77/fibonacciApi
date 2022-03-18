defmodule FibonacciApiWeb.NumberView do
  use FibonacciApiWeb, :view
  alias FibonacciApiWeb.NumberView

  def render("index.json", %{numbers: numbers}) do
    %{data: render_many(numbers, NumberView, "numbers.json")}
  end

  def render("show.json", %{number: number}) do
    %{data: render_one(number, NumberView, "number.json")}
  end

  def render("numbers.json", %{numbers: numbers}) do
    %{data: render_many(numbers, NumberView, "numbers.json")}
  end
end
