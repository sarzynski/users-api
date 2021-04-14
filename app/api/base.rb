class Base < Grape::API
  mount V1::Users::Index
end