# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    class Connection < ActionCable::Connection::Base
      identified_by :current_person

      def connect
        self.current_person = find_verified_person
      end

      private

      def find_verified_person
        session_key = cookies.encrypted[Rails.application.config.session_options[:key]]
        verified_id = session_key['warden.person.person.key'][0][0]
        verified_person = Person.find_by(id: verified_id)
        return reject_unauthorized_connection unless verified_person

        verified_person
      end
    end
  end
end
