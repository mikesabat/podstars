json.extract! podcast, :id, :name, :host, :feed, :desctiption, :homepage, :created_at, :updated_at
json.url podcast_url(podcast, format: :json)
