class StacksController < ApplicationController
  layout 'backoffice'
  before_action :authenticate_user!
  before_action :set_stack, only: %i[edit update destroy]

  def index
    @stacks = Stack.all
  end

  def new
    @stack = Stack.new
  end

  def edit
  end
  
  def create
    @stack = Stack.new(stack_params)

    if @stack.save
      redirect_to stacks_path, notice: "Tecnologia adicionada com sucesso"
    else
      redirect_to stacks_path, alert: @stack.errors.full_messages
    end
  end

  def update
    if @stack.update(stack_params)
      redirect_to stacks_path, notice: "Tecnologia atualizada com sucesso"
    else
      redirect_to stack_path, alert: @stack.errors.full_messages
    end
  end

  def destroy
    @stack.destroy
    redirect_to stacks_url, notice: "Stack removida com sucesso!"
  end

  private

  def set_stack
    @stack = Stack.find(params[:id])
  end

  def stack_params
    params.require(:stack).permit(:name, :picture)
  end
  
end
