### puma
---

https://github.com/puma/puma

https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server

```sh
gem install puma
puma

rails server
bundle exec puma
ruby app.rb -s Puma

puma -t 8:32
puma -t 8:32 -w 3
puma -w 3 --preload

puma -b tcp://127.0.0.1:9292
puma -b unix://var/run/puma.sock
puma -b 'unix:///var/run/puma.socke?unmask=0111'
puma -b 'ssl://127.0.0.1:9292?key=path_to_key&cert=path_to_cert'
puma -b 'ssl://127.0.0.1:9292?key=path_to_key&cert_to_cert&ssl_cipher_filter=!aNULL:AES+SHA'
puma -b 'ssl://127.0.0.1:9292?keystore=path_to_keystore&keystore&keystore-pass=keystore_password&ssl_cipher_list=TLS_RSA_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA'
puma -b 'ssl://127.0.0.1:9292?key=path_to_key&cert=path_to_cert&no_tlsv1=true'
puma --control-url tcp://127.0.0.1:9293 --control-token foo
pumactl --control-url 'tcp://127.0.0.1:9393' --control-token foo restart
puma -C /path/to/config
puma -C "-"
```

```rb
require 'sinatra'
configure { set :server, :puma }
# config/puma.rb
workers 3
preload_app!

on_worker_boot do
end

before_fork do
end

lowlevel_error_handler do |e|
  Rollbar.critical(e)
  [500, {}, ["An error has occurred, and engineers have been informed. Please reload the page. If you continue to have problems, contact support@example.com\n"]]
end

if %w(2.2.7 2.2.8. 2.2.9 2.2.10 2.3.4 2.4.1).include? RUBY_VERSION
  begin
    require 'stopgap_13632'
  rescue LoadError
  end
end
```

```
```









