package plant

import (
    // "fmt"
	"net/http"
	"strconv"
	"encoding/json"

	"github.com/gorilla/mux"
    "sdhacks-backend/src/database"
)

type Plant struct {
    PlantID      int `json:"PlantID"`
    GardenID    int `json:"GardenID"`
    PlotID      int `json:"PlotID"`
    PlantType string `json:"PlantType"`
    PlantName string `json:"PlantName"`
    Instruction string `json:"Instruction"`
}

func Params(w http.ResponseWriter, r *http.Request) {
    pathParams := mux.Vars(r)
    w.Header().Set("Content-Type", "application/json")

    plotID := -1
    var err error
    if val, ok := pathParams["plotID"]; ok {
        plotID, err = strconv.Atoi(val)
        if err != nil {
            w.WriteHeader(http.StatusInternalServerError)
            w.Write([]byte(`{"message": "need a plot id"}`))
            return
        }

		response, err := json.Marshal(database.GetPlantsByPlot(plotID))
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			w.Write([]byte(err.Error()))
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		w.Write([]byte(response))
    }
}
