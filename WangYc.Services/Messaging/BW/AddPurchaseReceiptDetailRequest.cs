﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WangYc.Services.Messaging.BW {
    public class AddPurchaseReceiptDetailRequest {

        
        public virtual int PurchaseNoticeId {
            get;
            set;
        }
        public virtual int PurchaseOrderDetailId {
            get;
            set;
        }
        public virtual int Qty {
            get;
            set;
        }
        public virtual string Note {
            get;
            set;
        }
        public virtual bool IsValid {
            get;
            set;
        }
        public virtual string CreateUserId {
            get;
            set;
        }
    }
}
