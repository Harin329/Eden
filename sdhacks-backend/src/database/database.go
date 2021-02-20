package database

import (
    // "context"
    "fmt"
    "log"
    "time"
    "os"

    // Import GORM-related packages.
    // "github.com/cockroachdb/cockroach-go/crdb/crdbgorm"
    "github.com/jinzhu/gorm"
    _ "github.com/jinzhu/gorm/dialects/postgres"
    "github.com/joho/godotenv"
)

// X is our model, which corresponds to the "X" database table.
type Garden struct {
    GardenID      int `gorm:"primary_key"`
    Name string
    Location string
    Latitude float64
    Longitude float64
}

type Plot struct {
    PlotID      int `gorm:"primary_key"`
    Name        string
    GardenID    int
}

type PlotImages struct {
    PlotImageID      int `gorm:"primary_key"`
    PlotID int
    Date    time.Time
}

type Plant struct {
    PlantID      int `gorm:"primary_key"`
    GardenID    int
    PlotID      int
    PlantType string
    PlantName string
    Instruction string
}

type PlantHistory struct {
    PlantHistoryID      int `gorm:"primary_key"`
    PlantID int
    History string
}

type PlantImages struct {
    PlantImageID      int `gorm:"primary_key"`
    PlantID int
    Date    time.Time
}

type Contribution struct {
    ContributionID      int `gorm:"primary_key";"AUTO_INCREMENT"`
    UserID int
    GardenID int
    PlotID int
    PlantID int
    Date time.Time
    ContributionType string
}

type User struct {
    UserID      int `gorm:"primary_key"`
    FirstName string
    LastName string
    Email   string
}

var db *gorm.DB
var errDB error


func Start() {
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error loading .env file")
    }

    addr := os.Getenv("DBURL")
    db, errDB = gorm.Open("postgres", addr)
    if errDB != nil {
        log.Fatal(errDB)
    }
    // defer db.Close()

    // Set to `true` and GORM will print out all DB queries.
    db.LogMode(false)

    // Automatically create the tables based on the models.
    db.AutoMigrate(&Garden{})
    db.AutoMigrate(&Plot{})
    db.AutoMigrate(&Plant{})
    db.AutoMigrate(&User{})
    db.AutoMigrate(&Contribution{})

    // Insert data rows into the "garden" table.
    db.Create(&Garden{GardenID: 1, Location: "4300 Allen School Lane, San Diego", Name:"Allen School Garden", Latitude: 32.656000, Longitude:-117.033400})
    db.Create(&Garden{GardenID: 2, Location: "30 Murray St, San Diego", Name:"Hilltop Drive", Latitude: 32.631480, Longitude:-117.063630})
    db.Create(&Garden{GardenID: 3, Location: "845 Broadway, San Diego", Name:"Intergenerational Community Garden", Latitude: 32.715550, Longitude:-117.156830})
    db.Create(&Garden{GardenID: 4, Location: "960 Fifth Ave, San Diego", Name:"Mosaic Community Garden of Chula Vista", Latitude: 32.715430, Longitude:-117.160460})
    db.Create(&Garden{GardenID: 5, Location: "171 Palomar St, San Diego", Name:"Palomar Apartments Community Garden", Latitude: 32.608700, Longitude:-117.060360})
    GetAllGardens()

    db.Create(&Plot{PlotID: 1, GardenID: 1, Name: "E1"})
    db.Create(&Plot{PlotID: 2, GardenID: 1, Name: "E2"})
    db.Create(&Plot{PlotID: 3, GardenID: 1, Name: "F1"})
    db.Create(&Plot{PlotID: 4, GardenID: 2, Name: "E1"})
    db.Create(&Plot{PlotID: 5, GardenID: 2, Name: "F1"})

    db.Create(&Plant{PlantID: 1, GardenID: 1, PlotID: 1, PlantType: "Grape Plant", PlantName: "Grapey", Instruction: "Water Them Freely"})
    db.Create(&Plant{PlantID: 2, GardenID: 1, PlotID: 1, PlantType: "Tomato Plant", PlantName: "Tom", Instruction: "Pick the fresh tomatoes!"})
    db.Create(&Plant{PlantID: 3, GardenID: 1, PlotID: 1, PlantType: "Basil Plant", PlantName: "Neymar", Instruction: "Needs phosphate fertilization (2 cups)"})
    db.Create(&Plant{PlantID: 4, GardenID: 1, PlotID: 3, PlantType: "Roses", PlantName: "Love", Instruction: "Prune them 5cm at the root"})
    db.Create(&Plant{PlantID: 5, GardenID: 1, PlotID: 3, PlantType: "Palm Tree", PlantName: "Big Boi", Instruction: "Bacteria infection, requires care from professionals"})

    db.Create(&User{UserID: 1, FirstName: "Harin", LastName: "Wu", Email: "harinwu99@gmail.com"})

    // Don't Create Too Many
    // db.Create(&Contribution{UserID: 1, GardenID: 1, PlotID: 1, PlantID: 1, Date: time.Now(), ContributionType: "Water"})
    // db.Create(&Contribution{UserID: 1, GardenID: 1, PlotID: 1, PlantID: 1, Date: time.Now(), ContributionType: "Fertilize"})

}

func GetAllGardens() []Garden {
    var gardens []Garden
    db.Find(&gardens)
    fmt.Printf("Garden at '%s':\n", time.Now())
    for _, garden := range gardens {
        fmt.Printf("%d %d\n", garden.GardenID, garden.Location)
    }
    return gardens
}

func GetPlotsByGarden(gardenID int) []Plot {
    var plots []Plot
    db.Where("garden_id = ?", gardenID).Find(&plots)
    return plots
}

func GetPlantsByPlot(plotID int) []Plant {
    var plants []Plant
    db.Where("plot_id = ?", plotID).Find(&plants)
    return plants
}

func CreateContribution(contribution *Contribution) int64 {
    // contribution := Contribution{UserID: userID, GardenID: gardenID, PlotID: plotID, PlantID: plantID, Date: time.Now(), ContributionType: contributionType}

    result := db.Create(&contribution) // pass pointer of data to Create

    return result.RowsAffected   
}

func GetContributionsByUser(userID int) []Contribution {
    var contributions []Contribution
    db.Where("user_id = ?", userID).Find(&contributions)
    return contributions
}
