defmodule IndealsWeb.Helpers.TextHelper do
  def truncate(text, opts \\ []) do
    max_length  = opts[:max_length] || 60
    omission    = opts[:omission] || "..."
    cond do
        not String.valid?(text) -> 
        text
        String.length(text) < max_length -> 
        text
        true ->
        length_with_omission = max_length - String.length(omission)

        "#{String.slice(text, 0, length_with_omission)}#{omission}"
    end
  end

  def get_location(key) do
    locations = Application.get_env(:indeals, :locations)
    Map.get(locations, key, "")
  end

  def format_datetime(datetime, format) do
    {:ok, result} = datetime |> Timex.format(format, :strftime)
    result
  end
end