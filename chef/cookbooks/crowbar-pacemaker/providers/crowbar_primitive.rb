#
# 2017, SUSE
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

require "shellwords"

this_dir = ::File.dirname(__FILE__)
require ::File.expand_path("../../pacemaker/libraries/pacemaker", this_dir)
require ::File.expand_path("../../pacemaker/libraries/chef/mixin/pacemaker", this_dir)

include Chef::Mixin::Pacemaker::RunnableResource

action :create do
  name = new_resource.name

  if @current_resource_definition.nil?
    create_resource(name)
  else
    update_resource(name)
  end

  pacemaker_primitive name do
    agent agent
    op op
    params params
    meta meta
    action :create
  end
end

action :update do
  unless @current_resource_definition.nil?
    update_resource(new_resource.name)
  end

  pacemaker_primitive name do
    agent agent
    op op
    params params
    meta meta
    action :update
  end
end

action :delete do
  pacemaker_primitive name do
    agent agent
    op op
    params params
    meta meta
    action :delete
  end
  
  delete_runnable_resource
end

action :start do
  pacemaker_primitive name do
    agent agent
    op op
    params params
    meta meta
    action :start
  end
end

action :stop do
  pacemaker_primitive name do
    agent agent
    op op
    params params
    meta meta
    action :stop
  end
end

def cib_object_class
  ::CrowbarPacemaker::Resource::Primitive
end

def load_current_resource
  standard_load_current_resource
end

def resource_attrs
  [:agent, :params, :meta]
end

