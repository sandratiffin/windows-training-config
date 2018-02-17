#
# Cookbook:: windows-training-config
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory 'c:/users/administrator/bin'

windows_path 'c:/users/administrator/bin' do
  action :add
end

file 'c:/users/administrator/bin/vi.bat' do
  content <<-EOH
  vim %*
  EOH
end
