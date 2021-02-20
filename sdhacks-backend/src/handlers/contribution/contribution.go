package contribution

import (
    // "fmt"
	"net/http"
	"strconv"
	"encoding/json"
	// "bytes"

	"github.com/gorilla/mux"
    "sdhacks-backend/src/database"
)

func Post(w http.ResponseWriter, r *http.Request) {
	contribution := database.Contribution{}

	decoder := json.NewDecoder(r.Body)
	if err := decoder.Decode(&contribution); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(`{"message": "bad request"}`))
		return
	}
	defer r.Body.Close()

	response, err := json.Marshal(database.CreateContribution(&contribution))
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

    userID := -1
    var err error
    if val, ok := pathParams["userID"]; ok {
        userID, err = strconv.Atoi(val)
        if err != nil {
            w.WriteHeader(http.StatusInternalServerError)
            w.Write([]byte(`{"message": "need a user id"}`))
            return
        }

		response, err := json.Marshal(database.GetContributionsByUser(userID))
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
