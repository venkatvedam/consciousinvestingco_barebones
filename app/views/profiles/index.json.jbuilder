json.array!(@profiles) do |profile|
  json.extract! profile, :id, :e, :s, :g
  json.url profile_url(profile, format: :json)
end
