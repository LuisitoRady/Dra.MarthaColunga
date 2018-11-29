json.extract! user, :id, :names, :lastnames, :type, :age, :cellphone, :email, :init_preg_week, :salary, :category_id, :created_at, :updated_at
json.url user_url(user, format: :json)
