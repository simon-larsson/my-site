module Page.NotFound exposing (view)

import Html exposing (Html, main_, h1, div, img, text)
import Html.Attributes exposing (class, tabindex, id, src, alt)


-- VIEW --


view : Html msg
view =
    main_ [ tabindex -1 ]
        [ div [ class "not-found-title" ] [ text """{ code: 404, error: "page not found" }""" ]
        ]
