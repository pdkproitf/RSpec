json.array!(@players) do |player|
  json.extract! player, :id, :name, :shirt_number_integer
  json.url player_url(player, format: :json)
end
