module Test.Generated.Main exposing (main)

import CounterTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 68519415089171
        , processes = 8
        , globs =
            []
        , paths =
            [ "/Users/harisrafique/Desktop/elm-user/tests/CounterTests.elm"
            ]
        }
        [ ( "CounterTests"
          , [ Test.Runner.Node.check CounterTests.mainWithEvent
            , Test.Runner.Node.check CounterTests.tests
            ]
          )
        ]