module Page.Home exposing (view, update, Model, Msg, init)

import Html exposing (..)
import Html.Attributes exposing (..)
import Assets.Assets as Assets


---- MODEL ----


type alias Model =
    { pageTitle : String
    }


init : Model
init =
    Model "Home"



-- UPDATE --


type Msg
    = Todo


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Todo ->
            ( model, Cmd.none )



-- VIEW --


view : Model -> Html Msg
view model =
    div [ class "logo-container" ]
        [ img [ class "home-logo", src Assets.homeLogoUrl ] []
        ]
