# Copyright (c) 2014 Rally Software Development
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#include for rally json library gem
require 'rally_api'
require 'csv'
require './lib/multi_io.rb'
require './lib/rally_user_helper.rb'
require './lib/go_user_permissions_template_generator.rb'

$user_list_filename_arg = ARGV[0]

if $user_list_filename_arg == nil
# This is the default for the file containing list of new users to create and load
    $user_list_filename = File.dirname(__FILE__) + "/" + 'new_user_list_template.txt'
else
    $user_list_filename = File.dirname(__FILE__) + "/" + $user_list_filename_arg
end

if File.exists?(File.dirname(__FILE__) + "/" + $user_list_filename) == false
    puts "New user file #{$user_list_filename} not found. Exiting."
    exit
end

begin
  go_user_permissions_template_generator($user_list_filename)
end