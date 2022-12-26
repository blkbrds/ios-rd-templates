# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'cocoapods', '1.11.3'
gem 'fastlane', '2.211.0'
gem 'xcov', '1.8.1'
gem 'danger', '9.1.0'
gem 'danger-swiftlint' , '0.31.0'
gem 'danger-xcode_summary', '1.2'
gem 'danger-swiftformat', '0.8.1'
gem 'danger-xcov', '0.5.0'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
