json.extract! appointment, :id, :title, :description, :appointment_date, :responsable, :user_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
