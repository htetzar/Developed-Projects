using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using GalaxySignage.Models;

namespace GalaxySignage.Tests
{
    [TestClass]
    public class PagingTest
    {
        [TestMethod]
        public void ShouldHaveCorrectMaxPageNo()
        {
            var paging = new Paging(10, 101, 1, 10);
            Assert.AreEqual(paging.MaxPageNo, 11);
        }
    }
}
