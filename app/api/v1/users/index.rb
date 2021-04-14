module V1
  module Users
    class Index < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :books do
        desc 'Return all users'
        get do
          users = User.all
          present users
        end
      end
    end
  end
end
