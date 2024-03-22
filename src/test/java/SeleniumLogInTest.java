import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.io.PrintStream;
import java.time.Duration;

public class SeleniumLogInTest {
    @Test
    public void testAutoSuccessLogin() {
        WebDriver driver;
        driver = new ChromeDriver();
        driver.get("http://localhost:8080/auth/login");

        // Find the email and password input fields and submit button
        WebElement emailInput = driver.findElement(By.name("email"));
        WebElement passwordInput = driver.findElement(By.name("password"));
        WebElement loginButton = driver.findElement(By.xpath("//button[@type='submit']"));

        // Enter your email and password
        emailInput.sendKeys("trinhtruongcong3@gmail.com");
        passwordInput.sendKeys("123123123");

        loginButton.click();

        String expectedUrl = "http://localhost:8080/welcome";
        String nextPageUrl = driver.getCurrentUrl();

        Assertions.assertEquals(expectedUrl, nextPageUrl, "Login Failed!, Failed Test!...");
    }

    @Test
    public void testAutoLoginMissingFields() {
        WebDriver driver;
        driver = new ChromeDriver();
        driver.get("http://localhost:8080/auth/login");

        // Find the email and password input fields and submit button
        WebElement emailInput = driver.findElement(By.name("email"));
        WebElement passwordInput = driver.findElement(By.name("password"));
        WebElement loginButton = driver.findElement(By.xpath("//button[@type='submit']"));

        // Only fill one field (email) and leave the other field (password) empty
        emailInput.sendKeys("trinhtruongcong3@gmail.com");

        loginButton.click();

        String expected = "Please fill out this field.";

        // Get error message generate by required attribute in js
        String actualMessage = driver.findElement(By.name("password")).getAttribute("validationMessage");
        Assertions.assertEquals(expected, actualMessage);


//        String currentPageUrl = driver.getCurrentUrl();
//        String loginPageUrl = "http://localhost:8080/auth/login";
//        Assertions.assertEquals(loginPageUrl, currentPageUrl);
    }

}
