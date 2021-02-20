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
    ContributionID      int `gorm:"primary_key"`
    UserID int
    GardenID int
    PlotID int
    PlantID int
    Date time.Time
}

type User struct {
    UserID      int `gorm:"primary_key"`
    FirstName string
    LastName string
    Email   string
    PhotoURI   string
}

var db *gorm.DB
var errDB error

// Functions of type `txnFunc` are passed as arguments to the
// `ExecuteTx` wrapper that handles transaction retries
type txnFunc func(*gorm.DB) error

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

    // Insert data rows into the "garden" table.
    db.Create(&Garden{GardenID: 1, Location: "4300 Allen School Lane, San Diego", Name:"Allen School Garden"})
    db.Create(&Garden{GardenID: 2, Location: "30 Murray St, San Diego", Name:"Hilltop Drive"})
    db.Create(&Garden{GardenID: 3, Location: "845 Broadway, San Diego", Name:"Intergenerational Community Garden"})
    db.Create(&Garden{GardenID: 4, Location: "960 Fifth Ave, San Diego", Name:"Mosaic Community Garden of Chula Vista"})
    db.Create(&Garden{GardenID: 5, Location: "171 Palomar St, San Diego", Name:"Palomar Apartments Community Garden"})
    GetAllGardens()

    db.Create(&Plot{PlotID: 1, GardenID: 1, Name: "E1"})
    db.Create(&Plot{PlotID: 2, GardenID: 1, Name: "E2"})
    db.Create(&Plot{PlotID: 3, GardenID: 1, Name: "F1"})
    db.Create(&Plot{PlotID: 4, GardenID: 2, Name: "E1"})
    db.Create(&Plot{PlotID: 5, GardenID: 2, Name: "F1"})


    // The amount to be transferred between the accounts.
    // var amount = 100

    // Transfer funds between accounts.  To handle potential
    // transaction retry errors, we wrap the call to `transferFunds`
    // in `crdbgorm.ExecuteTx`, a helper function for GORM which
    // implements a retry loop
    // if err := crdbgorm.ExecuteTx(context.Background(), db, nil,
    //     func(tx *gorm.DB) error {
    //         return transferFunds(tx, fromID, toID, amount)
    //     },
    // ); err != nil {
    //     // For information and reference documentation, see:
    //     //   https://www.cockroachlabs.com/docs/stable/error-handling-and-troubleshooting.html
    //     fmt.Println(err)
    // }

    // Print balances after transfer to ensure that it worked.
    // GetAllGardens(db)

    // Delete accounts so we can start fresh when we want to run this
    // program again.
    // deleteAccounts(db)
}

// func transferFunds(db *gorm.DB, fromID int, toID int, amount int) error {
//     var fromAccount Account
//     var toAccount Account

//     db.First(&fromAccount, fromID)
//     db.First(&toAccount, toID)

//     if fromAccount.Balance < amount {
//         return fmt.Errorf("account %d balance %d is lower than transfer amount %d", fromAccount.ID, fromAccount.Balance, amount)
//     }

//     fromAccount.Balance -= amount
//     toAccount.Balance += amount

//     if err := db.Save(&fromAccount).Error; err != nil {
//         return err
//     }
//     if err := db.Save(&toAccount).Error; err != nil {
//         return err
//     }
//     return nil
// }

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

// func deleteAccounts(db *gorm.DB) error {
//     // Used to tear down the accounts table so we can re-run this
//     // program.
//     err := db.Exec("DELETE from accounts where ID > 0").Error
//     if err != nil {
//         return err
//     }
//     return nil
// }