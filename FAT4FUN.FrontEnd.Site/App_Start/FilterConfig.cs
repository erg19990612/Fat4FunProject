﻿using System.Web;
using System.Web.Mvc;

namespace FAT4FUN.FrontEnd.Site
{
	public class FilterConfig
	{
		public static void RegisterGlobalFilters(GlobalFilterCollection filters)
		{
			filters.Add(new HandleErrorAttribute());
		}
	}
}
