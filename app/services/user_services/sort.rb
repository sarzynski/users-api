# frozen_string_literal: true

module UserServices
  class Sort < ApplicationService
    DEFAULT_SORT_DIRECTION = :desc

    def call(users)
      sort(users, DEFAULT_SORT_DIRECTION)
    end

    private

    def sort(users, sort_direction)
      users.order(id: sort_direction)
    end
  end
end
