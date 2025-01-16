class MissionControlController < ApplicationController
  # MissionControl is authorized via HTTP Basic Authentication
  allow_unauthenticated_access
  allow_unauthorized_access
end
