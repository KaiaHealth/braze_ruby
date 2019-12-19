# frozen_string_literal: true

module BrazeRuby
  module REST
    class ExportUsers < Base
      def perform(api_key, external_ids: nil, segment_id: nil, user_aliases: nil, email_address: nil, **options)
        if external_ids
          export_users_by_ids(api_key, external_ids)
        elsif segment_id
          export_users_by_segment(api_key, segment_id, options)
        elsif user_aliases
          export_users_by_user_aliases(api_key, user_aliases)
        elsif email_address
          export_users_by_email_address(api_key, email_address)
        else
          raise 'Search predicate is undefined! Please check you seach params'
        end
      end

      private

      def export_users_by_ids(api_key, external_ids)
        http.post '/users/export/ids', {
          'api_key': api_key,
          'external_ids': external_ids
        }
      end

      def export_users_by_segment(api_key, segment_id, options)
        http.post '/users/export/segment', {
          'api_key': api_key,
          'segment_id': segment_id
        }.merge(options)
      end

      def export_users_by_user_aliases(api_key, user_aliases)
        http.post '/users/export/ids', {
          'api_key': api_key,
          'user_aliases': user_aliases
        }
      end

      def export_users_by_email_address(api_key, email_address)
        http.post '/users/export/ids', {
          'api_key': api_key,
          'email_address': email_address
        }
      end
    end
  end
end
