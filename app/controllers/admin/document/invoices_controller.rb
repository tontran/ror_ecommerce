class Admin::Document::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.includes([:order]).all
  end
  
  def show
    @invoice = Invoice.includes([:order]).find(params[:id])
    respond_to do |format|
      format.html
      format.pdf { render :layout => false }
    end
  end
  
  def destroy
    @invoice = Invoice.includes([:order]).find(params[:id])
    @invoice.cancel_authorized_payment
    redirect_to admin_document_invoices_url
  end
  
  private
  
  def form_info
    
  end
end