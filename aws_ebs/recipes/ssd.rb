#
# Cookbook Name:: aws_ebs
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'aws'

device = '/dev/xvdj'
mntdir = '/mnt/ssd'

aws_ebs_volume "ssd_ebs_volume" do
  aws_access_key node['aws_ebs']['aws_access_key_id']
  aws_secret_access_key node['aws_ebs']['aws_secret_access_key']
  size 50
  device device
  volume_type 'gp2'
  action [ :create, :attach ]
end

execute 'format drive' do
  command 'mkfs -t ext4 ' + device
  not_if "file -s #{device} | grep ext4"
end

directory mntdir do
  owner 'root'
  group 'root'
  mode 00644
end

mount mntdir do
  device device
  fstype 'ext4'
  action [:mount, :enable]
end