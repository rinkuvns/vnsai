<%@page import="com.beans.user.UserTabAccess"%>
<%@page import="java.util.List"%>
<%@page import="api.daoImpl.Smpp_DaoImpl"%>
<%@page import="com.cons.files.CommonCons"%>
<%
	String uri = request.getRequestURI();
	String pageName = uri.substring(uri.lastIndexOf("/") + 1);
	//System.out.println("===========>"+session.getAttribute("token"));
	if (session.getAttribute("token") != null) {
		Smpp_DaoImpl navSmppDaoImpl=new Smpp_DaoImpl();
		List<UserTabAccess> tabList = navSmppDaoImpl
				.userTabAccessByUserId(String.valueOf(session.getAttribute("id")),String.valueOf(session.getAttribute("type")));
		int checkNav=navSmppDaoImpl.checkTabNameAccess(tabList,pageName);
		if(checkNav==1){
%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<div
		class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
		<a class="sidebar-brand brand-logo" href="index"><img
			src="assets/images/logo.png" alt="logo" /></a> <a
			class="sidebar-brand brand-logo-mini" href="index"><img
			src="assets/images/logo.png" alt="logo" /></a>
	</div>
	<ul class="nav">
		<li class="nav-item profile">
			<div class="profile-desc">
				<div class="profile-pic">
					<div class="count-indicator">
						<img class="img-xs rounded-circle "
							src="<%=CommonCons.imageUrl%><%=session.getAttribute("image")%>"
							onerror="this.src='assets/images/faces/face15.jpg'" alt="">
						<span class="count bg-success"></span>
					</div>
					<div class="profile-name">
						<h5 class="mb-0 font-weight-normal"><%=session.getAttribute("name")%></h5>
						<span><%=session.getAttribute("type")%></span>
					</div>
				</div>
				<a href="#" id="profile-dropdown" data-toggle="dropdown"><i
					class="mdi mdi-dots-vertical"></i></a>
				<div
					class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list"
					aria-labelledby="profile-dropdown">
					<a href="userProfile" class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-settings text-primary"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">Account
								settings</p>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="userChangePass" class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-onepassword  text-info"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">Change
								Password</p>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item preview-item"
						style="display: none;">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-calendar-today text-success"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">To-do
								list</p>
						</div>
					</a>
				</div>
			</div>
		</li>
		<li class="nav-item nav-category"><span class="nav-link">Navigation</span>
		</li>
		<li class="nav-item menu-items"><a class="nav-link" href="index">
				<span class="menu-icon"> <i class="mdi mdi-speedometer"></i>
			</span> <span class="menu-title">Dashboard</span>
		</a></li>
		<li class="nav-item menu-items" id="collapse_user"
			<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_user")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-user"
			aria-expanded="false" aria-controls="ui-basic-user"> <span
				class="menu-icon"> <i class="mdi mdi-account-multiple"></i>
			</span> <span class="menu-title">User</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-user">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "userTabAccess")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="userTabAccess">User Tabs</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "user")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="user">User</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item menu-items" id="collapse_traffic_report"
			<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_traffic_report")==0){%>
			style="display: none;" <%} %>><a class="nav-link"
			data-toggle="collapse" href="#ui-basic" aria-expanded="false"
			aria-controls="ui-basic"> <span class="menu-icon"> <i
					class="mdi mdi-traffic-light"></i>
			</span> <span class="menu-title">Traffic Report</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
						<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "subDlrReport")==0){%>
						style="display: none;" <%} %>><a class="nav-link"
						href="subDlrReport">All Report</a></li>
					<li class="nav-item"
						<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "subDlrReportTeamB")==0){%>
						style="display: none;" <%} %>><a class="nav-link"
						href="subDlrReportTeamB">Team-B Report</a></li>
					<li class="nav-item"
						<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "zoneSubDrlReport")==0){%>
						style="display: none;" <%} %>><a class="nav-link"
						href="zoneSubDrlReport">BSNL Report</a></li>
					<li class="nav-item"
						<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "zoneSubDrlReportBilling")==0){%>
						style="display: none;" <%} %>><a class="nav-link"
						href="zoneSubDrlReportBilling">BSNL Report Billing</a></li>
					<li class="nav-item" style="display: none;"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "userDlrReport")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="userDlrReport">User
							Dlr Report</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "setupBilling")==0){%>
						style="display: none;" <%} %>
						><a class="nav-link"
						href="setupBilling">Date Wise Traffic</a></li>
					<li class="nav-item"
						<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "senderIDTraffic")==0){%>
						style="display: none;" <%} %>><a class="nav-link"
						href="senderIDTraffic">Sender ID Traffic</a></li>
					<li class="nav-item"
						<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "backupTraffic")==0){%>
						style="display: none;" <%} %>><a class="nav-link"
						href="backupTraffic">DB Backup Traffic</a></li>
				</ul>
			</div></li>
		<li class="nav-item menu-items"
		<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "tps")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link" href="tps">
				<span class="menu-icon"> <i class="mdi mdi-camera-timer"></i>
			</span> <span class="menu-title">TPS</span>
		</a></li>
		<li class="nav-item menu-items"
		<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "lastEntry")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			href="lastEntry"> <span class="menu-icon"> <i
					class="mdi mdi-page-last"></i>
			</span> <span class="menu-title">Last Entry</span>
		</a></li>
		<li class="nav-item menu-items" id="collapse_report"
			<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_report")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-report"
			aria-expanded="false" aria-controls="ui-basic-report"> <span
				class="menu-icon"> <i class="mdi mdi-file-find"></i>
			</span> <span class="menu-title">Report</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-report">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "bsnlMisReport")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="bsnlMisReport">BSNL MIS REPORT</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "allTrafficReport")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="allTrafficReport">All Traffic Report</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "smppSMSCReconReport")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="smppSMSCReconReport">SMPP Recon Report</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "compareApiBSNLToSMSCLINK")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="compareApiBSNLToSMSCLINK">Compare Smsc and Api</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "checkBsnlMisDataByTab")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="checkBsnlMisDataByTab">Check BSNL Mis Tab</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "compareUserSummaryToBilling")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="compareUserSummaryToBilling">Compare Summary To Billing</a></li>
					
				</ul>
			</div>
		</li>
		<li class="nav-item menu-items" id="collapse_analysis"
			<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_analysis")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-analysis"
			aria-expanded="false" aria-controls="ui-basic-analysis"> <span
				class="menu-icon"> <i class="mdi mdi-file-find"></i>
			</span> <span class="menu-title">Analysis</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-analysis">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "gatewayAnalysis")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="gatewayAnalysis">GateWay Analysis</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "trafficAnalysis")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="trafficAnalysis">Traffic Analysis</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "trafficAnalysisTeamB")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="trafficAnalysisTeamB">Traffic Analysis TeamB</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "sbta")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="sbta">System
							Based Traffic Analysis</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item menu-items" id="collapse_check"
		<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_check")==0){%>
						style="display: none;" <%} %>
		><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-check" aria-expanded="false"
			aria-controls="ui-basic-check"> <span class="menu-icon"> <i
					class="mdi mdi-bookmark-check"></i>
			</span> <span class="menu-title">Check</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-check">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "totalCompareToBackupSetup")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="totalCompareToBackupSetup">Compare Setup to Server 175</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item menu-items" id="collapse_logs"
		<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_logs")==0){%>
						style="display: none;" <%} %>
		><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-logs" aria-expanded="false"
			aria-controls="ui-basic-logs"> <span class="menu-icon"> <i
					class="mdi mdi-message-text"></i>
			</span> <span class="menu-title">Logs</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-logs">
				<ul class="nav flex-column sub-menu">
					
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "msgLogs")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="msgLogs">
							MSG Logs</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "backupLogs175")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="backupLogs175">
							Backup MSG Logs 175</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item menu-items" id="collapse_gateway"
		<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_gateway")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-gateway" aria-expanded="false"
			aria-controls="ui-basic-gateway"> <span class="menu-icon">
					<i class="mdi mdi-glassdoor"></i>
			</span> <span class="menu-title">Gateway</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-gateway">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "gatewayDetails")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="gatewayDetails">Gateway
							Details</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "gatewayBased")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="gatewayBased">Gateway
							Based</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item menu-items" id="collapse_account"
		<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_account")==0){%>
						style="display: none;" <%} %>
		><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-account" aria-expanded="false"
			aria-controls="ui-basic-account"> <span class="menu-icon">
					<i class="mdi mdi-account-switch"></i>
			</span> <span class="menu-title">Account</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-account">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "accountDetails")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="accountDetails">Account
							Details</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "teamBAccount")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="teamBAccount">Team
							B Account</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "zoneAccount")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="zoneAccount">Zone
							Account</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "clientAccDetails")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="clientAccDetails">Full Account Details</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "setupAccDetails")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="setupAccDetails">My Setup Acc Details</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "apiRecord")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="apiRecord">Api Details</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "routeToSetup")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link"
						href="routeToSetup">Route-2-Setup</a></li>
				</ul>
			</div></li>
		<li class="nav-item menu-items" id="collapse_stats_current_day"
		<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_stats_current_day")==0){%>
						style="display: none;" <%} %>
		><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-stats_current_day"
			aria-expanded="false" aria-controls="ui-basic-stats_current_day">
				<span class="menu-icon"> <i class="mdi mdi-calendar-today"></i>
			</span> <span class="menu-title">Stats Current Day</span> <i
				class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-stats_current_day">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "errorWiseSMSC")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="errorWiseSMSC">Error
							Wise SMSC</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "owsscd")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="owsscd">Operator
							Wise SMSC</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item menu-items"
		<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "lrn")==0){%>
						style="display: none;" <%} %>
		><a class="nav-link" href="lrn">
				<span class="menu-icon"> <i class="mdi mdi-qqchat"></i>
			</span> <span class="menu-title">LRN</span>
		</a></li>
		<li class="nav-item menu-items"
		<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "allLink")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link" href="allLink">
				<span class="menu-icon"> <i class="mdi mdi-cellphone-link"></i>
			</span> <span class="menu-title">All Links</span>
		</a></li>
		<li class="nav-item menu-items"
		<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "mailTemplate")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			href="mailTemplate"> <span class="menu-icon"> <i
					class="mdi mdi-email"></i>
			</span> <span class="menu-title">Mail Template</span>
		</a></li>
		
		<li class="nav-item menu-items" id="collapse_error"
		<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_error")==0){%>
						style="display: none;" <%} %>
		><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-error" aria-expanded="false"
			aria-controls="ui-basic-error"> <span class="menu-icon"> <i
					class="mdi mdi-alert"></i>
			</span> <span class="menu-title">Error</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-error">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "error")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="error">Error
							Details</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "senderIdError")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="senderIdError"
						>Sender Wise Error</a></li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "bsnlGobalErrorCount")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="bsnlGobalErrorCount"
						>BSNL Error Code</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item menu-items" id="collapse_ucc"
		<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_ucc")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-ucc" aria-expanded="false"
			aria-controls="ui-basic-ucc"> <span class="menu-icon"> <i
					class="mdi mdi-file-excel"></i>
			</span> <span class="menu-title">UCC</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-ucc">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "UccNoUpload")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="UccNoUpload">Ucc
							No.</a></li>
				</ul>
				
			</div>
		</li>
		<li class="nav-item menu-items"
		<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "setupSubDel")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			href="setupSubDel"> <span class="menu-icon"> <i
					class="mdi mdi-timelapse"></i>
			</span> <span class="menu-title">Setup Delay Sub</span>
		</a></li>
		
		<li class="nav-item menu-items" id="collapse_nrju"
		<%if(navSmppDaoImpl.checkCollapseAccess(tabList, "collapse_nrju")==0){%>
						style="display: none;" <%} %>
			><a class="nav-link"
			data-toggle="collapse" href="#ui-basic-nrju" aria-expanded="false"
			aria-controls="ui-basic-nrju"> <span class="menu-icon"> <i
					class="mdi mdi-camera-front-variant"></i>
			</span> <span class="menu-title">NRJU</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic-nrju">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "clientLogs")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="clientLogs">Clients Logs</a>
					</li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "mailIssue")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="mailIssue">Mail Issue</a>
					</li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "linkInfo")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="linkInfo">Links & Info</a>
					</li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "uccLogs")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="uccLogs">Ucc Logs</a>
					</li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "bulkError")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="bulkError">Bulk Error</a>
					</li>
					<li class="nav-item"
					<%if(navSmppDaoImpl.checkTabNameAccess(tabList, "graph")==0){%>
						style="display: none;" <%} %>
					><a class="nav-link" href="graph">Graph</a>
					</li>
				</ul>
			</div>
		</li>
	</ul>
	
</nav>
<%
		}else{
			session.setAttribute("status", "555");
			response.sendRedirect("notPageAccess");
			
		}
		}else{
			 response.sendRedirect("login?status=5&pageName="+pageName);
   }%>