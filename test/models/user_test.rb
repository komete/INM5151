require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(nom: 'SAWADOGO', prenom: 'Fayçal', poste: '1', email: 'faycalsawadogo@gmail.com',
                 codeEmploye: 'SAWA23098900', telephone: '438-935-8129', username: 'Gangsta', administrateur: true,
                 password: 'admin2', password_confirmation: 'admin2', verified: true, verified_at: Time.zone.now)
  end

  test "Doit être valide" do
    assert @user.valid?
  end
end
