Fabricator(:vendor) do
  name { Faker::Name.name}
  address { Faker::Address.street_address}
  email { Faker::Internet.email}
  phone { Faker::Number.number(10)}
end
