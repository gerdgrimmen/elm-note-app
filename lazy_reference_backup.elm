-- working 0.2.0 example
module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text, input)
import Html.Events exposing (onClick)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)

-- MAIN
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model = {content : String, tagslist : List String}

init : Model
init =
  {content = "", tagslist = ["foo", "bar"]}

-- UPDATE
type Msg
  = Change String
  | PutTag

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      {model | content = newContent}
    PutTag ->
        {model | tagslist =  List.append model.tagslist [model.content] 
        , content = ""
        }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text (String.join ", " model.tagslist) ]
    , button [ onClick PutTag] [text "add tag"]
    ]
