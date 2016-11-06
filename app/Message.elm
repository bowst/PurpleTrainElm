module Message exposing (..)

import Http
import StopPicker.Update as StopPicker
import Types exposing (..)

type Msg
    = StopPickerMsg StopPicker.Msg
    | PickStop RouteStop
    | LoadRoutes (Result Http.Error Routes)
