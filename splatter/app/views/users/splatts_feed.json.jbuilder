json.array!(@feed) do |splatt|
  json.body splatt.body
  json.date_created splatt.created_at
  json.user_id splatt.user_id
end
