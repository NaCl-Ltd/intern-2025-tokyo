namespace :users do
  desc "Populate birth_date with random 10~80 age range"
  task populate_birth_dates: :environment do
    User.find_each do |user|
      age = rand(10..80)
      user.update_columns(birth_date: age.years.ago.to_date - rand(365))
    end
    puts "Birth dates populated for all users."
  end
end