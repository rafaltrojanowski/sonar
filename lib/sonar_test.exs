defmodule SonarTest do

  use ExUnit.Case

  doctest Sonar

  test "if the app will load the data from the csv file correctly" do
    assert Sonar.init ==
      %Sonar{
        last_id: 2,
        locations: %{
          1 => %Location{
            depth: "0.0",
            id: 1,
            lat: "17.961236753808073",
            lng: "53.332574617479544"},
          2 => %Location{
            depth: "1.0104288753409791",
            id: 2,
            lat: "17.96125478055402",
            lng: "53.332574617479544"
          }
        }
      }
  end
end
