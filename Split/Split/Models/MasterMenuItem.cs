using System;
using System.Collections.Generic;
using System.Text;
using Xamarin.Forms;

namespace Split.Models
{
    public class MasterMenuItem
    {
        public string Title { get; set; }
        public Color Backgroundcolor { get; set; }
        public Type TargetType { get; set; }

        public MasterMenuItem(string Title, Color color, Type target)
        {
            this.Title = Title;
            this.Backgroundcolor = color;
            this.TargetType = target;
        }
    }
}
