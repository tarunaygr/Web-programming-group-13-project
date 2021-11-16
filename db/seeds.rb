5.times do
    Book.create({
        B_id: Faker::Number.number(digits: 5),
        B_title: Faker::Book.title,
        Author: Faker::Book.author,
        Publisher: Faker::Book.publisher,
        Year: Faker::Number.between(from: 1770, to: 2020)

    })
end