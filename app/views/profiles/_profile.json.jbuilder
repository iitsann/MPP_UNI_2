json.extract! profile, :id, :login, :email, :gender, :birth_date, :age, :city, :user_id, :hobbies, :created_at, :updated_at
json.url profile_url(profile, format: :json)
