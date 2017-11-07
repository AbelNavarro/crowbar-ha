action :create do
  Chef::Log.warn("XXX :create")
  pacemaker_primitive new_resource.name do
    agent new_resource.agent
    params new_resource.params
    meta new_resource.meta
    op new_resource.op
    action :create
  end
end

action :update do
  Chef::Log.warn("XXX :update")
  pacemaker_primitive new_resource.name do
    agent new_resource.agent
    params new_resource.params
    meta new_resource.meta
    op new_resource.op
    action :update
  end
end

action :delete do
  pacemaker_primitive new_resource.name do
    agent new_resource.agent
    params new_resource.params
    meta new_resource.meta
    op new_resource.op
    action :delete
  end
end

action :start do
  pacemaker_primitive new_resource.name do
    agent new_resource.agent
    params new_resource.params
    meta new_resource.meta
    op new_resource.op
    action :start
  end
end

action :stop do
  pacemaker_primitive new_resource.name do
    agent new_resource.agent
    params new_resource.params
    meta new_resource.meta
    op new_resource.op
    action :stop
  end
end
