using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyTestProject.Tests.Selenium{

    public interface ISeleniumDriver
    {
        IWebDriver Create();
        void RemoveStandaloneDriver();
        void KillStandaloneServerProcess();
    }
}
