describe PagesController do
  it "can access about" do
    get :about

    expect(response).to have_http_status(200)
  end

  it "can access contact" do
    get :contact

    expect(response).to have_http_status(200)
  end
end