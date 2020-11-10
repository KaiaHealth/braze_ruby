# frozen_string_literal: true

module BrazeRuby
  module REST
    class DeleteUserAliases < Base
      def perform(api_key, user_aliases: [])
        delete_user_aliases(api_key, user_aliases) if user_aliases.present?
      end

      private

      def delete_user_aliases(api_key, user_aliases)
        http.post '/users/delete', {
          'api_key': api_key,
          'user_aliases': user_aliases
        }
      end
    end
  end
end
