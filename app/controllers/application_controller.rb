class ApplicationController < ActionController::Base
  before_action :login
  before_action :logging_authenticated_user

  private

    # Basic認証を行う
    def login
      authenticate_or_request_with_http_basic('authentication') do |username, password|
        username == basic_auth_username && Digest::SHA1.hexdigest(password) == basic_auth_password
      end
    end

    def basic_auth_username
      'test'
    end

    def basic_auth_password
      '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8' # hash of 'password'
    end

    # 認証したユーザ情報をログに出力する
    def logging_authenticated_user
      username = ActionController::HttpAuthentication::Basic.user_name_and_password(request).first
      logger.info "authenticated user: #{username}"
    end
end
