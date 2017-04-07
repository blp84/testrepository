using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyTestProject.Tests.Selenium
{
   
    public class TestsSelenium : IntegrationTestBase
    {
        public TestsSelenium(Type driver) : base(driver)
        {
        }

        [Test]
        public void FirstSeleniumTest()
        {                      
            Navigate("http://localhost:62847/");

            actions.Click(webDriver.FindElement(By.Id("li1"))).Perform();

            wait.Until(ExpectedConditions.UrlToBe("http://localhost:62847/Home/About"));

            Assert.That("Use this area to provide additional information1.", Is.EqualTo(webDriver.FindElement(By.Id("text1")).Text));
        }
    }
}
