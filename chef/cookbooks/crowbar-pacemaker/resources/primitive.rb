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

resource_name :primitive

actions :create, :update, :delete, :start, :stop

default_action :create

attribute :name, kind_of: String, name_attribute: true
attribute :agent, kind_of: String
attribute :params, kind_of: Hash, default: {}
attribute :meta, kind_of: Hash, default: {}
attribute :op, kind_of: Hash, default: {}

action :create do
  pacemaker_primitive :name do
    agent :agent
    params :params
    meta :meta
    op :op
    action :create
  end
end
