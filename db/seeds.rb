# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'user1@gmail.com', password: 'user1')

user2 = User.create(email: 'user2@gmail.com', password: 'user2')

user3 = User.create(email: 'user3@gmail.com', password: 'user3')

user4 = User.create(email: 'user4@gmail.com', password: 'user4')

job1 = Job.create(
    title: "Rails Developer",
    salary_per_hour: 30,
    languages:  ["english", "german"],
    shift_dates: 2,
    user_id: user1.id
    )

Job.create(
    title: "Senior Developer",
    salary_per_hour: 50,
    languages:  ["english"],
    shift_dates: 3,
    user_id: user1.id
)

Job.create(
    title: "Project Manager",
    salary_per_hour: 100,
    languages:  ["latin"],
    shift_dates: 3,
    user_id: user1.id
)  

Job.create(
    title: "Senior  Manager",
    salary_per_hour: 120,
    languages:  ["italian"],
    shift_dates: 4,
    user_id: user1.id
)  