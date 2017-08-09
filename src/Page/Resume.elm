module Page.Resume exposing (view, update, Model, Msg, init)

import Html exposing (..)
import Html.Attributes exposing (..)


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
            , div [ class "page-break" ] [ text "" ]
            , div [ class "resume-page-project" ]
                [ div [ class "tech-left-curly" ] [ text "{" ]
                , div [ class "tech-content" ]
                    [ div []
                        [ div [ class "tech-title" ] [ text """"sampleProject":""" ]
                        , div [ class "project-item" ] buyoutProject
                        ]
                    ]
                , div [ class "tech-right-curly" ] [ text "}" ]
                ]
            , div [ class "resume-page-project" ]
                [ div [ class "tech-left-curly" ] [ text "{" ]
                , div [ class "tech-content" ]
                    [ div []
                        [ div [ class "tech-title" ] [ text """"sampleProject":""" ]
                        , div [ class "project-item" ] timeReportProject
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
    [ """"languages": ["C#", "Elm", "JavaScript", "Python", "Java"],"""
    , """"platforms": [".NET", "Microsoft Azure"],"""
    , """"databases": ["SQL Server"],"""
    , """"versionControl": ["Git", "TFS", "SVN"],"""
    , """"operatingSystems": ["Windows", "Linux"]"""
    ]


education : List String
education =
    [ """"university": "Lund University","""
    , """"faculty": "Faculty of Engineering, LTH","""
    , """"program": "Msc. Electrical Engineering","""
    , """"duration": "2009 - 2014" """
    ]


buyoutProject : List (Html Msg)
buyoutProject =
    [ div [] [ text """"application": "Buyout application for loans and leases",""" ]
    , div [] [ text """"technology": ["Elm", "Scala", "Git"],""" ]
    , div [ class "description-container" ]
        [ div [ class "description-title" ] [ text """"description":""" ]
        , div [ class "description-content-buyout" ] [ text """"Loan and leasing application for a large nordic bank. Replaces the previous COBOL module that handled buyouts of loans and leases. The solution utilizes functional programming in both frontend and backend. Elm powers the frontend by replacing both JavaScript and generating the HTML. A minimal Scala backend is used as a communication layer for the larger COBOL backend." """ ]
        ]
    , div [] [ text """ """ ]
    , div [] [ text """ """ ]
    , div [] [ text """ """ ]
    ]


timeReportProject : List (Html Msg)
timeReportProject =
    [ div [] [ text """"application": "Time reporting system",""" ]
    , div [] [ text """"technology": ["C#", ".NET", "JavaScript", "SQL Server", "Azure", "TFS"],""" ]
    , div [] [ text """"websiteUrl": """, a [ href "https://ventkraft.azurewebsites.net" ] [ text """https://ventkraft.azurewebsites.net""" ], text "," ]
    , div [ class "description-container" ]
        [ div [ class "description-title" ] [ text """"description":""" ]
        , div [ class "description-content-time" ] [ text """"Cloud based time reporting application made to work equally well for mobile and PC. Features include statistics and reporting tools and an admin system for management of users, roles, customers and projects." """ ]
        ]
    , div [] [ text """ """ ]
    , div [] [ text """ """ ]
    , div [] [ text """ """ ]
    ]
