#!/usr/bin/env ruby

require 'bundler/setup'

require File.expand_path('../../lib/force_require', __FILE__)
force_require 'ir_b' # need `gem install ir_b`
ir b
