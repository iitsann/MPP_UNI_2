json.extract! profile, :id, :username, :user_id, :avatar_url, :region, :created_at, :updated_at
json.url profile_url(profile, format: :json)
