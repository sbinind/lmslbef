<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="Web_based_Learning_System.RegisterUser" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Register</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="bootstrap/css/style.css" rel="stylesheet" />

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="fontawesome/css/all.css" rel="stylesheet" />
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
</head>
<body>
	<style>
		.user_card {
			height: 550px;
			width: 350px;
			margin-top: auto;
			margin-bottom: auto;
			background: #f39c12;
			position: relative;
			display: flex;
			justify-content: center;
			flex-direction: column;
			padding: 10px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-moz-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			border-radius: 5px;
			overflow:hidden;

		}
		.brand_logo_container {
			position: absolute;
			height: 170px;
			width: 170px;
			top: -75px;
			border-radius: 50%;
			background: #60a3bc;
			padding: 10px;
			text-align: center;
			display:flex;
			align-items:center;
			justify-content:center;
			color:#Fff;
			font-size:32px;
			font-weight:700;
		}
		.brand_logo {
			height: 150px;
			width: 150px;
			border-radius: 50%;
			border: 2px solid white;
		}
		.form_container {
			margin-top: 100px;
		}
		.login_btn {
			width: 100%;
			background: #c0392b !important;
			color: white !important;
		}
		.login_btn:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}
		.login_container {
			padding: 0 2rem;
		}
		.input-group-text {
			background: #c0392b !important;
			color: white !important;
			border: 0 !important;
			border-radius: 0.25rem 0 0 0.25rem !important;
		}
		.input_user,
		.input_pass:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}
		.custom-checkbox .custom-control-input:checked~.custom-control-label::before {
			background-color: #c0392b !important;
		}
	</style>
    <form id="form1" runat="server">

        <div class="vh-100" style="background:url('images/bg.png');background-repeat:no-repeat;background-size:cover">
			<div class="d-flex justify-content-center h-100">
				<div class="user_card">
					<div class="d-flex justify-content-center">
						<div class="brand_logo_container" style="background:url('images/bg.png');background-repeat:no-repeat;background-size:cover">
							<span class="mt-4 fs-3 text-lg">Register</span>
						</div>
					</div>
					<div class="form_container">
						<form>
							<div class="input-group mb-3">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name" style="width:auto"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required !" ForeColor="Red" BackColor="White" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>

							</div>
							<div class="input-group mb-2">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
									<asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email ID" TextMode="Email" style="width:auto"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required" ForeColor="Red" BackColor="White" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
							</div>
							<div class="input-group mb-2">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<asp:TextBox class="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" style="width:auto"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required !!" ForeColor="Red" BackColor="White" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
							</div>
							<div class="input-group mb-2">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<asp:TextBox class="form-control" ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password" style="width:auto"></asp:TextBox>
								<asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Password do not match !!" ForeColor="Red" BackColor="White" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
							</div>
							<div class="d-flex justify-content-center mt-3 login_container">
 								<asp:Button class="btn btn-primary btn-block rounded-pill" ID="btnLogin" runat="server" Text="Register" OnClick="btnSignUp_Click" />
							</div>
						</form>
					</div>

					<div class="mt-4">
						<div class="d-flex justify-content-center links">
							Already have an account? <a href="/LoginUser.aspx" class="ml-2">Login</a>
						</div>
						<div class="d-flex justify-content-center links">
							<a href="/Home.aspx">Go to Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
    </form>
</body>
</html>
