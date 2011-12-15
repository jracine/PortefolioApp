namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do

    5.times do
      User.all(:limit => 2).each do |user|
        user.images.create!(:title => Faker::Lorem.words(5))
      end
    end
  end
end