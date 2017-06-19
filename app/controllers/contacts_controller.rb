class ContactsController < ApplicationController
  before_action :contact_params, only: [:create]

  def new
    if params[:back]
    @contact = Contact.new(contact_params)
    else
    @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "お問い合わせが完了しました！"
      NoticeMailer.sendmail_contact(@contact).deliver
    else
      render "new"
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
