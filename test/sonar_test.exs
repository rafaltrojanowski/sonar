defmodule SonarTest do
  use ExUnit.Case
  doctest Sonar

  test "greets the world" do
    assert Sonar.hello() == :world
  end
end
