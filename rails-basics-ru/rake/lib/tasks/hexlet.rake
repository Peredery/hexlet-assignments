require 'csv'

namespace :hexlet do
  desc "TODO"
  task :import_users, [:file] => :environment do |t, args|
    path = args[:file]
    CSV.parse(File.read(path), headers: true) do |row|
      User.create({
                    first_name: row['first_name'],
                    last_name: row['last_name'],
                    email: row['email'],
                    birthday: Date.strptime(row['birthday'], '%m/%d/%Y'),
                  })
    end
  end
end
