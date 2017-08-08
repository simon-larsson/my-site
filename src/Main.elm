module Main exposing (..)

import Html exposing (..)
import Navigation exposing (Location)
import Json.Decode as Decode exposing (Value)
import Page.Error as Error exposing (PageLoadError)
import Page.NotFound as NotFound
import Page.Home as Home
import Page.About as About
import Page.Resume as Resume
import View.Page as Page exposing (ActivePage)
import Route exposing (..)
import Util exposing ((=>))


---- MODEL ----


type alias Model =
    { page : Page
    }


type Page
    = Blank
    | NotFound
    | Error PageLoadError
    | Home Home.Model
    | About About.Model
    | Resume Resume.Model



---- UPDATE ----


type Msg
    = SetRoute (Maybe Route)
    | HomeMsg Home.Msg
    | AboutMsg About.Msg
    | ResumeMsg Resume.Msg


setRoute : Maybe Route -> Model -> ( Model, Cmd Msg )
setRoute route model =
    case route of
        Nothing ->
            ( { model | page = NotFound }, Cmd.none )

        Just Route.Home ->
            ( { model | page = Home Home.init }, Cmd.none )

        Just Route.About ->
            ( { model | page = About About.init }, Cmd.none )

        Just Route.Resume ->
            ( { model | page = Resume Resume.init }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    updatePage model.page msg model


updatePage : Page -> Msg -> Model -> ( Model, Cmd Msg )
updatePage page msg model =
    let
        toPage toModel toMsg subUpdate subMsg subModel =
            let
                ( newModel, newCmd ) =
                    subUpdate subMsg subModel
            in
                ( { model | page = (toModel newModel) }, Cmd.map toMsg newCmd )
    in
        case ( msg, page ) of
            -- Update for page transitions
            ( SetRoute route, _ ) ->
                setRoute route model

            -- Update for page specfic msgs
            ( HomeMsg subMsg, Home subModel ) ->
                toPage Home HomeMsg (Home.update) subMsg subModel

            ( AboutMsg subMsg, About subModel ) ->
                toPage About AboutMsg (About.update) subMsg subModel

            ( ResumeMsg subMsg, Resume subModel ) ->
                toPage Resume ResumeMsg (Resume.update) subMsg subModel

            ( _, NotFound ) ->
                -- Disregard incoming messages when we're on the
                -- NotFound page.
                model => Cmd.none

            ( _, _ ) ->
                -- Disregard incoming messages that arrived for the wrong page
                model => Cmd.none



---- VIEW ----


view : Model -> Html Msg
view model =
    let
        layout =
            Page.layout
    in
        case model.page of
            NotFound ->
                layout Page.Other NotFound.view

            Blank ->
                -- This is for the very intial page load, while we are loading
                -- data via HTTP. We could also render a spinner here.
                Html.text ""
                    |> layout Page.Other

            Error subModel ->
                Error.view subModel
                    |> layout Page.Other

            Home subModel ->
                Home.view subModel
                    |> layout Page.Home
                    |> Html.map HomeMsg

            About subModel ->
                About.view subModel
                    |> layout Page.About
                    |> Html.map AboutMsg

            Resume subModel ->
                Resume.view subModel
                    |> layout Page.Resume
                    |> Html.map ResumeMsg



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



---- PROGRAM ----


initialPage : Page
initialPage =
    Blank


init : Value -> Location -> ( Model, Cmd Msg )
init val location =
    setRoute (Route.fromLocation location)
        { page = initialPage
        }


main : Program Value Model Msg
main =
    Navigation.programWithFlags (Route.fromLocation >> SetRoute)
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
