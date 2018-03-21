require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)

%w(will_paginate will_paginate/active_record).each {|lib| require lib}

run LittleShopApp
