class NodeController < ApplicationController
  def index
    @nodes = Node.all
  end

  def new
    @node = Node.new
  end

  def create
    if Node.create(permit_params)
      flash[:notice] = "Node successfully added"
      redirect_to node_index_path
    else
      flash[:alert] = "error occured"
      redirect_to new_node_path
    end
  end

  def edit
    @node = Node.find_by(id: params[:id])
  end

  def update
    @node = Node.find_by(id: params[:id])
    @node.name = permit_params[:name]
    @node.location = permit_params[:location]
    if @node.save
      flash[:notice] = "Node successfully updated"
      redirect_to node_index_path
    else
      flash[:alert] = "error occured"
      redirect_to edit_node_path
    end
  end

  def destroy
    if Node.find_by(id: params[:id]).destroy
      flash[:notice] = "Node successfully deleted"
      redirect_to node_index_path
    else
      flash[:alert] = "error occured"
      redirect_to node_index_path
    end
  end

  private
  def permit_params
    params.require(:node).permit(:name, :location)
  end
end
