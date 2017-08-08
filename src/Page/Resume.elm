module Page.Resume exposing (view, update, Model, Msg, init)

import Html exposing (..)
import Html.Attributes exposing (..)
import Assets.Assets as Assets exposing (myPhotoUrl)


---- MODEL ----


type alias Model =
    { pageTitle : String
    , pageBody : String
    }


init : Model
init =
    Model "" ""



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
        [ div [ class "resume-content" ]
            [ div [ class "resume-page-item" ]
                [ div [ class "tech-left-curly" ] [ text "{" ]
                , div [ class "tech-content" ]
                    [ div []
                        [ div [ class "tech-title" ] [ text """"techStack":""" ]
                        , div [ class "tech-item" ] (List.map displayTextRow techStack)
                        ]
                    ]
                , div [ class "tech-right-curly" ] [ text "}" ]
                ]
            , div [ class "resume-page-item" ]
                [ div [ class "tech-left-curly" ] [ text "{" ]
                , div [ class "tech-content" ]
                    [ div []
                        [ div [ class "tech-title" ] [ text """"education":""" ]
                        , div [ class "education-item" ] (List.map displayTextRow education)
                        ]
                    ]
                , div [ class "tech-right-curly" ] [ text "}" ]
                ]
            ]
        ]


displayTextRow : String -> Html Msg
displayTextRow row =
    div [] [ text row ]


techStack : List String
techStack =
    [ """"languages": ["C#", "Elm", "Javascript", "Python", "Java"],"""
    , """"platforms": [".NET", "Microsoft Azure"],"""
    , """"databases": ["SQL Server"],"""
    , """"versionControl": ["Git", "TFS"],"""
    , """"operatingSystems": ["Windows", "Linux"]"""
    ]


education : List String
education =
    [ """"university": "Lund University","""
    , """"faculty": "Faculty of Engineering, LTH","""
    , """"program": "Msc. Electrical Engineering","""
    , """"duration": "2009 - 2014" """
    ]
