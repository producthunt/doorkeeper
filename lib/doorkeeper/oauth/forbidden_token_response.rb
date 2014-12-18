module Doorkeeper
  module OAuth
    class ForbiddenTokenResponse < ErrorResponse
      def self.from_scopes(scopes, attributes = {})
        new(attributes.merge(scopes: scopes))
      end

      def initialize(attributes = {})
        super(attributes.merge(name: :invalid_scope, state: :unauthorized))
        @scopes = attributes[:scopes]
      end

      def status
        :unauthorized
      end

      def headers
        headers = super
        headers.delete 'WWW-Authenticate'
        headers
      end

      def description
        scope = { scope: [:doorkeeper, :scopes] }
        @description ||= @scopes.map { |r| I18n.translate r, scope }.join('\n')
      end
    end
  end
end
