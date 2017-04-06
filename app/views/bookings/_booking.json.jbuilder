json.extract! booking, :id, :date, :time, :duration, :description, :cost, :created_at, :updated_at
json.url booking_url(booking, format: :json)