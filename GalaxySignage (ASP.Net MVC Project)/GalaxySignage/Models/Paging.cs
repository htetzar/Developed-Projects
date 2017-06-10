using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GalaxySignage.Models
{
    public class Paging
    {
        public int MaxPageNo { get; set; }
        public int[] PrevPages { get; set; }
        public int[] NextPages { get; set; }
        public int CurPageNo { get; set; }
        public int NoOfLinks { get; set; }

        public Paging(int pageSize, int totalRecCount, int curPageNo, int noOfLinks)
        {
            bool isNextPages = true;
            MaxPageNo = (int)Math.Ceiling(totalRecCount / (double)pageSize);
            CurPageNo = curPageNo;
            NoOfLinks = noOfLinks;

            if (CurPageNo == 1) // First Page
            {
                int count = 0;
                if (MaxPageNo < noOfLinks) { count = MaxPageNo; }
                else { count = noOfLinks; }
                NextPages = new int[count - 1];
                for (int i = 0; i < count - 1; i++)
                {
                    curPageNo = curPageNo + 1;
                    NextPages[i] = curPageNo;
                }
            }

            else if (CurPageNo == MaxPageNo) // Last Page
            {
                curPageNo = MaxPageNo;
                PrevPages = new int[NoOfLinks - 1];
                for (int i = PrevPages.Length - 1; i >= 0; i--)
                {
                    curPageNo = curPageNo - 1;
                    PrevPages[i] = curPageNo;
                }
            }

            else if (CurPageNo != 1 && CurPageNo != MaxPageNo)
            {
                int mid = (int)Math.Round(((noOfLinks / 2) + .1));

                if (CurPageNo < mid)    // Between First page and Mid page
                {
                    PrevPages = new int[CurPageNo - 1];
                    curPageNo = 0;
                    for (int i = 0; i < PrevPages.Length; i++)
                    {
                        curPageNo = curPageNo + 1;
                        PrevPages[i] = curPageNo;
                    }
                }
                else if (CurPageNo < MaxPageNo && CurPageNo > MaxPageNo - noOfLinks - 1)  // Between Mid Page and Last Page (Manipulate LastPage)
                {
                    if (MaxPageNo - CurPageNo > mid && CurPageNo>NoOfLinks) { NextPages = new int[MaxPageNo - CurPageNo - mid]; }
                    else { NextPages = new int[MaxPageNo - CurPageNo]; }
                    curPageNo = CurPageNo + 1;
                    for (int i = 0; i < NextPages.Length; i++)
                    {
                        NextPages[i] = curPageNo;
                        curPageNo = curPageNo + 1;
                    }

                    PrevPages = new int[NoOfLinks - 1 - NextPages.Length];
                    curPageNo = CurPageNo - 1 - PrevPages.Length;
                    for (int i = 0; i < PrevPages.Length; i++)
                    {
                        curPageNo = curPageNo + 1;
                        PrevPages[i] = curPageNo;
                    }
                    isNextPages = false;
                }

                else
                {
                    PrevPages = new int[CurPageNo - 1];
                    if (CurPageNo == PrevPages.Length) { curPageNo = curPageNo + 1 - PrevPages.Length; }  // eg. CurPageNo is 5 and PrevPages is 5
                    else { curPageNo = CurPageNo - PrevPages.Length; }

                    for (int i = 0; i < PrevPages.Length; i++)
                    {
                        PrevPages[i] = curPageNo;
                        curPageNo = curPageNo + 1;
                    }
                }

                if (isNextPages)
                {
                    NextPages = new int[noOfLinks - 1 - PrevPages.Length];
                    curPageNo = CurPageNo;
                    for (int i = 0; i < NextPages.Length; i++)
                    {
                        curPageNo = curPageNo + 1;
                        NextPages[i] = curPageNo;
                    }
                }
            }
        }
    }
}