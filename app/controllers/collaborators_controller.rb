class CollaboratorsController < ApplicationController


def new
        @collaborator = Collaborator.new
    end
    def create
        @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
        
        if @collaborator.save
            flash[:notice] = "Collaborator was saved."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error saving your collaborator, please try again."
            render :new
        end
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator = Collaborator.find(params[:id])
        @collaborator_email = User.find(@collaborator.user_id)
        
        if @collaborator.destroy
            flash[:notice] = "#{@collaborator_email.email} is removed as a collaborator."
            redirect_to edit_wiki_path(@wiki)
        else
            flash[:alert] = "There was an error. Please try again."
            redirect_to edit_wiki_path(@wiki)
        end
    end

end
