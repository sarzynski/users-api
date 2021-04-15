namespace :database do
  desc 'Drop database, create, migrate and seed'
  task restart: :environment do
    progressbar = ProgressBar.create
    `rails db:drop`
    progressbar.progress = 20
    `rails db:create`
    progressbar.progress = 60
    `rails db:migrate`
    progressbar.progress = 80
    `rails db:seed`
    progressbar.progress = 100
  end

  desc 'Add email field to users table'
  task add_email: :environment do
    progressbar = ProgressBar.create
    `rails generate migration AddEmailToUsers email:string`
    progressbar.progress = 50
    `rails db:migrate`
    progressbar.progress = 100
  end
end
