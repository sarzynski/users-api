namespace :database do
  desc 'Drop database, create and migrate'
  task setup: :environment do
    progressbar = ProgressBar.create
    `rails db:drop`
    sleep 5
    progressbar.progress = 33
    `rails db:create`
    sleep 5
    progressbar.progress = 66
    `rails db:migrate`
    sleep 5
    progressbar.progress = 100
  end

  desc 'Add email field to users table'
  task add_email: :environment do
    progressbar = ProgressBar.create
    `rails generate migration AddEmailToUsers email:string`
    progressbar.progress = 50
    sleep 5
    `rails db:migrate`
    progressbar.progress = 100
  end
end
