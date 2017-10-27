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

use_inline_resources if defined?(use_inline_resources)

action :create do
  name = new_resource.name

  pacemaker_primitive name do
    agent agent
    op op
    params params
    meta meta
    action :create
  end
end

action :update do
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

