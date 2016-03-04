source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'puppet', puppetversion
group :development, :test do
  gem 'puppetlabs_spec_helper', '>= 0.8.2'
  gem 'puppet-lint', '>= 1.0.0'
  gem 'facter', '>= 1.7.0'
  gem 'rspec-puppet-facts', :require => 'false'
  gem 'puppet-openstack_spec_helper',
      :git => 'https://git.openstack.org/openstack/puppet-openstack_spec_helper',
      :require => false
end

group :system_tests do
  gem 'beaker-rspec',                 :require => 'false'
  gem 'beaker-puppet_install_helper', :require => 'false'
  gem 'r10k',                         :require => 'false'
end

