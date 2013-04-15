# Author:: Robert Choi
# Cookbook Name:: pacemaker
# Provider:: order
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
  resources = new_resource.resources

  unless resource_exists?(name)
      cmd = "crm configure order #{name} #{priority}:" 
      resources.each do |rsc|
        cmd << " #{rsc}"
      end

      e = execute "configure order #{name}" do
        command cmd
      end

      new_resource.updated_by_last_action(true)
      Chef::Log.info "Configured order '#{name}'."
  end
end

action :delete do
  name = new_resource.name
  cmd = "crm resource stop #{name}; crm configure delete #{name}"

    e = execute "delete order #{name}" do
      command cmd
      only_if { resource_exists?(name) }
    end

    new_resource.updated_by_last_action(true)
    Chef::Log.info "Deleted order '#{name}'."
end
