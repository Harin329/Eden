package plot

import (
    // "fmt"
	"net/http"
	"strconv"
	"encoding/json"

	"github.com/gorilla/mux"
    "sdhacks-backend/src/database"
)

type Plot struct {
    GardenID      int `json:"GardenID"`
	Name		string `json:"Name"`
    Location 	string `json:"Location"`
}

func Get(w http.ResponseWriter, r *http.Request) {
	response, err := json.Marshal(database.GetAllGardens())
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(response))
}

func Params(w http.ResponseWriter, r *http.Request) {
    pathParams := mux.Vars(r)
    w.Header().Set("Content-Type", "application/json")

    gardenID := -1
    var err error
    if val, ok := pathParams["gardenID"]; ok {
        gardenID, err = strconv.Atoi(val)
        if err != nil {
            w.WriteHeader(http.StatusInternalServerError)
            w.Write([]byte(`{"message": "need a garden id"}`))
            return
        }

		response, err := json.Marshal(database.GetPlotsByGarden(gardenID))
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
