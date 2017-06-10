using GalaxySignage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace GalaxySignage.ViewModels
{
    public class PlaylistViewModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }
        public TimeSpan TotalDuration { get; set; }
        [Required(ErrorMessage = "Video is required")]
        public int[] Videos { get; set; }     
    }
}