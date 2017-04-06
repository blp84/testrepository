using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyTestProject.Tests.Selenium
{
    [TestFixture(typeof(InternetExplorerDriverFactory), Category = "IE")]
    [TestFixture(typeof(ChromeDriverFactory), Category = "Chrome")]
    public abstract class IntegrationTestBase
    {
        protected Type Driver;
        protected IWebDriver webDriver;
        protected WebDriverWait wait;
        protected Actions actions;
        protected IntegrationTestBase(Type driver)
        {
            Driver = driver;
            webDriver = CreateDriver(driver);
            wait = new WebDriverWait(webDriver, TimeSpan.FromSeconds(30));
            actions = new Actions(webDriver);
        }

        protected IWebDriver CreateDriver(Type driver)
        {
            return TestSetup.GetOrAddWebDriver(driver, (t) => ((ISeleniumDriver)Activator.CreateInstance(t)).Create());
        }

        protected void  Navigate(string page)
        {
            webDriver.Navigate().GoToUrl(page);
            wait.Until(ExpectedConditions.UrlToBe(page));          
        }
    }
}
