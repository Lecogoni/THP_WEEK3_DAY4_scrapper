require_relative '../lib/02_deputy'

describe "get_townhall_email" do
  # Fetch l'email de la mairie correspondant à l'URL
  it 'give me the email of the deputy' do
    expect(get_deputy_email("https://www.nosdeputes.fr/julien-aubert")).to eq("contact@julienaubert.fr")
    expect(get_deputy_email("https://www.nosdeputes.fr/geraldine-bannier")).to eq("geraldine.bannier@assemblee-nationale.fr")
  end
end
