using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GalaxySignage.Models
{
    public class PageList
    {

        public int MaxPageNo { get; set; }
        public int[] PrevPages { get; set; }
        public int[] NextPages { get; set; }

        public int curPage { get; set; }
        public PageList(int pageSize, int totalRecCount, int curPageNo)
        {
            if (totalRecCount % 10 == 0)
            {
                MaxPageNo = totalRecCount / 10;
            }

            else
            {
                MaxPageNo = (totalRecCount / 10) + 1;
            }

            PrevPages = new int[3];
            for (int pCount = 0; pCount < PrevPages.Length; pCount++)
            {
                PrevPages[pCount] = curPageNo - (pCount + 1);
            }

            NextPages = new int[3];
            for (int nCount = 0; nCount < NextPages.Length; nCount++)
            {
                NextPages[nCount] = curPageNo + (nCount + 1);
            }

            curPage = curPageNo;            

        }
    }
}