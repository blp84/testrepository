using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Remote;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyTestProject.Tests.Selenium
{
    public class ChromeDriverFactory : ISeleniumDriver
    {
        public IWebDriver Create()
        {
            return new RemoteWebDriver(new Uri("http://localhost:4444/wd/hub/"), new ChromeOptions().ToCapabilities());
        }     

        public void RemoveStandaloneDriver()
        {
            throw new NotImplementedException();
        }

        public void KillStandaloneServerProcess()
        {
            throw new NotImplementedException();
        }
    }
}
