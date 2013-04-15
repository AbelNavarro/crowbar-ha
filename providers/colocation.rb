# Author:: Robert Choi
# Cookbook Name:: pacemaker
# Provider:: colocation
#
# Copyright:: 2013, Robert Choi
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

require ::File.join(::File.dirname(__FILE__), 'helper')

action :create do
  name = new_resource.name
  priority = new_resource.priority
  multiple = new_resource.multiple

  unless resource_exists?(name)
    if multiple
      multiple_rscs = new_resource.multiple_rscs

      cmd = "crm configure colocation #{name} #{priority}:" 
      multiple_rscs.each do |rsc|
        cmd << " #{rsc}"
      end

      e = execute "configure colocation #{name}" do
        command cmd
      end

      new_resource.updated_by_last_action(true)
      Chef::Log.info "Configured colocation '#{name}'."
    else
      rsc = new_resource.rsc
      with_rsc = new_resource.with_rsc

      cmd = "crm configure colocation #{name} #{priority}: #{rsc} #{with_rsc}" 
      e = execute "configure colocation #{name}" do
        command cmd
      end

      new_resource.updated_by_last_action(true)
      Chef::Log.info "Configured colocation '#{name}'."
    end
  end
end

action :delete do
  name = new_resource.name
  cmd = "crm resource stop #{name}; crm configure delete #{name}"

    e = execute "delete colocation #{name}" do
      command cmd
      only_if { resource_exists?(name) }
    end

    new_resource.updated_by_last_action(true)
    Chef::Log.info "Deleted colocation '#{name}'."
end
