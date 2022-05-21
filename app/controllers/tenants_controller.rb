class TenantsController < ApplicationController
    def index
        tenants = Tenant.all 
        render json: tenants, status: :ok,
        adapter: nil, only: [:name]
      end
    
      def show 
        tenants = find_tenant
        render json: tenants, status: :ok 
      end
    
      def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created 
      end
    
      def update 

        tenant = find_tenant
        tenant.update!(tenant_params)
        render json: tenant, status: :ok
    
      end
    
      def destroy 
        tenant = find_tenant
        tenant.destroy
        head :no_content, status: :no_content #also referred to as 204
      end
    
    private 
    
    def tenant_params
        params.permit(:name, :age)
    end

    def find_tenant 
        tenants = Tenant.find(params[:id])
    end

end
