<style>
    body {
        background-color: white;
        margin: 0px;
        padding: 0px;
    }

    #mainOne {
        min-height: 65vh;
        background-color: white;
    }

    #headerOne, #divLogo, #navUl {
        background-color: white;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: space-between;
        align-items: center;
        max-height: 42px;
    }

    #headlineLogo {
        font-family: 'Abril Fatface', cursive;
        font-size: 25px;
        color: #8aff75;
        margin-left: 25px;
    }

    #paragLogo {
        font-family: 'Pattaya', sans-serif;
        font-size: 18px;
        color: #4f4d4b;
        margin-left: 18px;
    }

    #ulNav {
        margin-right: 25px;
    }

    .liNav {
        display: inline;
    }

    .aNav {
        color: #4f4d4b;
        text-decoration: none;
        font-family: 'Hind Siliguri', sans-serif;
        font-size: 13px;
        font-weight: bold;
        margin-left: 18px;
    }

    .aNav:hover {
        color: #ff758a;
    }

    #footerOne {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        margin-top: 50px;
        margin-bottom: 10px;
        background-color: white;
        text-align: left;
        font-weight: bold;
        font-size: 11px;
        font-family: 'Hind Siliguri', sans-serif;
        color: #4f4d4b;
    }

    #spanFooter {
        font-family: 'Abril Fatface', cursive;
        color: #8aff75;
        font-size: 12px;
    }

    #portfolioLink {
        font-size: 11px;
        text-decoration: none;
        font-family: 'Hind Siliguri', sans-serif;
        color: #4f4d4b;
    }

    #portfolioLink:hover {
        color: #ff758a;
    }

    #divPersonalInfo, #divDailyRequirement, #divQuestion, #divFoodSelection, #divNutritionTracker {
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
        background-color: #f7f5f3;
        color: #4f4d4b;
        text-align: center;
        font-family: 'Hind Siliguri', sans-serif;
        font-size: 12px;
        border-radius: 50px;
        width: 300px;
        margin-top: 50px;
        padding: 25px 50px 25px 50px;
        margin-left: auto;
        margin-right: auto;
    }

    #divQuestion, #container, #divFoodSelection, #divNutritionTracker {
        display: none;
    }

    #container {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        margin-bottom: 25px;

    }

    #divFoodSelection {
        width: 80%;
    }

    #formLogIn, #formPersonalInfo, #formDailyFood, #formMyPlate {
        margin-left: auto;
        margin-right: auto;
        font-weight: bold;
        font-family: 'Hind Siliguri', sans-serif;
        font-size: 12px;
    }

    #formMyPlate {
        margin-top: 20px;
    }

    .inputs, .inputsDF, .inputsMyPlate {
        margin: 8px;
        color: #4f4d4b;
        text-align: center;
        font-family: 'Hind Siliguri', sans-serif;
        font-size: 10px;
        padding: 2px;
        width: 175px;
        border: none;
        border-radius: 5px;
    }

    .inputsDF {
        margin: 15px;
    }

    .inputsMyPlate {
        width: 50px;
        margin: 0px;
    }

    #selectPregnantLactating, #pregnantLactating {
        display: none;
    }

    .btns {
        background-color: #ff758a;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
        color: white;
        font-family: 'Hind Siliguri', sans-serif;
        font-size: 13px;
        font-weight: bold;
        margin-top: 22px;
        padding: 3px 15px 3px 15px;
        border: none;
        border-radius: 15px;
    }

    .btns:hover {
        background-color: #e06374;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.5);
    }

    #btnTracking {
        margin-top: 5px;
    }

    #btnCheckMyDay, #btnNext, #btnAddMore {
        margin-bottom: 15px;
    }

    #messageFillIn2, #messageFillIn3 {
        font-style: italic;
    }

    #tableDailyRequirement, #tableMyPlate, #tableNutritionTracker, #tablePersonalInfo {
        width: 95%;
        margin-right: auto;
        margin-left: auto;
        text-align: left;
    }

    #tableMyPlate {
        width: 40%;
        table-layout: fixed;
        display: none;
        padding-top: 0px;
        padding-bottom: 0px;
    }

    #tableNutritionTracker {
        width: 75%;
        border-collapse: separate;
        border-spacing: 0px 10px;
    }

    .tableHeaders, .tableHeadersNT {
        font-size: 12px;
        font-weight: bold;
        text-align: left;
        padding: 10px 0px 10px 0px;
    }

    .tableHeaders {
        text-align: center;
        column-span: 2;
    }

    #tableHeaderArticals {
        width: 60%;
    }

    #tableHeaderQuantity {
        width: 10%;
    }

    #tableHeaderDelete {
        width: 20%;
    }

    .btnDelete {
        background-color: transparent;
        border: none;
        color: #4f4d4b;
        font-weight: bold;
        font-family: 'Hind Siliguri', sans-serif;
        font-size: 12px;
    }

    .btnDelete:hover {
        color: #ff758a;
    }

    .cellPI {
        text-align: right;
        width: 15%;
    }

    .cellWidth {
        width: 55%;
        padding: 0px;
    }


    .cellsProgressBar {
        background-color: white;
        padding: 0px;
        position: relative;
    }

    .divProgressBar {
        background-color: white;
        color: #4f4d4b;
        font-weight: bold;
        text-align: center;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        width: 0%;
    }

    .pinkHeadline {
        color: #ff758a;
    }

    @media only screen and (max-width: 600px) {
        body {
            background-color: white;
        }

        #headlineLogo {
            font-size: 18px;
            margin-left: 15px;
        }

        #paragLogo {
            display: none;
        }

        #ulNav {
            margin-right: 10px;
        }

        .aNav {
            font-size: 10px;
            margin-left: 8px;
        }

        #divPersonalInfo, #divDailyRequirement, #divQuestion, #divFoodSelection, #divNutritionTracker {
            width: 85%;
            padding: 20px;
        }

        #formLogIn, #formPersonalInfo, #formDailyFood, #formMyPlate {
            font-size: 11px;
        }

        #tableDailyRequirement, #tableMyPlate, #tableNutritionTracker, #tablePersonalInfo {
            width: 100%;
        }

        .inputs {
            font-size: 10px;
            width: 165px;
        }

        .inputsDF {
            width: 140px;
        }

        .inputsMyPlate {
            width: 40px;
        }

        #footerOne {
            font-size: 9px;
            flex-direction: column;
        }

        #portfolioLink: {
        font-size: 9px;
    }

        #container {
            flex-direction: column;
        }

        .minSpan {
            display: block;
            text-align: right;
            margin-right: 20px;
        }

    }
</style>