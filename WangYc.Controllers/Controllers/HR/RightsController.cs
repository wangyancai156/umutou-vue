﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using WangYc.Services.Interfaces.HR;
using WangYc.Services.Messaging.HR;
using WangYc.Services.ViewModels.HR;

namespace WangYc.Controllers.Controllers.HR {

    public class RightsController : BaseController {

        private readonly IRightsService _rightsService;
        public RightsController(IRightsService rightsService) {

            this._rightsService = rightsService;
        }

        public ActionResult Index() {

            return View();
        }

        /// <summary>获取权限列表
        /// </summary>
        /// <returns></returns>
        public JsonResult GetRights() {

            RightsView rights = this._rightsService.GetRightsView(0);
            return Json(rights, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddRightsChild(string id, string name, string url, string description, string isshow) {

           
            RightsView rights = this._rightsService.AddRights(null);
            return Json(rights, JsonRequestBehavior.AllowGet);
        }

        /// <summary>删除组织
        /// 删除组织
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public JsonResult DeleteRights(int id) {

            this._rightsService.DeleteRights(id);
            return Json("", JsonRequestBehavior.AllowGet);
        }
        /// <summary>修改组织
        /// 修改组织
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <param name="description"></param>
        /// <returns></returns>
        public JsonResult UpdateRights(AddRightsRequest request) {
         
            RightsView rights = this._rightsService.UpdateRights(request);
            return Json(rights, JsonRequestBehavior.AllowGet);
        }



    }
}
