#! /usr/bin/env ruby

require 'rubygems'
require 'mechanize'

DEBUG = false

# config
redmine_url = "http://<URL>/redmine"
login_url = "#{redmine}/login"
project_url = '#{redmine}/projects/xxxxx/repository'

begin 
  a = Mechanize.new
  # login
  a.get(login_url) do |page|
    p page if DEBUG
    page.form_with(:action => '/redmine/login') do |f|
      f.username  = "user"
      f.password   = "pass"
    end.click_button
  end

  # open repository url
  a.get(project_url) do |page|
    p page if DEBUG
  end
rescue => ex
  p ex
end
