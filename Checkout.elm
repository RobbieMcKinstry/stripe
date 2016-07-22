module Stripe exposing (checkout, Model)

import Html exposing (Attribute, form, Html, node)
import Html.Attributes exposing ( attribute, src, id, class, async)


-- View

type alias Model = 
    {
        key:            String
    ,   amount:         String
    ,   name:           String
    ,   description:    String
    ,   imageUrl:       String
}

script : List (Attribute msg) -> List (Html msg) -> Html msg
script attributes children =
    node "script" attributes children

checkout: Model -> Html a
checkout model = 
    form [ id "stripe-form"]
        [
            script [
                async True
            ,   src "https://checkout.stripe.com/checkout.js" 
            ,   class "stripe-button"
            ,   attribute "data-key"            model.key
            ,   attribute "data-amount"         model.amount
            ,   attribute "data-name"           model.name
            ,   attribute "data-description"    model.description
            ,   attribute "data-image"          model.imageUrl
            ,   attribute "data-locale" "auto"
            ]
            []
        ]

