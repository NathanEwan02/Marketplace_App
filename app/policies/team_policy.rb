class TeamPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
      true
    end
  
    def show?
      true
    end
  
    def create?
      return is_manager
    end
  
    def new?
      create?
    end
  
    def update?
      return has_manager_id
    end
  
    def edit?
      update?
    end
  
    def destroy?
      return has_manager_id
    end

    private

    def is_manager
        if @user.has_role?(:manager)
            return true
        else  
            return false 
        end
    end

    def has_manager_id
      if is_manager == true && @team.manager_id == current_user.id
        return true
      else
        return false
    end
  
    class Scope
        def initialize(user, scope)
            @user = user
            @scope = scope
        end
  
        def resolve
            scope.all
        end
  
        private
  
        attr_reader :user, :scope
    end
end
