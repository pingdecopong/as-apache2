require 'serverspec'

set :backend, :exec


describe package('httpd') do
  it { should be_installed }
end

describe process('httpd') do
  it { should be_running }
end

describe port('80') do
  it { should be_listening }
end

#サンプルHTML作成
`echo aaa > /var/www/html/test.html`

#エイリアス用ディレクトリ＆HTMLファイル作成
`mkdir /var/www/html/sub`
`echo bbb > /var/www/html/sub/alias.html`

describe command('curl localhost/test.html') do
  its(:stdout) { should match /aaa/ }
end

describe command('curl localhost/ts/alias.html') do
  its(:stdout) { should match /bbb/ }
end
