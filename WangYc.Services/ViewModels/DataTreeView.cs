﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WangYc.Services.ViewModels {
    public class DataTreeView : DataTree {
 
        public string ParentId { get; set; }

        public IList<DataTree> children { get; set; }

    }
}
