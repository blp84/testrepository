using OpenQA.Selenium;
using OpenQA.Selenium.Remote;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyTestProject.Tests.Selenium
{
    public class InternetExplorerDriverFactory : ISeleniumDriver
    {
        public IWebDriver Create()
        {
            var desiredCapabilities = new DesiredCapabilities("internet explorer", string.Empty, new Platform(PlatformType.Windows));
            desiredCapabilities.SetCapability("enablePersistentHover", false);
            desiredCapabilities.SetCapability("ensureCleanSession", true);
            desiredCapabilities.SetCapability("ignoreProtectedModeSettings", true);
            desiredCapabilities.SetCapability("enableElementCacheCleanup", false);

            var driver = new RemoteWebDriver(new Uri("http://localhost:4444/wd/hub/"), desiredCapabilities);
            driver.Manage().Window.Maximize();
            return driver;
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
