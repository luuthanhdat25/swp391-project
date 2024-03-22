<%@ include file="../common/header.jspf" %>
<%@ include file="../common/sidebar.jspf" %>
<%@ include file="../common/head.jspf" %>
<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="card">
                <div class="row" style="justify-content: space-evenly;">
                    <div class="col-12 col-lg-12" style="width: 94%" id="divPersonalInfo">
                        <h2 id="personalGreeting" style="font-size: 50px;">HI!</h2>
                        <p style="font-size: 22px;font-family: cursive;font-style: oblique;">What are your daily nutritional requirements?</p>
                        <h3>Let's find out!</h3>
                        <form id="formPersonalInfo">
                            <table id="tablePersonalInfo">
                                <tr>
                                    <td class="cellPI" style="font-size: 20px;">Age:</td>
                                    <td style="display: inline-block;"><input style="width: 322%;" class="inputs" id="inputAge" type="number" name="age" min="18"
                                               max="150"></td>
                                </tr>
                                <tr>
                                    <td class="cellPI" style="font-size: 20px;">Sex:</td>
                                    <td style="display: inline-block;">
                                        <select style="width: 344%;" class="inputs" id="selectSex" onchange="showSelect()">
                                            <option value=""></option>
                                            <option value="female">female</option>
                                            <option value="male">male</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cellPI" style="font-size: 20px;"><span id="pregnantLactating">PG/LAC:</span></td>
                                    <td style="display: inline-block;">
                                        <select style="width: 98%;" class="inputs" id="selectPregnantLactating">
                                            <option value=""></option>
                                            <option value="pregnant1">Pregnant (1st trimester)</option>
                                            <option value="pregnant2">Pregnant (2nd trimester)</option>
                                            <option value="pregnant3">Pregnant (3rd trimester)</option>
                                            <option value="lactating1">Lactating (0-6 months postpartum)</option>
                                            <option value="lactating2">Lactating (7-12 months postpartum)</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cellPI" style="font-size: 20px;width: 33%;">Height:</td>
                                    <td style="display: inline-block;"><input style="width: 322%;"  class="inputs" id="inputHeight" type="number" name="height" min="100"
                                               max="250" placeholder="cm">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cellPI" style="font-size: 20px;">Weight:</td>
                                    <td style="display: inline-block;"><input style="width: 322%;" class="inputs" id="inputWeight" type="number" name="weight" min="20"
                                               max="300" placeholder="kg">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cellPI" style="font-size: 20px;">Lifestyle:</td>
                                    <td style="display: inline-block;">
                                        <select style="width: 184%" class="inputs" id="selectLifestyle">
                                            <option value=""></option>
                                            <option value="sedentary">sedentary</option>
                                            <option value="littleActive">somewhat active</option>
                                            <option value="active">active</option>
                                            <option value="veryActive">very active</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button style="margin-top: 10px;padding: 10px 72px;" class="btn btn-primary" id="btnCalculate" type="button" onclick="calculate()">
                                Calculate
                            </button>
                            <p style="font-size: 20px" id="messageFillIn2"></p>
                        </form>
                        <div class="col-5 col-lg-5" id="divDailyRequirement" style="width: 100%;margin-top: 10px;margin-bottom: 20px">
                            <table id="tableDailyRequirement">
                                <tr>
                                    <td style="text-align: left; font-size: large">Your Daily Calories (kcal)</td>
                                    <td style="font-size: large" id="reqCalories"></td>
                                </tr>
                            </table>
                        </div>
                        <div id="div-message-success" style="display: none;font-size: 18px;font-weight: 700;" class="col-12 alert alert-success alert-dismissible fade show" role="alert">
                            <h4 id="indiet-message"></h4>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <div id="div-message-failed" style="display: none;font-size: 18px;font-weight: 700;" class="col-12 alert alert-danger alert-dismissible fade show" role="alert">
                            <h4 id="diet-message"></h4>

                        </div>
                    </div>

                    <div class="col-5 col-lg-4" style="margin-bottom: 40px" id="divFoodSelection">
                        <h2>FOOD LOG TRACKING TODAY</h2>
                        <table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
                            <thead class="student-thread">
                            <tr>
                                <th>Name</th>
                                <th>Calories</th>
                                <th>Carb</th>
                                <th>Fat</th>
                                <th>Protein</th>
                                <th>Amount(g)</th>
                            </tr>
                            </thead>
                            <tbody id="foodLogBody">
                            <c:forEach var="nutrition" items="${slotTrackingDtos}">
                                <tr>
                                    <td>
                                        <h2>
                                            <a>${nutrition.nutritionName}</a>
                                        </h2>
                                    </td>
                                    <td>${nutrition.calories}</td>
                                    <td>${nutrition.carb}</td>
                                    <td>${nutrition.fat}</td>
                                    <td>${nutrition.protein}</td>
                                    <td>${nutrition.amount}</td>
