using OpenQA.Selenium;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyTestProject.Tests.Selenium
{
    public static class TestSetup
    {
        private static readonly ConcurrentDictionary<Type, IWebDriver> drivers = new ConcurrentDictionary<Type, IWebDriver>();

        public static IWebDriver GetOrAddWebDriver(Type type, Func<Type, IWebDriver> factory)
        {
            return drivers.GetOrAdd(type, factory);
        }
    }
}
