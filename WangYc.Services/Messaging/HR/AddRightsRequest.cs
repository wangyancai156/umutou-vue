﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WangYc.Services.Messaging.HR {
    public class AddRightsRequest {

        public int Id { get; set; }
        public int ParentId { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public bool IsShow { get; set; }
        public bool IsLeaf { get; set; }
        public string Description { get; set; }
        public string Icon { get; set; }

    }
}
