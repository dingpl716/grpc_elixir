defmodule GrpcElixirTest do
  use ExUnit.Case
  doctest GrpcElixir

  test "greets the world" do
    assert GrpcElixir.hello() == :world
  end
end
