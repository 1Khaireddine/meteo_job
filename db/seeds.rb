puts "Creating Company!"
company = Company.find_or_create_by!(
  name: "MakSystem",
  subdomain: "mak_system",
  website: "www.maksystem.com"
)

puts "Creating Superadmin!"

superadmin = Superadmin.find_or_create_by!(
  email: "superadmin@example.com"
) do |user|
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.password = 'password'
  user.company = company
  user.birth_date = Faker::Date.between(from: '1990-01-01', to: '2000-01-01')
  user.confirmed_at = Time.current # Confirming the user
end

puts "Creating Admin!"
admin = Admin.find_or_create_by!(
  email: "admin@example.com"
) do |user|
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.password = 'password'
  user.company = company
  user.birth_date = Faker::Date.between(from: '1990-01-01', to: '2000-01-01')
  user.confirmed_at = Time.current # Confirming the user
end

puts "Creating Candidates!"
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Candidate.find_or_create_by!(
    email: "#{first_name}.#{last_name}@example.com"
  ) do |candidate|
    candidate.first_name = first_name
    candidate.last_name = last_name
    candidate.password = 'password'
    candidate.birth_date = Faker::Date.between(from: '1990-01-01', to: '2000-01-01')
    candidate.confirmed_at = Time.current # Confirming the user
  end
end

puts "Creating Offers!"
offers_list = [
  "Développeur PL/SQL (H/F)",
  "Développeur SQL H/F",
  "Développeur Magento (PHP) H/F",
  "Développeur Windev (H/F)",
  "Architecte applicatif fonctionnel SI F/H",
  "DEVELOPPEUR AS400",
  "Ingénieur Développement Logiciel Python",
  "Développeur logiciel C# .Net H/F",
  "Développeur Ruby on rails",
  "Développeur C# .Net H/F",
  "Ingénieur en développement Spring Boot",
  "Ingénieur Développement et Conception Java/JEE (F/H)",
  "Développeur Frontend Angular",
  "Développeur React/Redux"
]

20.times do
  Offer.create!(
    title: offers_list.shuffle.first,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    expired_date: Date.current + 2.months,
    limit_date: Date.current + 2.months,
    company: company,
    user_id: admin.id
  )
end

puts "Creating Posts!"
20.times do
  Post.create!(
    user_id: Candidate.order("RANDOM()").first.id,
    offer_id: Offer.order("RANDOM()").first.id
  )
end
