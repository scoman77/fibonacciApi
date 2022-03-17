defmodule FibonacciApiWeb.NumberView do
  use FibonacciApiWeb, :view
  alias FibonacciApiWeb.NumberView

  def render("index.json", %{numbers: numbers}) do
    %{data: render_many(numbers, NumberView, "number.json")}
  end

  def render("show.json", %{number: number}) do
    %{data: render_one(number, NumberView, "number.json")}
  end

  def render("number.json", %{number: number}) do
    %{
      id: number.id,
      value: number.value,
      description: number.description,
      blacklisted: number.blacklisted
    }
  end
end
