package com.example;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
public class SimpleTest {

    private WebDriver webDriver;

    @Before
    public void setup() {
        webDriver = new FirefoxDriver();

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
