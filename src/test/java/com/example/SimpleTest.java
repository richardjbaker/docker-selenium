package com.example;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxDriverLogLevel;
import org.openqa.selenium.firefox.FirefoxOptions;

public class SimpleTest {

    private WebDriver webDriver;

    @Before
    public void setup() {
       // System.setProperty("webdriver.gecko.driver", "/Users/richardbaker/IdeaProjects/tr/geckodriver");
        FirefoxOptions options = new FirefoxOptions();
        options.setLogLevel(FirefoxDriverLogLevel.TRACE);
        webDriver = new FirefoxDriver(options);

    }

    @After
    public void teardown() {
        webDriver.close();
    }

    @Test
    public void shouldNavigateToGoogle() {
        webDriver.navigate().to("http://www.google.co.uk");
    }

}
