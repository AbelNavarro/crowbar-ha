action :create do
  pacemaker_primitive :name do
    agent :agent
    params :params
    meta :meta
    op :op
    action :create
  end
end

action :update do
  pacemaker_primitive :name do
    agent :agent
    params :params
    meta :meta
    op :op
    action :update
  end
end

