module CounterTests exposing (..)

import Html.Attributes exposing (class)
import Browser
import Html exposing (Html, div, h1, button, text)
import Test exposing (Test, describe, test)
import Expect exposing (equal)
import Html.Events exposing (onClick)


type Msg
    = Increment

updateWithEvent : Msg -> Int -> Int
updateWithEvent msg model =
    case msg of
        Increment ->
            model + 1

viewWithModel : Int -> Html Msg
viewWithModel model =
    Html.div [ class "container" ]
        [ Html.h1 [] [ Html.text "Hello, Elm!" ]
        , Html.button [ class "btn", onClick Increment ] [ Html.text "Click Me" ]
        ]

mainWithEvent =
    Browser.sandbox { init = 0, update = updateWithEvent, view = viewWithModel }

tests : Test
tests =
    describe "Tests"
        
        [ describe "User Interaction Tests"
            [ test "Simulate button click" <|
                \() ->
                    let
                        initialModel = 0
                        expectedModel = 1
                    in
                    Expect.equal expectedModel (updateWithEvent Increment initialModel)
            ]
        ]
