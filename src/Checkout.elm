module Checkout exposing (checkout, Model)

{-| Wrapper for the Stripe Checkout embedded form. See [this link](https://stripe.com/docs/checkout/tutorial) for the official documentation

# Data
@docs Model 
Model is A simple structural type that contains all of the information passed as data-attributes to Stripe checkout script.
        
@docs checkout 
checkout is the function that, taking a model, returns the HTML configured with that model. It will be the "Pay with Card" button from the above linked tutorial.

-}

import Html exposing (Attribute, form, Html, node)
import Html.Attributes exposing ( attribute, src, id, class, async)


-- View

{-|

@docs Model is A simple structural type that contains all of the information passed as data-attributes to Stripe checkout script.
 
-}
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

{-|
@docs checkout 
checkout is the function that, taking a model, returns the HTML configured with that model. It will be the "Pay with Card" button from the above linked tutorial.
-}
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

