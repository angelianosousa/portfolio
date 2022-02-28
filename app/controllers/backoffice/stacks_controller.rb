class Backoffice::StacksController < BackofficeController
  before_action :set_stack, only: %i[edit update destroy delete_picture]

  def index
    @stacks = Stack.all.with_attached_picture
  end

  def new
    @stack = Stack.new
  end

  def edit
  end
  
  def create
    @stack = Stack.new(stack_params)

    if @stack.save
      redirect_to backoffice_stacks_path, notice: "Tecnologia adicionada com sucesso!"
    else
      redirect_to backoffice_stacks_path, alert: @stack.errors.full_messages
    end
  end

  def update
    if @stack.update(stack_params)
      redirect_to backoffice_stacks_path, notice: "Tecnologia atualizada com sucesso!"
    else
      redirect_to backoffice_stack_path, alert: @stack.errors.full_messages
    end
  end

  def destroy
    @stack.destroy
    redirect_to backoffice_stacks_url, notice: "Tecnologia removida com sucesso!"
  end

  def delete_picture
    @stack.picture.purge_later
    redirect_to backoffice_stacks_url, notice: "Imagem removida com sucesso!"
  end

  private

  def set_stack
    @stack = Stack.find(params[:id])
  end

  def stack_params
    params.require(:stack).permit(:name, :picture, :description)
  end
  
end
