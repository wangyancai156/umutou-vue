﻿using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WangYc.Core.Infrastructure.UnitOfWork;
using WangYc.Models.BW;
using WangYc.Models.Repository.BW;
using WangYc.Repository.NHibernate.Repositories.BW;

namespace WangYc.Repository.NHibernate.Tests.BW {
    [TestClass]
    public class PurchaseReceiptTests {

        private readonly IPurchaseReceiptRepository _purchaseReceiptRepository;
        private readonly IPurchaseReceiptDetailRepository _purchaseReceiptDetailRepository;
        private readonly IWaitArrivalRepository _waitArrivalRepository;
        public PurchaseReceiptTests() {

            IUnitOfWork uow = new NHUnitOfWork();
            this._purchaseReceiptRepository = new PurchaseReceiptRepository(uow);
            this._purchaseReceiptDetailRepository = new PurchaseReceiptDetailRepository(uow);
            this._waitArrivalRepository = new WaitArrivalRepository(uow);
        }
       
        [TestMethod]
        public void GetPurchaseReceipt() {

            IEnumerable<PurchaseReceipt> model = this._purchaseReceiptRepository.FindAll();
        }


        [TestMethod]
        public void GetPurchaseReceiptDetail() {

            IEnumerable<PurchaseReceiptDetail> model = this._purchaseReceiptDetailRepository.FindAll();
        }


        [TestMethod]
        public void GetWaitArrival() {

            IEnumerable<WaitArrival> model = this._waitArrivalRepository.FindAll();
        }

    }
}
