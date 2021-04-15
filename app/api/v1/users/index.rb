module V1
  module Users
    class Index < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :users do
        desc 'Return all users'
        get do
          users = ::UserServices::Sort.call(User.all).decorate
          present users
        end
      end
    end
  end
end
