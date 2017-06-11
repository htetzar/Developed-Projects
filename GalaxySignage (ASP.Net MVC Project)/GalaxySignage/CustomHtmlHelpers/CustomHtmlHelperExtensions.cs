using GalaxySignage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GalaxySignage.CustomHtmlHelpers
{
    public static class CustomHtmlHelperExtensions
    {
        public static MvcHtmlString CustomPager(this HtmlHelper helper, Paging pg,
            Func<int, string> action)
        {
            if (pg.MaxPageNo <= 0)
            {
                return MvcHtmlString.Empty;
            }
            bool isCurPage = false;
            var ul = new TagBuilder("ul");
            ul.AddCssClass("pagination");
            ul.InnerHtml += AddLink(1, action, pg.CurPageNo == 1, "disabled", "<<", "First Page");
            ul.InnerHtml += AddLink(pg.CurPageNo - 1, action, pg.CurPageNo == 1, "disabled", "<", "Previous Page");
            if (pg.PrevPages != null)
            {
                foreach (int i in pg.PrevPages)
                {
                    ul.InnerHtml += AddLink(i, action, i == pg.CurPageNo, "active", i.ToString(), i.ToString());
                }
            }

            ul.InnerHtml += AddLink(pg.CurPageNo, action, isCurPage = true, "active", pg.CurPageNo.ToString(), pg.CurPageNo.ToString());

            if (pg.NextPages != null)
            {

                foreach (int i in pg.NextPages)
                {
                    ul.InnerHtml += AddLink(i, action, i == pg.CurPageNo, "active", i.ToString(), i.ToString());
                }
            }

            ul.InnerHtml += AddLink(pg.CurPageNo + 1, action, pg.CurPageNo == pg.MaxPageNo, "disabled", ">", "Next Page");
            ul.InnerHtml += AddLink(pg.MaxPageNo, action, pg.CurPageNo == pg.MaxPageNo, "disabled", ">>", "Last Page");
            return MvcHtmlString.Create(ul.ToString());
        }
        private static TagBuilder AddLink(int index, Func<int, string> action, bool condition, string classToAdd, string linkText, string tooltip)
        {
            var li = new TagBuilder("li");
            li.MergeAttribute("title", tooltip);
            if (condition)
            {
                li.AddCssClass(classToAdd);
            }
            var a = new TagBuilder("a");
            a.MergeAttribute("href", !condition ? action(index) : "javascript:");
            a.SetInnerText(linkText);
            li.InnerHtml = a.ToString();
            return li;
        }
    }
}