require "rails_helper"

describe V1::ContactsController do
  it "request index and is 406 Not Acceptable" do
    get :index
    expect(response).to have_http_status :not_acceptable
  end

  it "request index and is 200 ok" do
    request.accept = "application/vnd.api+json"
    get :index
    expect(response).to have_http_status :ok
  end

  it "GET v1/contacts/:id" do
    contact = Contact.first
    request.accept = "application/vnd.api+json"
    get :show, params: { id: contact.id }
    response_body = JSON.parse(response.body)
    expect(response_body.fetch("data").fetch("id")).to eq contact.id.to_s
  end
end
