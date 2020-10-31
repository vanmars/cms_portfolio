class Seed

  def self.begin
    User.destroy_all
    Project.destroy_all
    Post.destroy_all
    seed = Seed.new
    seed.generate_admins_and_projects
    seed.generate_users_and_posts
  end

  def generate_admins_and_projects
    admin1 = User.create!(
        first_name: 'Vanessa',
        last_name: 'Stewart',
        username: 'vstew',
        email: 'test1@email.com',
        password: 'student',
        admin: true
    )
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
    6.times do |t|
      project = Project.create!(
        title: Faker::Book.title,
        description: Faker::Book.genre
      )
    end
    puts "6 projects successfully generated."
  end

  def generate_users_and_posts
    10.times do |index|
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: Faker::Internet.password
      )
      5.times do |index|
        post = Post.create!(
          title: Faker::Quotes::Shakespeare.as_you_like_it_quote,
          body: Faker::Lorem.paragraph(sentence_count: 5)
        )
        5.times do |index|
          comment = post.comments.create!(
            body: Faker::TvShows::MichaelScott.quote,
            user_id: user.id
          )
        end
      end
    end
    puts "10 users, 50 posts, 250 comments successfully generated."
  end
end

Seed.begin