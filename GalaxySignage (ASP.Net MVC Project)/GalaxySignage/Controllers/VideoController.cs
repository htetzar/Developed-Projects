using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GalaxySignage.Models;
using System.IO;
using System.Configuration;
using System.Web.Script.Serialization;
//using PagedList;
//using PagedList.Mvc;
using MediaInfoDotNet;
//using Paging;
using System.Diagnostics;


namespace GalaxySignage.Controllers
{
    public class VideoController : Controller
    {
        // GET: /Video/
        public ActionResult Index(int? page)
        {
            using (var db = new SignageContainer())
            {
                int pageSize = 10;
                int curPageNo = page.HasValue ? Convert.ToInt32(page) : 1;
                int skipRows = (curPageNo - 1) * pageSize;
                int noOfLinks = 10;

                var data = db.Videos.OrderBy(v => v.Name).Skip(skipRows).Take(pageSize).ToArray();
                var totalRecordCount = db.Videos.Count();
                ViewBag.Paging = new Paging(pageSize, totalRecordCount, curPageNo, noOfLinks);
                return View(data);
            }
        }

        public ActionResult VideoUpload()
        {
            return View();
        }

        // Delete Video File 
        [HttpPost, ActionName("Index")]
        public ActionResult IndexPost(IEnumerable<int> deleteInputs)
        {
            using (var db = new SignageContainer())
            {
                foreach(var item in deleteInputs)
                {
                    var video=db.Videos.Find(item);
                    if(video==null)
                    {
                        return HttpNotFound();
                    }

                    // Delete File from Folder
                    DeleteFile(item);
                    // Delete File Record from Database
                    db.Videos.Remove(video);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
        }

        [HttpPost, ActionName("UploadFile")]
        public ActionResult UploadFile()
        
        {
            var statuses = new List<FilesStatus>();
            for (int i = 0; i < Request.Files.Count; i++)
            {
                var file = Request.Files[i];

                //using (MediaFile mf = new MediaFile(file.InputStream))
                //{
                    double durationinNanoSecond = 10000;
                    //if (durationinNanoSecond > 0 && mf.Video.Count > 0)
                    //{
                        Guid NewGuid = Guid.NewGuid();

                        var fullPath = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/" + ConfigurationManager.AppSettings["VideoFolder"] + "/")
                        , Path.GetFileNameWithoutExtension(file.FileName).Replace(" ","_")
                        + "_" + NewGuid.ToString() + Path.GetExtension(file.FileName)); 

                        file.SaveAs(fullPath);                        

                        Process.Start(new ProcessStartInfo(
                            Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/" + "FFmpeg/ffmpeg.exe"))
                            , "-ss 10"
                            + " -i " + fullPath
                            + @" -vf " + @"scale=100:-1,select='eq(pict_type,PICT_TYPE_I)'"
                            + " -frames:v 1"
                            + " " + Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/"
                            + ConfigurationManager.AppSettings["ThumbnailFolder"] + "/")
                            , Path.GetFileNameWithoutExtension(file.FileName).Replace(" ","_")
                            + "_" + NewGuid.ToString() + ConfigurationManager.AppSettings["ThumbnailImageExtension"])))
                            .WaitForExit(3000);                          
                       

                        string fullName = Path.GetFileName(file.FileName);

                        statuses.Add(new FilesStatus(fullName, file.ContentLength, fullPath));
                        double durationinSecond = durationinNanoSecond / 1000;
                        TimeSpan ts = TimeSpan.FromSeconds(durationinSecond);

                        decimal MediaInfoDotnetsizeonByte = Convert.ToDecimal(120.0);
                        Video Newvideo = new Video();
                        Newvideo.Name = Path.GetFileNameWithoutExtension(file.FileName);
                        Newvideo.Duration = ts;
                        Newvideo.Size = MediaInfoDotnetsizeonByte.ToString();
                        Newvideo.FileName = Path.GetFileNameWithoutExtension(file.FileName) + "_" + NewGuid.ToString() + Path.GetExtension(file.FileName);

                        using (var db = new SignageContainer())
                        {
                            db.Videos.Add(Newvideo);

                            db.SaveChanges();
                        }
                //    }
                //    else
                //    {
                //        statuses[i].error = "File Format Not Support ";
                //        return Json(statuses);
                //    }
                //}
            }

            JsonResult result = Json(statuses);
            result.ContentType = "application/json";

            return Json(statuses);
        }

        public double Convert100NanosecondsToMilliseconds(double nanoseconds)
        {
            // One million nanoseconds in 1 millisecond, but we are passing in 100ns units...
            return nanoseconds * 0.0001;
        }

        void DeleteFile(int id)
        {
            using (var db = new SignageContainer())
            {
                var fileName = (from p in db.Videos
                                where p.Id == id
                                select p).First().FileName;
              
                var filePath = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/" + ConfigurationManager.AppSettings["VideoFolder"] + "/")) + fileName;
                
                FileInfo file = new FileInfo(filePath);
                if (file.Exists)    //check file exsit or not
                {
                    file.Delete();
                }
            }
        }
        public ActionResult Play(int id)
        {
            using (SignageContainer db = new SignageContainer())
            {
               
                var v = db.Videos.Find(id);

                var url = String.Format("{0}/{1}",
                    @Url.Content("~/" + ConfigurationManager.AppSettings["VideoFolder"]),
                    v.FileName);
                return Json(new {name = v.Name,  url = url },JsonRequestBehavior.AllowGet);
            }
        }

    }
}
