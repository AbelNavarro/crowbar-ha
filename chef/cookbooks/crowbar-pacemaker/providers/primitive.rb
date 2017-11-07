action :create do
  Chef::Log.warn("XXX :create")
  pacemaker_primitive :name do
    agent :agent
    params :params
    meta :meta
    op :op
    action :create
  end
end

action :update do
  Chef::Log.warn("XXX :update")
  pacemaker_primitive :name do
    agent :agent
    params :params
    meta :meta
    op :op
    action :update
  end
end

action :delete do
  pacemaker_primitive :name do
    agent :agent
    params :params
    meta :meta
    op :op
    action :delete
  end
end

action :start do
  pacemaker_primitive :name do
    agent :agent
    params :params
    meta :meta
    op :op
    action :start
  end
end

action :stop do
  pacemaker_primitive :name do
    agent :agent
    params :params
    meta :meta
    op :op
    action :stop
  end
end

module CrowbarPacemaker
  class CrowbarPacemaker::Resource::Primitive
    register_type :primitive
  end
end