<%--                                    <td class="text-end">--%>
<%--                                        <div class="actions">--%>
<%--                                            <a href="javascript:;" class="btn btn-sm bg-success-light me-2">--%>
<%--                                                <i class="feather-delete"></i>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div style="margin-top: 15px;" id="totalCalories"></div>
                    </div>

                    <script>
                        // Wait for the document to be fully loaded
                        document.addEventListener('DOMContentLoaded', function () {
                            // Get the tbody element where the nutrition items are listed
                            const foodLogBody = document.getElementById('foodLogBody');

                            // Initialize total calories variable
                            let totalCalories = 0;

                            // Loop through each row in the table body
                            foodLogBody.querySelectorAll('tr').forEach(function (row) {
                                // Get the calories value from the current row
                                const calories = parseFloat(row.querySelector('td:nth-child(2)').textContent.trim());

                                // Add the calories to the total
                                totalCalories += calories;
                            });

                            // Display the total calories
                            const totalCaloriesElement = document.createElement('h4');
                            // Check if the total calories is a whole number
                            if (totalCalories % 1 === 0) {
                                totalCaloriesElement.textContent = 'Total Calories: ' + totalCalories + ' (kcalo)';
                            } else {
                                totalCaloriesElement.textContent = 'Total Calories: ' + totalCalories.toFixed(2) + ' (kcalo)';
                            }
                            document.getElementById('totalCalories').appendChild(totalCaloriesElement);
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>


<script>

    const USERS_NUTRIENT_REQUIRMENTS = {
        "maleReq18": {
            "Calories": 662
        },
        "maleReq31": {
            "Calories": 100
        },
        "maleReq51": {
            "Calories": 662
        },
        "maleReq71": {
            "Calories": 662
        },
        "femaleReq18": {
            "Calories": 354
        },
        "femaleReq31": {
            "Calories": 354
        },
        "femaleReq51": {
            "Calories": 354
        },
        "femaleReq71": {
            "Calories": 354
        },
        "femalePregnant": {
            "Calories": 340 // Update with the appropriate value
        },
        "femaleLactating": {
            "Calories": 330 // Update with the appropriate value
        }
    };



    //Creating empty object for user's personal nutrient requirements
    let userNutReq = {};

    //If the user is female, show select box, so she can choose if she is pregnant or lactating
    function showSelect() {
        let sexValue = document.getElementById("selectSex").value;

        if (sexValue === "female") {
            document.getElementById("selectPregnantLactating").style.display = "inline-block";
            document.getElementById("pregnantLactating").style.display = "inline-block";
        } else {
            document.getElementById("selectPregnantLactating").style.display = "none";
            document.getElementById("pregnantLactating").style.display = "none";
            document.getElementById("selectPregnantLactating").value = "";
        }
    }

    //Calculate and present energy requirements and personalized daily nutrient requirements
    function calculate() {
        let age = document.getElementById("inputAge").value;
        let sex = document.getElementById("selectSex").value;
        let pregnantOrLactating = document.getElementById("selectPregnantLactating").value;
        let height = document.getElementById("inputHeight").value;
        let weight = document.getElementById("inputWeight").value;
        let lifestyle = document.getElementById("selectLifestyle").value;

        //Inicializing activity coeficient (which depend of user's sex) and required calories (which depends of user's age, height, weight, sex, pregnant or lactating and activity)
        let activity = 0;
        let reqCalories = 0;

        //Checking if the form is filled
        if (age === "" || sex === "") {
            document.getElementById("messageFillIn2").innerHTML = "Please fill in the required fields.";
        } else if ((height === "" || weight === "") || lifestyle === "") {
            document.getElementById("messageFillIn2").innerHTML = "Please fill in the required fields.";
        } else if (age < 18) {
            document.getElementById("messageFillIn2").innerHTML = "This app is not for users under 18 years";
        }
        //If the form is filled, calculate
        else {
            document.getElementById("messageFillIn2").innerHTML = "";
            //Calculating calories and daily nutrient requirements
            if (sex === "male") {
                //Calculating activity coeficient and required daily calories
                switch (lifestyle) {
                    case "sedentary":
                        activity = 1;
                        break;
                    case "littleActive":
                        activity = 1.11;
                        break;
                    case "active":
                        activity = 1.25;
                        break;
                    case "veryActive":
                        activity = 1.48;
                        break;
                }

                reqCalories = 662 - (9.53 * age) + activity * ((15.91 * weight) + (539.6 * height / 100));

                //Asigning age specific nutrient requirements for male users
                if (18 <= age <= 30) {
                    userNutReq = USERS_NUTRIENT_REQUIRMENTS["maleReq18"];
                } else if (31 <= age <= 50) {
                    userNutReq = USERS_NUTRIENT_REQUIRMENTS["maleReq31"];
                } else if (51 <= age <= 70) {
                    userNutReq = USERS_NUTRIENT_REQUIRMENTS["maleReq51"];
                } else if (age >= 71) {
                    userNutReq = USERS_NUTRIENT_REQUIRMENTS["maleReq71"];
                }
            } else if (sex === "female") {
                //Calculating activity coeficient and required daily calories
                switch (lifestyle) {
                    case "sedentary":
                        activity = 1;
                        break;
                    case "littleActive":
                        activity = 1.12;
                        break;
                    case "active":
                        activity = 1.27;
                        break;
                    case "veryActive":
                        activity = 1.45;
                        break;
                }

                reqCalories = 354 - (6.91 * age) + activity * ((9.36 * weight) + (726 * height / 100));

                //Calculating calories & nutrient requirements when the user is pregnant or lactating
                if (pregnantOrLactating !== "") {
                    switch (pregnantOrLactating) {
                        case "pregnant2":
                            reqCalories += 340;
                            break;
                        case "pregnant3":
                            reqCalories += 452;
                            break;
                        case "lactating1":
                            reqCalories += 330;
                            break;
                        case "lactating2":
                            reqCalories += 400;
                            break;
                    }

                    switch (pregnantOrLactating) {
                        case "pregnant1":
                        case "pregnant2":
                        case "pregnant3":
                            userNutReq = USERS_NUTRIENT_REQUIRMENTS["femalePregnant"];
                            break;
                        case "lactating1":
                        case "lactating2":
                            userNutReq = USERS_NUTRIENT_REQUIRMENTS["femaleLactating"];
                            break;
                    }
                } else {
                    //Asigning age specific nutrient requirements for female users
                    if (18 <= age <= 30) {
                        userNutReq = USERS_NUTRIENT_REQUIRMENTS["femaleReq18"];
                    } else if (31 <= age <= 50) {
                        userNutReq = USERS_NUTRIENT_REQUIRMENTS["femaleReq31"];
                    } else if (51 <= age <= 70) {
                        userNutReq = USERS_NUTRIENT_REQUIRMENTS["femaleReq51"];
                    } else if (age >= 71) {
                        userNutReq = USERS_NUTRIENT_REQUIRMENTS["femaleReq71"];
                    }
                }
            }

            //Adding calories property to user's object with nutrient requrements
            userNutReq["reqCalories"] = reqCalories.toFixed(0);

            //Filling the table "Daily Requirement"
            let tableReq = document.getElementById("tableDailyRequirement");
            let cellReqId = "";

            for (let rowIndex = 0; rowIndex < tableReq.rows.length; rowIndex++) {
                if (rowIndex == 6 || rowIndex == 19) {
                } else {
                    cellReqId = tableReq.rows.item(rowIndex).cells[1].id;
                    tableReq.rows.item(rowIndex).cells[1].innerHTML = userNutReq[cellReqId];
                }
            }

            const totalCaloriesFromLog = parseFloat(document.getElementById('totalCalories').textContent.match(/\d+(\.\d+)?/)[0]);

            // Calculate the difference in total calories
            const calorieDifference = Math.abs(totalCaloriesFromLog - reqCalories);


            let message = "";
            if (calorieDifference <= 200) {
                message = "Your total calories are within the expected range.";
                document.getElementById("div-message-failed").style.display = "none";
                document.getElementById("div-message-success").style.display = "block";
                document.getElementById("div-message-success").style.height = "49px";
                document.getElementById("div-message-success").textContent = message;
            } else {
                message = "Your total calories differ significantly from the expected range. <a style='text-decoration: underline; margin-left: 20px' href='/view-personal-schedule'>View Schedule!</a>";
                document.getElementById("div-message-success").style.display = "none";
                document.getElementById("div-message-failed").style.display = "block";
                document.getElementById("div-message-failed").style.height = "49px";
                document.getElementById("div-message-failed").innerHTML  = message;
            }

        }

    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="../common/script.jspf" %>

