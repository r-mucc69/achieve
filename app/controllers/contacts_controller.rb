class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end
  
  def new
    if params[:back]
     @contact = Contact.new(contacts_params)
    else
     @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      redirect_to root_path, notice: "お問い合わせが完了しました！"
    end
  end

  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
    
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
