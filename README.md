# Naisyo

Naisyo presents irreversible encryption.

## Installation

Add this line to your application's Gemfile:

    gem 'naisyo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install naisyo

## Usage

```
secret = 'secret'

encrypter = Naisyo::Encrypter.new('your_password')

encrypter.encrypt(secret)

#=> "NQJHz0vMs9beV49GTyOSqA,,"
```

```
secret = "NQJHz0vMs9beV49GTyOSqA,,"

encrypter = Naisyo::Encrypter.new('your_password')

encrypter.decrypt(secret)

#=> "secret"
```
