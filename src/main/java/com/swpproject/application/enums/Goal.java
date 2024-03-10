package com.swpproject.application.enums;

public enum Goal {
    LW("Lose Weight"),
    GM("Gain Muscle"),
    GW("Gain Weight"),
    CE("Cardio Endurance"),
    FM("Improve Flexibility and Mobility"),
    SMM("Strength and Muscle Maintenance"),
    BC("Body Composition Transformation"),
    SB("Skill-Based Fitness"),
    CR("Consistent Workout Routine");

    private final String goal;

    Goal(String goal) {
        this.goal = goal;
    }

    public String getLabel() {
        return goal;
    }
}
