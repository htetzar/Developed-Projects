using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;
using GalaxySignage.Models;
using System.Threading.Tasks;
using GalaxySignage.ViewModels;
using PagedList;
using PagedList.Mvc;
using System.Configuration;

namespace GalaxySignage.Controllers
{
    public class PlayListsController : Controller
    {
        #region Index
        public ActionResult Index(int pageNo = 1)
        {
            using (SignageContainer db = new SignageContainer())
            {
                var pageSize = Int32.Parse(ConfigurationManager.AppSettings["PageSize"]);
                int skipRows = (pageNo - 1) * pageSize;

                var data = db.Playlists.Include("Videos").OrderBy(v => v.Name).Skip(skipRows).Take(pageSize).ToArray();
                db.Videos.Include("PlayLists");                
                var totalRecCount = db.Playlists.Count();
                ViewBag.Paging = new PageList(pageSize, totalRecCount, pageNo);
                return View(data);
            }
        }

        #endregion

        #region Delete

        public ActionResult DeleteSelected(int[] IdsToDelete)
        {
            if (IdsToDelete != null && IdsToDelete.Length > 0)
            {
                List<Playlist> allSelected = new List<Playlist>();
                using (SignageContainer db = new SignageContainer())
                {
                    allSelected = db.Playlists.Where(p => IdsToDelete.Contains(p.Id)).ToList();
                    foreach (var i in allSelected)
                    {
                        //foreach (var v in i.Videos.ToArray()) Delete is original , loop is copy
                        //{
                        //    i.Videos.Remove(v);
                        //}

                        db.Playlists.Remove(i);
                    }

                    db.SaveChanges();
                }
            }
            return RedirectToAction("Index");
        }

        #endregion


        #region +++ Bind Drop Down to Create +++
        public void BindDropDown()
        {
            using (var db = new SignageContainer())
            {
                ViewBag.Videos = db.Videos
                    .ToArray()
                    .Select(v => new SelectListItem() { Text = v.Name, Value = v.Id.ToString() });

                // return View(new Playlist());

            }
        }
        #endregion

        public ActionResult Edit(int id)
        {
            BindDropDown();
            using (var db = new SignageContainer())
            {
                var pl = db.Playlists.Find(id);
                pl.Videos = db.Playlists.Find(id).Videos;
                if (pl == null)
                {
                    return HttpNotFound();
                }
                return View(pl);
            }
        }
        [HttpPost]
        public ActionResult Edit([Bind(Include = "Id,Name,TotalDuration, Videos")] PlaylistViewModel playList)
        {

            using (SignageContainer db = new SignageContainer())
            {
                if (ModelState.IsValid)
                {
                    var videos = db.Videos
                        .Where(v => playList.Videos.Contains(v.Id))
                        .ToArray();

                    var totalDuration = TimeSpan.FromSeconds(videos.Sum(v => v.Duration.TotalSeconds));

                    var pl = db.Playlists.Find(playList.Id);
                    pl.Videos.Clear();
                    //db.SaveChanges();

                    //foreach(var v in pl.Videos.ToArray())
                    //{
                    //    pl.Videos.Remove(v);
                    //}

                    pl.Name = playList.Name;
                    pl.TotalDuration = totalDuration;
                    foreach (var v in videos) {
                        pl.Videos.Add(v);
                    }

                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                return Edit(playList.Id);

            }
        }


        public ActionResult Create()
        {
            BindDropDown();
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "Id,Name,TotalDuration, Videos")] PlaylistViewModel playList)
        {
            using (SignageContainer db = new SignageContainer())
            {
                if (ModelState.IsValid)
                {
                    var videos = db.Videos
                        .Where(v => playList.Videos.Contains(v.Id))
                        .ToArray();

                    var totalDuration = TimeSpan.FromSeconds(videos.Sum(v => v.Duration.TotalSeconds));

                    var p = new Playlist
                    {
                        Name = playList.Name,
                        TotalDuration = totalDuration,
                        Videos = videos
                    };
                    db.Playlists.Add(p);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return Create();
        }

        public ActionResult Play(int id, string from)
        {
            using (SignageContainer db = new SignageContainer())
            {
                if (from.Equals("playlist"))
                {
                    var pl = db.Playlists.Find(id);
                    return View(pl.Videos);
                }
                ViewBag.Video = db.Videos.Find(id);
                return View();
            }
        }
    }
}