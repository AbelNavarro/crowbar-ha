#
# Cookbook Name:: haproxy
# Recipe:: setup
#
# Copyright 2014, SUSE
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package node[:haproxy][:platform][:package]

template node[:haproxy][:platform][:config_file] do
  source "haproxy.cfg.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    lazy {
      {
        rate_limit_enabled: node[:haproxy][:sections].keys.each.any? {
            |type| node[:haproxy][:sections][type].any? {
              |service, values| !values["rate_limit"].nil? && !values["rate_limit"].to_i.zero?
          }
        }
      }
    }
  )
end

directory node[:haproxy][:platform][:error_dir] do
  action :create
  owner "root"
  group "root"
  mode 0o644
end

cookbook_file "#{node[:haproxy][:platform][:error_dir]}/429.http" do
  source "429.http"
  action :create
  owner "root"
  group "root"
  mode 0o644
end
