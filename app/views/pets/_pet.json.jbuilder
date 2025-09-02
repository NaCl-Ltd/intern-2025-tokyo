json.extract! pet, :id, :user_id, :name, :birth_date, :species, :created_at, :updated_at
json.url pet_url(pet, format: :json)
