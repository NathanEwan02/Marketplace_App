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
      return is_manager
    end
  
    def edit?
      update?
    end
  
    def destroy?
      return is_manager
    end

    private

    def is_manager
        if @user.has_role?(:manager)
            return true
        else  
            return false 
        end
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
