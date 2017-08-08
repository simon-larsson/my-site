module View.Page exposing (ActivePage(..), layout)

import Html exposing (..)
import Html.Attributes exposing (..)
import Route exposing (Route)
import Assets.Assets as Assets


type ActivePage
    = Other
    | Home
    | About
    | Resume


{-| Take a page's Html and layout it with a header and footer.

isLoading can be used to slow loading during slow transitions

-}
layout : ActivePage -> Html msg -> Html msg
layout page content =
    div []
        [ viewHeader page
        , div [] [ content ]
        , viewFooter
        ]


viewHeader : ActivePage -> Html msg
viewHeader page =
    nav []
        [ div [ class "nav-container" ]
            [ div [ class "nav-item" ]
                [ a [ class "nav-link", Route.href Route.Home ]
                    [ div [ class "nav-button" ] [ div [ class "nav-curly-left" ] [ text "{" ], i [ class "fa fa-home nav-icon" ] [], div [ class "nav-curly-right" ] [ text "}" ] ] ]
                ]
            , div [ class "nav-item" ]
                [ a [ class "nav-link", Route.href Route.About ]
                    [ div [ class "nav-button" ] [ div [ class "nav-curly-left" ] [ text "{" ], i [ class "fa fa-user nav-icon" ] [], div [ class "nav-curly-right" ] [ text "}" ] ] ]
                ]
            , div [ class "nav-item" ]
                [ a [ class "nav-link", Route.href Route.Resume ]
                    [ div [ class "nav-button" ] [ div [ class "nav-curly-left" ] [ text "{" ], i [ class "fa fa-id-card-o nav-icon" ] [], div [ class "nav-curly-right" ] [ text "}" ] ] ]
                ]
            ]
        ]


viewFooter : Html msg
viewFooter =
    footer []
        [ div [ class "footer-container" ]
            [ div [ class "footer-contact" ]
                [ div [] [ text """{ "contact": [""" ]
                , a [ href " mailto:larssonsimon0@gmail.com", class "nav-link " ] [ i [ class "fa fa-envelope" ] [] ]
                , div [ class "contact-separator" ] [ text "," ]
                , a [ href "https://www.linkedin.com/in/simon-larsson-7163b598/", class "nav-link " ] [ i [ class "fa fa-linkedin-square" ] [] ]
                , div [ class "contact-separator" ] [ text "," ]
                , a [ href "https://github.com/simon-larsson/", class "nav-link " ] [ i [ class "fa fa-github-alt" ] [] ]
                , div [] [ text "]" ]
                , div [ class "footer-contact-right-curly" ] [ text "}" ]
                ]
            , details [ class "footer-console" ]
                [ summary [ class "footer-console-tab" ]
                    [ div [ class "footer-console-title" ] [ text "developer console" ]
                    ]
                , div [ class "footer-console-separator-top" ] []
                , div [ class "footer-console-content" ]
                    [ div [ class "footer-console-item" ]
                        [ img [ class "elm-logo", src Assets.elmLogoUrl ] []
                        , p [] [ text """The website is written in Elm. It is an awesome, type safe, purely functional, programming language that compiles to JavaScript.""" ]
                        , p [] [ text """It makes the frontend way more fun and if you are interested in functional programming you really should check it out:""" ]
                        , a [ href "http://elm-lang.org/" ] [ text "http://elm-lang.org/" ]
                        ]
                    , div [ class "footer-console-item" ]
                        [ i [ class "fa fa-github nav-icon footer-console-icon" ] []
                        , div [ class "console-github-description" ] [ text "My Github is humble. Mostly Elm and me trying out machine learning. But check it out if you want." ]
                        , div [ class "console-label-and-link" ] [ div [ class "console-label" ] [ text "My Github: " ], a [ href "https://github.com/simon-larsson/" ] [ text "github.com/simon-larsson/" ] ]
                        , div [ class "console-label-and-link" ] [ div [ class "console-label" ] [ text "This website: " ], a [ href "https://github.com/simon-larsson/my-site" ] [ text "github.com/simon-larsson/my-site" ] ]
                        , div [ class "console-label-and-link" ] [ div [ class "console-label" ] [ text "My Elm spa template: " ], a [ href "https://github.com/simon-larsson/elm-spa-template" ] [ text "github.com/simon-larsson/elm-spa-template" ] ]
                        ]
                    ]
                ]
            , div [ class "footer-console-separator-bottom" ] []
            ]
        ]
