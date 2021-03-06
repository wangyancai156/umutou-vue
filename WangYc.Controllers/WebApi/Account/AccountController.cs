﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Web.Http;
using System.Web.Script.Serialization;
using WangYc.Controllers.Account.WebApi;
using WangYc.Core.Infrastructure.CookieStorage;
using WangYc.Services.Interfaces.Account;
using WangYc.Services.Interfaces.HR;
using WangYc.Services.ViewModels;
using WangYc.Services.ViewModels.Account;
using WangYc.Services.ViewModels.HR;

namespace WangYc.Controllers.WebApi.Account {

    [AllowAnonymous]
    public class AccountController : ApiController {

        private readonly IUsersService _usersService;
        private readonly ICookieStorageService _cookieStorageService;
        private readonly IAuthenticationService _authenticationService;
        private readonly IUserDeviceService _serDeviceService;
        private readonly IRightsService _rightsService;


        public AccountController(
            IUsersService usersService,
            ICookieStorageService cookieStorageService,
            IAuthenticationService authenticationService,
            IUserDeviceService serDeviceService,
            IRightsService rightsService
        ) {

            this._usersService = usersService;
            this._cookieStorageService = cookieStorageService;
            this._authenticationService = authenticationService;
            this._serDeviceService = serDeviceService;
            this._rightsService = rightsService;
        }

        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="domainName">域名</param>
        /// <param name="userName">用户名</param>
        /// <param name="password">密码</param>
        /// <param name="vcode">验证码</param>
        /// <param name="returnUrl">请求页面</param>
        /// <returns></returns>
        [System.Web.Http.HttpGet]
        public HttpResponseMessage Login(string LoginName, string PassWord) {
            LoginName = LoginName.ToUpper();
            AccountView account = new AccountView();
            if (string.IsNullOrWhiteSpace(LoginName)) {
                account.code = 401;
                account.message = "请输入用户名！";
            }
            if (string.IsNullOrWhiteSpace(PassWord)) {
                account.code = 401;
                account.message = "密码错误！";
            }

            UsersView user = this._usersService.FindUsersBy(LoginName);
            if (user != null) {

                if (user.UserPwd == PassWord) {
                    user.Menu = this._rightsService.GetMenuView(user.Id);
                    string strSource = LoginName + "|" + PassWord + Guid.NewGuid();
                    //获取密文字节数组
                    string token = Encode(strSource);

                    UserDeviceView existsDevice = this._serDeviceService.GetUserDeviceView(LoginName, "win", token);

                    if (existsDevice == null) {
                        this._serDeviceService.CrateUserDevice(LoginName, "win", token);

                    } else {
                        this._serDeviceService.UpdateUserDevice(LoginName, "win", token);
                    }

                    account.code = 200;
                    account.message = "Success！";
                    account.token = token;
                    account.tokenHead = "bearer ";
                    account.User = user;

                } else {
                    account.code = 401;
                    account.message = "密码错误！";
                }

            } else {

                account.code = 401;
                account.message = "用户名错误！";
            }
            return ToJson(account);
        }

        /// <summary>
        /// 验证
        /// </summary>
        /// <param name="UserId"></param>
        /// <param name="Userkey"></param>
        /// <returns></returns>
        [System.Web.Http.HttpGet]
        public HttpResponseMessage Verification(string UserId, string Userkey) {

            bool result = AuthenticationFactory.Authentication().ApiVerification(UserId, Userkey);
            return ToJson(result);
        }

        public HttpResponseMessage ToJson(Object obj) {
            String str;
            if (obj is String || obj is Char) {
                str = obj.ToString();
            } else {
                var serializer = new JavaScriptSerializer();
                str = serializer.Serialize(obj);
            }
            var result = new HttpResponseMessage { Content = new StringContent(str, Encoding.GetEncoding("UTF-8"), "application/json") };
            return result;
        }

        public static string _KEY = "HQDCKEY1";  //密钥  
        public static string _IV = "HQDCKEY2";   //向量  
        public static string Encode(string data) {

            byte[] byKey = System.Text.ASCIIEncoding.ASCII.GetBytes(_KEY);
            byte[] byIV = System.Text.ASCIIEncoding.ASCII.GetBytes(_IV);

            DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
            int i = cryptoProvider.KeySize;
            MemoryStream ms = new MemoryStream();
            CryptoStream cst = new CryptoStream(ms, cryptoProvider.CreateEncryptor(byKey, byIV), CryptoStreamMode.Write);
            StreamWriter sw = new StreamWriter(cst);
            sw.Write(data);
            sw.Flush();
            cst.FlushFinalBlock();
            sw.Flush();
            string strRet = Convert.ToBase64String(ms.GetBuffer(), 0, (int)ms.Length);
            return strRet;
        }

        public static string Decode(string data) {

            byte[] byKey = System.Text.ASCIIEncoding.ASCII.GetBytes(_KEY);
            byte[] byIV = System.Text.ASCIIEncoding.ASCII.GetBytes(_IV);

            byte[] byEnc;

            try {
                data.Replace("_%_", "/");
                data.Replace("-%-", "#");
                byEnc = Convert.FromBase64String(data);

            } catch {
                return null;
            }

            DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
            MemoryStream ms = new MemoryStream(byEnc);
            CryptoStream cst = new CryptoStream(ms, cryptoProvider.CreateDecryptor(byKey, byIV), CryptoStreamMode.Read);
            StreamReader sr = new StreamReader(cst);
            return sr.ReadToEnd();
        }
    }
}
