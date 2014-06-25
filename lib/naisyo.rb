require 'naisyo/version'
require 'openssl'
require 'base64'

module Naisyo
  class Encrypter
    def initialize(password)
      @password = password
      @cipher = OpenSSL::Cipher::Cipher.new('AES-256-CBC')
    end

    def encrypt(data)
      @cipher.encrypt
      @cipher.pkcs5_keyivgen(@password, 'sakigake')
      result = @cipher.update(data) + @cipher.final
      enc = Base64.encode64(result).encode('utf-8').chomp
      enc.gsub(/[\/\+=]/, '/' => '-', '+' => '_', '=' => ',')
    end

    def decrypt(data)
      @cipher.decrypt
      @cipher.pkcs5_keyivgen(@password, 'sakigake')
      result = data.gsub(/[-_,]/, '-' => '/', '_' => '+', ',' => '=')
      dec = Base64.decode64(result).encode('ascii-8bit').chomp
      begin
        @cipher.update(dec) + @cipher.final
      rescue OpenSSL::Cipher::CipherError
        'Incorrect Password'
      end
    end
  end
end
