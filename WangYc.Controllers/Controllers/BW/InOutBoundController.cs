﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using WangYc.Models.HR;
using System.Web.Mvc;

using WangYc.Services.Implementations.BW;
using WangYc.Services.ViewModels.BW;
using WangYc.Services.Interfaces.BW;
using WangYc.Services.Messaging.BW;
using WangYc.Services.ViewModels;
using WangYc.Models.BW;
using WangYc.Services.Interfaces.SD;
using WangYc.Services.ViewModels.SD;
using WangYc.Core.Infrastructure.CookieStorage;

namespace WangYc.Controllers.Controllers.BW {
    public class InOutBoundController : BaseController {

        private readonly IInOutBoundService _inOutBoundService;
        private readonly IProductService _productService;
        private readonly IWarehouseService _warehouseService;
        private readonly IWarehouseShelfService _warehouseShelfService;
        private readonly IArrivalNoticeService _purchaseNoticeService;
        public InOutBoundController(
                IInOutBoundService inOutBoundService,
                IProductService productService,
                IWarehouseService warehouseService,
                IWarehouseShelfService warehouseShelfService,
            IArrivalNoticeService arrivalNoticeDetailService
        ) {

            this._inOutBoundService = inOutBoundService;
            this._productService = productService;
            this._warehouseService = warehouseService;
            this._warehouseShelfService = warehouseShelfService;
            this._purchaseNoticeService = arrivalNoticeDetailService;
        }

        public ActionResult Index() {

            //获取 完整url （协议名+域名+虚拟目录名+文件名+参数） 
            string url = Request.Url.ToString();
            //获取 虚拟目录名+页面名+参数：
            string url2 = Request.RawUrl;
            //获取 虚拟目录名+页面名：
            string url3 = Request.Url.AbsolutePath;
            return View();
        }


        public ActionResult Test() {
            return View();
        }


        /// <summary>
        /// 获取库房
        /// </summary>
        /// <returns></returns>
        public JsonResult GetWarehouse() {

            IEnumerable<WarehouseView> model = this._warehouseService.GetWarehouseViewByAll();
            return Json(model, JsonRequestBehavior.AllowGet);
        }
        /// <summary>
        /// 获取库房货架
        /// </summary>
        /// <param name="warehoseId"></param>
        /// <returns></returns>
        public JsonResult GetWarehouseShelf(int warehoseId) {

            IEnumerable<WarehouseShelfView> model = this._warehouseShelfService.GetWarehouseShelfView(warehoseId);
            return Json(model, JsonRequestBehavior.AllowGet);
        }
        /// <summary>
        /// 获取产品
        /// </summary>
        /// <returns></returns>
        public JsonResult GetProduct(string name) {

            IEnumerable<ProductView> model = this._productService.GetProductViewByName(name);
            return Json(model, JsonRequestBehavior.AllowGet);
        }


        /// <summary>
        ///  获取现货库存（分页方法）
        /// </summary>
        /// <param name="pageModel"></param>
        /// <returns></returns>
        public JsonResult GetPageList(int pageIndex, int pageSize, int? productid) {
            var datalist = _inOutBoundService.GetSpotInventoryPageList(pageIndex, pageSize, productid);
            return Json(datalist, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 入库
        /// </summary>
        /// <returns></returns>
        public JsonResult AddInBound(AddInBoundRequest request) {

            this._inOutBoundService.AddInBound(request);
            return Json("入库成功", JsonRequestBehavior.AllowGet);

        }

        /// <summary>
        /// 出库
        /// </summary>
        /// <returns></returns>
        public JsonResult AddOutBound(AddOutBoundRequest request) {

            this._inOutBoundService.AddOutBound(request);
            return Json("出库成功", JsonRequestBehavior.AllowGet);

        }


        public ActionResult Inventory() {

            return View();
        }



    }
}
