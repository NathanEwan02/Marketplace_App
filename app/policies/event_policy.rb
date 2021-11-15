
class EventPolicy
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
        return manager_or_org
    end
  
    def new?
      create?
    end
  
    def update?
        return manager_or_org
    end
  
    def edit?
      update?
    end
  
    def destroy?
        return manager_or_org
    end

    private 

    def manager_or_org
        if @user.has_role?(:manager) || @user.has_role?(:organiser)
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

  