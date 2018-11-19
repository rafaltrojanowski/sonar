defmodule Sonar do

  @path_env %{dev: "sl2tocsv.csv", test: "sl2tocsv_test.csv"}
  @separator " "
  @eol ";\n"

  defstruct last_id: 0, locations: %{}

  def init do
    Path.join(["lib", @path_env[Mix.env]])
      |> read_file!
      |> format
  end

  defp read_file!(path) do
    path
    |> File.stream!
    |> Stream.map(&String.replace(&1, @eol, ""))
    |> Stream.with_index
  end

  defp format(input) do
    format_locations = fn({el, line_num}, acc) ->
      id = line_num + 1
      [lat, lng, depth] = String.split(el, @separator)
      Map.put(acc, id, %Location{id: id, lat: lat, lng: lng, depth: depth})
    end

    locations = Enum.reduce(input, %{}, format_locations)
    last_id = Map.keys(locations) |> Enum.max

    %Sonar{last_id: last_id, locations: locations}
  end
end
