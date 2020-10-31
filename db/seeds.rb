class Seed

  def self.begin
    User.destroy_all
    seed = Seed.new
    seed.generate_admins
    # seed.generate_users
  end

  def generate_admins
    admin1 = User.create!(
        first_name: 'Vanessa',
        last_name: 'Stewart',
        username: 'vstew',
        email: 'test1@email.com',
        password: 'student',
        admin: true
      )
      2.times do
      end
    admin2 = User.create!(
      first_name: 'Ada',
      last_name: 'Lovelace',
      username: 'alovelace',
      email: 'test2@email.com',
      password: 'master',
      admin: true
    )
    admin3 = User.create!(
      first_name: 'Mary',
      last_name: 'Somerville',
      username: 'asomerville',
      email: 'test3@email.com',
      password: 'legend',
      admin: true
    )
    puts "3 admins successfully generated."
  end

  def generate_users
    50.times do | index |
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: Faker::Internet.password
      )
    end
    puts "50 users successfully generated."
  end



end

Seed.begin