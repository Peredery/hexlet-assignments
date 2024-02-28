# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      hostname = 'https://rails-collective-blog-ru.hexlet.app'
      reg_path = '/users/sign_up/'
      reg_post_path = '/users'

      uri = URI(hostname)
      http = Net::HTTP.new(uri.host, uri.port)
      response = Net::HTTP.get_response(URI.join(hostname, reg_path))

      token = Nokogiri::HTML(response.body).at('input[@name="authenticity_token"]')['value']
      cookies = response['set-cookie']

      reg_req = Net::HTTP::Post.new(URI.join(hostname, reg_post_path))
      reg_req['Cookie'] = cookies
      reg_req['Content-Type'] = 'application/x-www-form-urlencoded'
      reg_req.body = URI.encode_www_form(
        'user[email]' => email,
        'user[password]' => password,
        'user[password_confirmation]' => password,
        'authenticity_token' => token,
        'commit' => 'Регистрация'
      )

      reg_response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(reg_req)
      end

      reg_response.code == '303'
    end
  end
end
