module Page.About exposing (view, update, Model, Msg, init)

import Html exposing (..)
import Html.Attributes exposing (..)
import Assets.Assets as Assets exposing (myPhotoUrl)


---- MODEL ----


type alias Model =
    { pageTitle : String
    }


init : Model
init =
    Model "About"



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
    div [ class "page-body-container" ]
        [ div [ class "about-container" ]
            [ div [ class "about-left-curly about-hide-when-small" ] [ text "{" ]
            , div [ class "about-content" ]
                [ div [ class "about-page-item" ]
                    [ div [ class "about-content-left-curly" ] [ text "{" ]
                    , div [ class "picture-content" ]
                        [ div [] [ div [ class "picture-title" ] [ text """"picture":""" ], img [ class "my-picture", src Assets.myPhotoUrl ] [] ] ]
                    , div [ class "about-content-right-curly" ] [ text "}", div [ class "comma about-hide-when-small" ] [ text "," ] ]
                    ]
                , div [ class "about-page-item" ]
                    [ div [ class "short-info" ]
                        [ div [ class "short-left-curly" ] [ text "{" ]
                        , div [ class "short-content" ] [ div [] ((div [ class "short-title" ] [ text """"stats":""" ]) :: List.map displaySingleStat shortStats) ]
                        , div [ class "short-right-curly" ] [ text "}", div [ class "comma about-hide-when-small" ] [ text "," ] ]
                        ]
                    ]
                , div [ class "about-page-item" ]
                    [ div [ class "about-content-left-curly" ] [ text "{" ]
                    , div [ class "summary-content" ]
                        [ div [] ((div [ class "summary-title" ] [ text """"about":""" ]) :: List.map displaySingleAboutParagraph aboutParagraphs) ]
                    , div [ class "about-content-right-curly" ] [ text "}" ]
                    ]
                ]
            , div [ class "about-right-curly about-hide-when-small" ] [ text "}" ]
            ]
        ]


displaySingleStat : String -> Html Msg
displaySingleStat stat =
    div [] [ text stat ]


shortStats : List String
shortStats =
    [ """"name": "Simon Larsson","""
    , """"born": 1989,"""
    , """"occupation": "Developer","""
    , """"country": "Sweden","""
    , """"city": "Stockholm" """
    ]


displaySingleAboutParagraph : String -> Html Msg
displaySingleAboutParagraph paragraph =
    div [] [ text paragraph ]


aboutParagraphs : List String
aboutParagraphs =
    [ """"I am a web developer who loves to dive into new technology and to constantly evolve. Most recently I have become interested in functional programming which I utilized in building this site. I also do machine learning as a hobby and I find deep learning particularly fascinating. """
    , """My days usually start early with a visit to the gym, which I find to be the best way to get zen during the workday. In my spare time I try to eat fancy foods from all around the world, preferably in places all around the world."

    """
    ]
