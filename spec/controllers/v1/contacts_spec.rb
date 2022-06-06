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
end
