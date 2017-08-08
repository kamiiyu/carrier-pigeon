json.extract! event, :id, :name, :started_at, :ended_at, :capacity, :description, :status, :created_at, :updated_at
json.url event_url(event, format: :json)
