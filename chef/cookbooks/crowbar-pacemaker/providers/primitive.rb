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

def cib_object_class
  ::CrowbarPacemaker::Resource::Primitive
end

def load_current_resource
  standard_load_current_resource
end

def resource_attrs
  [:agent, :params, :meta]
end

def create_resource(name)
  standard_create_resource
end

