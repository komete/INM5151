require 'test_helper'

class TronconRoutesControllerTest < ActionController::TestCase
  setup do
    @troncon_route = troncon_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:troncon_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create troncon_route" do
    assert_difference('TronconRoute.count') do
      post :create, troncon_route: { acces: @troncon_route.acces, class_adm: @troncon_route.class_adm, etat: @troncon_route.etat, id_rte500: @troncon_route.id_rte500, longueur: @troncon_route.longueur, nb_chausse: @troncon_route.nb_chausse, nb_voies: @troncon_route.nb_voies, num_route: @troncon_route.num_route, res_europe: @troncon_route.res_europe, res_vert: @troncon_route.res_vert, sens: @troncon_route.sens, vocation: @troncon_route.vocation }
    end

    assert_redirected_to troncon_route_path(assigns(:troncon_route))
  end

  test "should show troncon_route" do
    get :show, id: @troncon_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @troncon_route
    assert_response :success
  end

  test "should update troncon_route" do
    patch :update, id: @troncon_route, troncon_route: { acces: @troncon_route.acces, class_adm: @troncon_route.class_adm, etat: @troncon_route.etat, id_rte500: @troncon_route.id_rte500, longueur: @troncon_route.longueur, nb_chausse: @troncon_route.nb_chausse, nb_voies: @troncon_route.nb_voies, num_route: @troncon_route.num_route, res_europe: @troncon_route.res_europe, res_vert: @troncon_route.res_vert, sens: @troncon_route.sens, vocation: @troncon_route.vocation }
    assert_redirected_to troncon_route_path(assigns(:troncon_route))
  end

  test "should destroy troncon_route" do
    assert_difference('TronconRoute.count', -1) do
      delete :destroy, id: @troncon_route
    end

    assert_redirected_to troncon_routes_path
  end
end
