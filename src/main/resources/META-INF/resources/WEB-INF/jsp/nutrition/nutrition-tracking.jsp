<%@ include file="../common/header.jspf" %>
<%@ include file="../common/sidebar.jspf" %>
<%@ include file="../common/head.jspf" %>
<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="card">
                <div class="row" style="justify-content: space-evenly;">
                    <div class="col-6 col-lg-6" id="divPersonalInfo">
                        <h2 id="personalGreeting">HI!</h2>
                        <p>What are your daily nutritional requirements?</p>
                        <h3>Let's find out!</h3>
                        <form id="formPersonalInfo">
                            <table id="tablePersonalInfo">
                                <tr>
                                    <td class="cellPI">Age:</td>
                                    <td><input class="inputs" id="inputAge" type="number" name="age" min="18"
                                               max="150"></td>
                                </tr>
                                <tr>
                                    <td class="cellPI">Sex:</td>
                                    <td>
                                        <select class="inputs" id="selectSex" onchange="showSelect()">
                                            <option value=""></option>
                                            <option value="female">female</option>
                                            <option value="male">male</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cellPI"><span id="pregnantLactating">PG/LAC:</span></td>
                                    <td>
                                        <select class="inputs" id="selectPregnantLactating">
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
                                    <td class="cellPI">Height:</td>
                                    <td><input class="inputs" id="inputHeight" type="number" name="height" min="100"
                                               max="250">cm
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cellPI">Weight:</td>
                                    <td><input class="inputs" id="inputWeight" type="number" name="weight" min="20"
                                               max="300"> kg
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cellPI">Lifestyle:</td>
                                    <td>
                                        <select class="inputs" id="selectLifestyle">
                                            <option value=""></option>
                                            <option value="sedentary">sedentary</option>
                                            <option value="littleActive">somewhat active</option>
                                            <option value="active">active</option>
                                            <option value="veryActive">very active</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button class="btn btn-primary" id="btnCalculate" type="button" onclick="calculate()">
                                Calculate
                            </button>
                            <p id="messageFillIn2"></p>
                        </form>
                    </div>
                    <div class="col-5 col-lg-5" id="divDailyRequirement">
                        <h2>YOUR DAILY NUTRITIONAL REQUIREMENTS</h2>
                        <table id="tableDailyRequirement">
                            <tr>
                                <td style="text-align: left; font-size: large">Calories (kcal)</td>
                                <td style="font-size: large" id="reqCalories"></td>
                            </tr>
                        </table>
                    </div>

                    <div class="col-5 col-lg-4" id="divFoodSelection">
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
                                <th class="text-end">Action</th>
                            </tr>
                            </thead>
                            <tbody id="foodLogBody">
                            <tr>
                                <td>
                                    <h2>
                                        <a>Banana</a>
                                    </h2>
                                </td>
                                <td>178</td>
                                <td>45.7</td>
                                <td>0.7</td>
                                <td>2.2</td>
                                <td>200</td>
                                <td class="text-end">
                                    <div class="actions">
                                        <a href="javascript:;" class="btn btn-sm bg-success-light me-2">
                                            <i class="feather-eye"></i>
                                        </a>
                                        <a href="edit-department.html" class="btn btn-sm bg-danger-light">
                                            <i class="feather-edit"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <button class="btn btn-primary" id="btnAddFood" type="button" data-bs-toggle="modal"
                                data-bs-target="#foodModal">Add New Food
                        </button>
                    </div>

                    <!-- Modal for selecting food and quantity -->
                    <div class="modal" id="foodModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Select Food and Quantity</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                    <label for="foodInput" class="form-label">Nutrition Name:</label>
                                    <input type="text" id="foodInput" placeholder="Type to search" class="form-control mb-3">
                                    <div id="foodDropdown" class="dropdown-menu" style="margin-top: -18px; width: 467px;" aria-labelledby="foodInput">
                                        <c:forEach items="${nutritionList}" var="nutrition">
                                            <button class="dropdown-item select2-container" type="button" value="${nutrition.nutritionId}">${nutrition.getName()}</button>
                                        </c:forEach>
                                    </div>
                                    <div class="mb-3">
                                        <label for="quantityInput" class="form-label">Quantity (g):</label>
                                        <input type="number" class="form-control" id="quantityInput" placeholder="Enter quantity">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <button type="button" class="btn btn-primary" id="addFoodButton">Add Food</button>
                                </div>
                                <script>
                                    document.getElementById('foodInput').addEventListener('input', function() {
                                        const inputText = this.value.trim().toLowerCase();
                                        const foodDropdown = document.getElementById('foodDropdown');
                                        const options = foodDropdown.getElementsByTagName('button');
                                        for (let i = 0; i < options.length; i++) {
                                            const foodName = options[i].textContent.toLowerCase();
                                            if (foodName.includes(inputText)) {
                                                options[i].style.display = '';
                                            } else {
                                                options[i].style.display = 'none';
                                            }
                                        }
                                        foodDropdown.classList.add('show');
                                    });

                                    // Close the dropdown when clicking outside
                                    document.addEventListener('click', function(event) {
                                        const foodDropdown = document.getElementById('foodDropdown');
                                        if (!event.target.matches('#foodInput')) {
                                            foodDropdown.classList.remove('show');
                                        }
                                    });

                                    // Select food when clicked
                                    document.getElementById('foodDropdown').addEventListener('click', function(event) {
                                        const target = event.target;
                                        if (target.tagName === 'BUTTON') {
                                            document.getElementById('foodInput').value = target.textContent.trim();
                                            document.getElementById('foodDropdown').classList.remove('show');
                                        }
                                    });

                                    document.getElementById('addFoodButton').addEventListener('click', function() {
                                        const foodId = document.getElementById('foodInput').dataset.nutritionId;
                                        const quantity = document.getElementById('quantityInput').value.trim();

                                        if (foodId === '' || quantity === '') {
                                            alert('Please select a food and enter a quantity.');
                                            return; // Exit the function early
                                        }

                                        // You can perform further actions with the foodId and quantity here
                                        console.log('Selected Food ID:', foodId);
                                        console.log('Quantity:', quantity);
                                    });



                                </script>
                            </div>
                        </div>
                    </div>

                    <script>
                        var foodList = ${nutritionList}
                            console.log(foodList)

                        function addFood() {
                            // Get selected food and quantity
                            var foodSelect = document.getElementById("foodSelect");
                            var foodName = foodSelect.options[foodSelect.selectedIndex].text;
                            var foodId = foodSelect.options[foodSelect.selectedIndex].value;
                            var quantity = document.getElementById("quantityInput").value;

                            // Validate quantity
                            if (quantity === "" || isNaN(quantity) || quantity <= 0) {
                                alert("Please enter a valid quantity.");
                                return;
                            }

                            var selectedFood = foodList.find(food => food.nutritionId === selectedFoodId);
                            console.log(selectedFood)
                            // Calculate total calories, fat, carb, and protein based on quantity
                            // var totalCalories = selectedFood.caloIn * parseInt(quantity);
                            // var totalFat = selectedFood.fat * parseInt(quantity) / 100;
                            // var totalCarb = selectedFood.carb * parseInt(quantity) / 100;
                            // var totalProtein = selectedFood.protein * parseInt(quantity) / 100;

                            // console.log(totalFat)

                            // Calculate total calories based on quantity (assuming calorie info is stored in data attributes)
                            // var foodCalories = parseInt(foodSelect.value);
                            // var totalCalories = foodCalories * parseInt(quantity);


                            // Create table row for the food log
                            var newRow = "<tr>" +
                                "<td><h2><a>" + foodName + "</a></h2></td>" +
                                "<td>" + "</td>" +
                                "<td>Carb Value</td>" +
                                "<td>Fat Value</td>" +
                                "<td>Protein Value</td>" +
                                "<td class='text-end'>" +
                                "<div class='actions'>" +
                                "<a href='javascript:;' class='btn btn-sm bg-success-light me-2'><i class='feather-eye'></i></a>" +
                                "<a href='edit-department.html' class='btn btn-sm bg-danger-light'><i class='feather-edit'></i></a>" +
                                "</div>" +
                                "</td>" +
                                "</tr>";

                            // Append the new row to the food log table
                            document.getElementById("foodLogBody").innerHTML += newRow;

                            // Close the modal
                            var modal = new bootstrap.Modal(document.getElementById("foodModal"));
                            modal.hide();
                        }
                    </script>

                    <div class="col-5 col-lg-4" id="divNutritionTracker">
                        <h2>DAILY NUTRITIONAL PROFILE</h2>
                        <table id="tableNutritionTracker">
                            <tr>
                                <td class="cellWidth">Calories</td>
                                <td id="Calories" class="cellsProgressBar">
                                    <div class="divProgressBar"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="cellWidth">Linoleic Acid</td>
                                <td id="LinoleicAcid" class="cellsProgressBar">
                                    <div class="divProgressBar"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="cellWidth">Alpha-Linoleic Acid</td>
                                <td id="AlphaLinoleicAcid" class="cellsProgressBar">
                                    <div class="divProgressBar"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="cellWidth">Protein</td>
                                <td id="Protein" class="cellsProgressBar">
                                    <div class="divProgressBar"></div>
                                </td>
                            </tr>
                        </table>
                        <button class="btn btn-primary" id="btnAddMore" type="button" onclick="addMoreFood()">Add More
                            Food
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    const GRAINS = {
        "Oats, raw": {
            "Calories": 389,
            "TotalCarbohydrate": 66.27,
            "LinoleicAcid": 2.424,
            "AlphaLinoleicAcid": 0.111
        },
        "Rice, raw": {
            "Calories": 362,
            "TotalCarbohydrate": 76.17,
            "LinoleicAcid": 0.918,
            "AlphaLinoleicAcid": 0.041
        },
        "Quinoa, raw": {
            "Calories": 368,
            "TotalCarbohydrate": 64.16,
            "LinoleicAcid": 2.977,
            "AlphaLinoleicAcid": 0.260
        }
    };

    const VEGETABLES = {
        "Broccoli, raw": {
            "Calories": 34,
            "TotalCarbohydrate": 6.64,
            "LinoleicAcid": 0.049,
            "AlphaLinoleicAcid": 0.063
        },
        "Carrots, raw": {
            "Calories": 41,
            "TotalCarbohydrate": 9.58,
            "LinoleicAcid": 0.100,
            "AlphaLinoleicAcid": 0.002
        },
        "Potatos, raw, skin": {
            "Calories": 58,
            "TotalCarbohydrate": 12.44,
            "LinoleicAcid": 0.032,
            "AlphaLinoleicAcid": 0.010
        }
    };

    const FRUITS = {
        "Apples, raw, with skin": {
            "Calories": 52,
            "TotalCarbohydrate": 13.81,
            "LinoleicAcid": 0.043,
            "AlphaLinoleicAcid": 0.009
        },
        "Bananas, raw": {
            "Calories": 89,
            "TotalCarbohydrate": 22.84,
            "LinoleicAcid": 0.046,
            "AlphaLinoleicAcid": 0.027
        },
        "Oranges, raw, with peel": {
            "Calories": 63,
            "TotalCarbohydrate": 15.50,
            "LinoleicAcid": 0.044,
            "AlphaLinoleicAcid": 0.016
        }
    };

    //Daily required macro and micronutrients, depending on age, sex, if pregnant or lactating
    const USERS_NUTRIENT_REQUIRMENTS = {
        "maleReq18": {
            "Carbohydrate": 130,
            "Fat": 0,
            "Protein": 56
        },
        "maleReq31": {
            "Carbohydrate": 130,
            "Fat": 0,
            "Protein": 56
        },
        "maleReq51": {
            "Carbohydrate": 130,
            "Fat": 0,
            "Protein": 56
        },
        "maleReq71": {
            "Carbohydrate": 130,
            "Fat": 0,
            "Protein": 56
        },
        "femaleReq18": {
            "Carbohydrate": 130,
            "Fat": 0,
            "Protein": 46
        },
        "femaleReq31": {
            "Carbohydrate": 130,
            "Fat": 0,
            "Protein": 46
        },
        "femaleReq51": {
            "Carbohydrate": 130,
            "Fat": 0,
            "Protein": 46
        },
        "femaleReq71": {
            "Carbohydrate": 130,
            "Fat": 0,
            "Protein": 46
        },
        "femalePregnant": {
            "Carbohydrate": 175,
            "Fat": 0,
            "Protein": 71
        },
        "femaleLactating": {
            "Carbohydrate": 210,
            "Fat": 0,
            "Protein": 71
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
        }

    }


    //Moving to divFoodSelection
    function checkMyDay() {
        scrollTo(0, 0);
        document.getElementById("divFoodSelection").style.display = "block";
    }

    //Calculating the sum of nutrients of all food and calling other function for calculating percents of fullfiled daily requirements
    function tracking() {
        //Initiazilizing daily consumed nutrients
        let totalNutrients = {
            "Calories": 0,
            "TotalCarbohydrate": 0,
            "Protein": 0,
            "Fat": 0
        };
        let tableList = document.getElementById("tableMyPlate");
        let foodValue = "";
        let foodQuantityCell = "";
        let foodQuantity = 0;
        let foodCtg = {};

        if (tableList.rows.length === 1) {
            document.getElementById("messageFillIn3").innerHTML = "Please choose your food.";
        } else {
            scrollTo(0, 0);
            document.getElementById("divFoodSelection").style.display = "none";
            document.getElementById("divNutritionTracker").style.display = "block";

            //Checking the food category
            for (let indexRows = 1; indexRows < tableList.rows.length; indexRows++) {
                foodValue = tableList.rows.item(indexRows).cells[0].innerHTML;
                foodQuantityCell = tableList.rows.item(indexRows).cells[1];
                foodQuantity = foodQuantityCell.children[0].value;

                if (GRAINS.hasOwnProperty(foodValue)) {
                    foodCtg = GRAINS;
                } else if (VEGETABLES.hasOwnProperty(foodValue)) {
                    foodCtg = VEGETABLES;
                } else if (FRUITS.hasOwnProperty(foodValue)) {
                    foodCtg = FRUITS;
                }

                totalNutrients["Calories"] += foodCtg[foodValue]["Calories"] * foodQuantity / 100;
                totalNutrients["TotalCarbohydrate"] += foodCtg[foodValue]["TotalCarbohydrate"] * foodQuantity / 100;
                totalNutrients["Protein"] += foodCtg[foodValue]["Protein"] * foodQuantity / 100;
                totalNutrients["Fat"] += foodCtg[foodValue]["Fat"] * foodQuantity / 100
            }

            //calculating percenting of daily nutrients fullfilment and filling the tables cells
            //Filling the table "Daily Requirement"
            let tableResult = document.getElementById("tableNutritionTracker");
            let cellResultId = "";
            let percents = 0;
            let str = "req";
            let prop = "";

            for (let rowIndex = 0; rowIndex < tableResult.rows.length; rowIndex++) {
                if (rowIndex == 6 || rowIndex == 19) {
                } else {
                    cellResultId = tableResult.rows.item(rowIndex).cells[1].id;
                    prop = str.concat(cellResultId);
                    percents = totalNutrients[cellResultId] / userNutReq[prop] * 100;
                    tableResult.rows.item(rowIndex).cells[1].children[0].innerHTML = percents.toFixed(0) + "%";

                    if (percents >= 100) {
                        tableResult.rows.item(rowIndex).cells[1].children[0].style.width = "100%";
                        tableResult.rows.item(rowIndex).cells[1].children[0].style.backgroundColor = "#8aff75";
                    } else {
                        tableResult.rows.item(rowIndex).cells[1].children[0].style.width = percents.toFixed(0) + "%";
                        tableResult.rows.item(rowIndex).cells[1].children[0].style.backgroundColor = "#ff758a";
                    }
                }
            }
        }
    }

    //Returning to add more foods on daily food list
    function addMoreFood() {
        scrollTo(0, 0);
        document.getElementById("divFoodSelection").style.display = "block";
        document.getElementById("divNutritionTracker").style.display = "none";
    }

    //Delete the row with the artical that the user doesn't need
    function deleteRow() {
        this.closest("tr").remove();
        rowIndexMyPlate--;
    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="../common/script.jspf" %>

