defmodule FibonacciApi.NumberGenerator do
  def compute(0), do: 0
  def compute(1), do: 1
  def compute(n), do: compute(n - 1) + compute(n - 2)
end