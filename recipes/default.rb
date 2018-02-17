#
# Cookbook:: windows-training-config
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory 'c:/users/chef/chef-repo/cookbooks' do
  recursive true
end

directory 'c:/users/chef/bin'

windows_path 'c:/users/chef/bin' do
  action :add
end

file 'c:/users/chef/bin/vi.bat' do
  content <<-EOH
  vim %*
  powershell 'set-colors 60'
  cls
  EOH
end

cookbook_file 'c:/users/chef/set-font.ps1' do
  source 'set-font.ps1'
  notifies :run, 'batch[set font size]', :immediately
end

batch 'set font size' do
  code <<-EOH
  powershell set-font
  exit
  EOH
  action :nothing
end

cookbook_file 'c:/users/chef/bin/get-colors.ps1' do
  source 'get-colors.ps1'
end

cookbook_file 'c:/users/chef/bin/set-colors.ps1' do
  source 'set-colors.ps1'
end
  
cookbook_file 'c:/users/chef/bin/go.ps1' do
  source 'go.ps1'
end

cookbook_file 'c:/users/chef/documents/windowspowershell/Microsoft.PowerShell_profile.ps1' do
  source 'go.ps1'
end

directory 'c:/users/chef/tmp'

cookbook_file 'c:/users/chef/tmp/vim.zip' do
  source 'vim.zip'
end

execute 'c:/opscode/chefdk/embedded/git/usr/bin/unzip c:/users/chef/tmp/vim.zip' do
  cwd 'c:/users/chef'
  not_if { ::File.exist?('c:/users/chef/.vimrc') }
end
