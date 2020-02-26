# frozen_string_literal: true

module BrazeRuby
  module REST
    class CreateUserAliases < Base
      def perform(api_key, user_aliases: [])
        create_user_aliases(api_key, user_aliases) if user_aliases.present?
      end

      private

      def create_user_aliases(api_key, user_aliases)
        http.post '/users/alias/new', {
          'api_key': api_key,
          'user_aliases': user_aliases
        }
      end
    end
  end
end
