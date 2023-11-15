defmodule LogSinkTest do
  use ExUnit.Case
  doctest LogSink

  test "greets the world" do
    assert LogSink.hello() == :world
  end
end
