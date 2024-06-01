
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `admin_documents`
--
DROP TABLE IF EXISTS `admin_documents`;
CREATE TABLE `admin_documents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_enabled` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `admin_notification`
--

CREATE TABLE `admin_notification` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `user_id` varchar(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `car_model`
--

DROP TABLE IF EXISTS `car_model`;
CREATE TABLE `car_model` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brand_id` varchar(255) NOT NULL,
  `vehicle_type_id` varchar(255) NOT NULL,
  `status` varchar(5) NOT NULL,
  `created_at` varchar(25) NOT NULL,
  `modifier` varchar(25) DEFAULT NULL,
  `updated_at` varchar(25) DEFAULT NULL,
  `deleted_at` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `delivery_charges`
--

DROP TABLE IF EXISTS `delivery_charges`;
CREATE TABLE `delivery_charges` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_vehicle_type` varchar(255) DEFAULT NULL,
  `delivery_charges_per_km` varchar(255) DEFAULT NULL,
  `minimum_delivery_charges` varchar(255) DEFAULT NULL,
  `minimum_delivery_charges_within_km` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `dispatcher_user`
--

DROP TABLE IF EXISTS `dispatcher_user`;
CREATE TABLE `dispatcher_user` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(21) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  `profile_picture` text,
  `profile_picture_path` text,
  `remember_token` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `driver_document`
--

DROP TABLE IF EXISTS `driver_document`;
CREATE TABLE `driver_document` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `driver_id` varchar(255) NOT NULL,
  `document_id` varchar(255) NOT NULL,
  `document_path` varchar(255) NOT NULL,
  `document_status` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `send_to_admin` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `type`, `subject`, `message`, `send_to_admin`, `created_at`, `updated_at`) VALUES
(1, 'payment_receipt', 'Payment Receipt - {AppName}', '<div width=\"100%\" style=\"padding: 0px; font-family: arial; line-height: 28px; height: 100%; width: 100%;\">\r\n    <div style=\"max-width: 700px; margin: 30px; font-size: 14px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n        <span style=\"font-size: 14px;\">﻿</span><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255); width: 100%; margin-bottom: 20px;\">\r\n            <tbody>\r\n            <tr>\r\n                <td>\r\n                    <img src=\"https://cabme-landing.siswebapp.com/img/logo_header.png\" alt=\"CabMe\" style=\"border:none\" width=\"15%\">\r\n                </td>\r\n            </tr>\r\n            </tbody>\r\n        </table>\r\n        <h3 style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Payment Receipt </b></h3><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px;\">Hello Mr./Mrs {UserName}</span></p><u style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 0);\"><b><span style=\"font-size: 18px;\">Details of your payment receipt:</span></b></u><br><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Distance:</b> {Distance}</p><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Duration:</b> {Duree}</p><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Sub Total:</b> {Subtotal}</p><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Discount:</b> {Discount}</p><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Tax:</b> {Tax}</p><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Driver Tip:</b> {Tip}</p><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Total:</b> {Total}</p><p style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255);\"><b>Date:</b> {Date}</p><br><p style=\"\"><b style=\"\"><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Regards {AppName}</font></b></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"color: rgb(81, 77, 106); background-color: rgb(255, 255, 255); width: 100%;\">\r\n            <tbody>\r\n            <tr>\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n            </tr>\r\n            </tbody>\r\n        </table>\r\n    </div>\r\n</div>', 'false', '2023-08-03 04:09:00', '2023-08-04 14:28:04'),
(2, 'wallet_topup', 'Wallet Topup Confirmation', '<div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Dear {UserName},</font></b></div><div>We are writing to confirm that your wallet has been successfully topped up with {Amount} on {Date}.</div><div><br></div><div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Transaction Details:</font></b></div><div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Date: {Date}</font></b></div><div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Amount: {Amount}</font></b></div><div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Payment Method: {PaymentMethod}</font></b></div><div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Transaction ID: {TransactionId}</font></b></div><div><br></div><div>Your updated wallet balance is now {Balance}. This balance can be used to conveniently and securely pay for your next ride.</div><div><br></div><div>As always, we strive to provide you with the best user experience, and your feedback is valuable to us. We look forward to continuing to serve you and making your experience with us even better.</div><div><br></div><div>Thank you once again for choosing&nbsp;<span style=\"font-weight: bolder;\"><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">{AppName}</font></span>. We appreciate your continued support.</div><div><br></div><div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Best regards,</font></b></div><div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\"><br></font></b></div><div><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">{AppName}<br><br></font></b></div>', 'false', '2023-08-04 04:02:29', '2023-08-04 09:52:18'),
(3, 'payout_approve_disapprove', 'Payout Request Status -{RequestId}', '<p><span style=\"background-color: rgb(255, 255, 0);\">Dear {UserName},</span></p><p><span style=\"font-size: 1rem;\">I hope this email finds you well. We would like to inform you about the status of your recent payout request with the Request ID {RequestId}.</span><br></p><p><span style=\"font-size: 1rem;\">We are pleased to inform you that your payout request has been {Status}. The requested amount will be processed and transferred to your designated account within short time. Please note that the processing time may vary depending on your financial institution.</span><br></p><p><span style=\"font-size: 1rem; background-color: rgb(255, 255, 0);\">Here are the details of your {Status} payout:</span><br></p><p><span style=\"background-color: rgb(255, 255, 0);\"><span style=\"font-size: 1rem;\">Request ID: {RequestId}<br></span><span style=\"font-size: 1rem;\">Amount: {Amount}</span><span style=\"font-size: 1rem;\"><br></span></span><span style=\"color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(255, 255, 0);\">Date: {Date}</span></p><p><span style=\"font-size: 1rem;\">Alternatively, in the unlikely event that your payout request has been disapproved, we regret to inform you that the request cannot be fulfilled at this time. The reasons for disapproval may include, but are not limited to, incomplete or incorrect information provided, failure to meet eligibility criteria, or violation of our platforms terms of service.</span><br></p><p><span style=\"font-size: 1rem;\">If you believe there might have been a misunderstanding or you would like to discuss the matter further, kindly get in touch with our support team, and we will be happy to assist you.</span><br></p><p><span style=\"font-size: 1rem;\">We value your partnership with us, and our team is always here to help. We look forward to continued success together.</span><br></p><p><span style=\"font-size: 1rem;\">Thank you for being a part of our community.</span><br></p><p><span style=\"background-color: rgb(255, 255, 0);\"><span style=\"font-size: 1rem;\"><br>Best regards,</span><br></span></p><p><span style=\"background-color: rgb(255, 255, 0);\">{AppName}</span></p>', 'false', '2023-08-04 04:03:43', '2023-08-04 10:49:57'),
(4, 'payout_request', 'Payout Request - {PayoutRequestId}', '<div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve; background-color: rgb(255, 255, 0);\">Hi {AppName},</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\"><br></span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\">I hope this email finds you well. I am writing to request a payout for {UserName}&nbsp; account with ID number {UserId}.&nbsp;</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\"><br></span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\">Below are the details of my payout request:</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\"><br></span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve; background-color: rgb(255, 255, 0);\">Account ID: {UserId}</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve; background-color: rgb(255, 255, 0);\">Amount Requested:{Amount}</span></font></div><div><span style=\"white-space-collapse: preserve; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem; background-color: rgb(255, 255, 0);\">Payment Account ID: {PayoutRequestId}\r\n</span><div><span style=\"white-space-collapse: preserve; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem; background-color: rgb(255, 255, 0);\">Date: {Date}</span><br></div></div><div><span style=\"white-space-collapse: preserve; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem; background-color: rgb(255, 255, 0);\"><br></span></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\"><br></span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\">I would be grateful if you could process my payout request at your earliest convenience. If there are any delays or issues with my request, please inform me as soon as possible so that I can take appropriate action if needed.</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\"><br></span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\">Thank you for your attention to this matter. I truly value the partnership we have, and I look forward to your prompt response.</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\"><br></span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\">If you require any further information or have any questions, please do not hesitate to reach out to me.</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve;\"><br></span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve; background-color: rgb(255, 255, 0);\">Best regards,</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve; background-color: rgb(255, 255, 0);\"><br></span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve; background-color: rgb(255, 255, 0);\">{UserName}</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve; background-color: rgb(255, 255, 0);\">{UserContactInfo}</span></font></div><div><font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space-collapse: preserve; background-color: rgb(255, 255, 0);\">{AppName}</span></font></div>', 'true', '2023-08-04 04:06:28', '2023-08-04 12:12:01'),
(5, 'new_registration', 'New Driver Registration', '<p style=\"margin-bottom: 1rem;\"><span style=\"background-color: rgb(255, 255, 0);\">Hi {AppName},</span></p><p style=\"margin-bottom: 1rem;\"><span style=\"font-size: 1rem;\">I hope this email finds you well. I am writing to inform you about a new user registration on our platform. We are excited to welcome a new member to our community!</span><br></p><p style=\"margin-bottom: 1rem;\"><span style=\"font-size: 1rem;\">Below are the details of the new vendor:</span><br></p><p style=\"margin-bottom: 1rem;\"><span style=\"background-color: rgb(255, 255, 0);\">Account ID: {UserId}<br><span style=\"font-size: 1rem;\">Name: {UserName}<br></span><span style=\"font-size: 1rem;\">Email Address: {UserEmail}<br></span></span><span style=\"background-color: rgb(255, 255, 0); font-size: 1rem;\">Phone Number: {UserPhone}</span><span style=\"background-color: rgb(255, 255, 0); font-size: 1rem;\"><br></span><span style=\"background-color: rgb(255, 255, 0); font-size: 1rem;\">Date of Registration: {Date}</span></p><p style=\"margin-bottom: 1rem;\">As an administrator, you have the privilege to review and verify the new user\'s details to ensure that they comply with our policies and guidelines. Please take a moment to check the provided information and activate the user\'s account if everything appears to be in order. If you have any concerns or need further information, feel free to reach out to the user directly.</p><p style=\"margin-bottom: 1rem;\">We believe that this new addition will enrich our platform and contribute positively to our growing community. By providing them with a warm welcome and support, we can create a positive experience for both the user and our existing members.</p><p style=\"margin-bottom: 1rem;\">Thank you for your continued dedication to maintaining the integrity and security of our platform.</p><p style=\"margin-bottom: 1rem;\"><br></p><p style=\"margin-bottom: 1rem;\"><span style=\"background-color: rgb(255, 255, 0);\">Best regards,</span></p><p style=\"margin-bottom: 1rem;\"><span style=\"background-color: rgb(255, 255, 0);\">{AppName}</span></p>', 'true', '2023-08-04 11:27:24', '2023-08-04 11:37:19'),
(6, 'reset_password', 'Reset Your Password', '<p><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">Dear {UserName},</font></p><p>We are sending this email because you requested a password reset.</p><p>Please use {OTP} code to reset your password</p><p><br></p>ThankYou', 'false', '2023-08-04 14:00:45', '2023-08-04 14:09:48');

--
-- Table structure for table `failed_jobs`
--
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_templates`
--
DROP TABLE IF EXISTS `landing_page_templates`;
CREATE TABLE `landing_page_templates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `html_template` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `landing_page_templates` (`id`, `html_template`, `created_at`, `updated_at`) VALUES
(1, '<header class="section-header">

	<div class="container">
		<div class="row">
			<div class="main-logo col-md-6">
				<div class="site-logo">
					<a href="https://cabme-landing.siswebapp.com"> <img class="img-fluid" src="https://cabme-landing.siswebapp.com/img/logo_header.png" alt="logo"> </a>
				</div>
			</div>

			<div class="header-right col-md-6 text-right">
				<ul class="menu">
					<li>
						<a href="#our-mission">Our Mission</a>
					</li>
					<li>
						<a href="#how-it-works">How it Works</a>
					</li>
					<li>
						<a href="#mobile-app">Mobile App</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

</header>

<!-- alert: do not change class name -->
<div class="osahan-home-page">

	<div class="home-banner">

		<div class="banner-inner">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-5">
						<div class="homebanner-content">
							<h1>The Best way to get Wherever you’re going</h1>
							<p>
								We will bring you quickly and comfortably to
								anywhere in your city
							</p>
							<div class="ban-btn">
								<a href="#"><img src="https://cabme-landing.siswebapp.com/img/appstore.png"></a>
								<a href="#"><img src="https://cabme-landing.siswebapp.com/img/google_play.png"></a>
							</div>
						</div>
					</div>
					<div class="col-md-7 banner-right">
						<div class="banner-img text-left">
							<img src="https://cabme-landing.siswebapp.com/img/banner-img.png">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="sec-delivery-app pt-5 pb-5" id="our-mission">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 delapp-left">
					<img src="https://cabme-landing.siswebapp.com/img/our-mission.png" alt="Grocery Delivery App">
				</div>
				<div class="col-md-6 delapp-right">
					<div class="delapp-right-cont mb-4">
						<h3>Our Mission
						<br>
						Statment</h3>
						<p>
							The online cab booking service providers care the price of traveling based on the distance of travel trip and type of car, traffic, and waiting prices. There are numerous apps available in the android play store and apple app store for cab booking in India.
						</p>

						<p>
							Selecting the greatest taxi booking apps in India is tough, which may vary from town to town.
						</p>
					</div>

					<div class="delapp-right-cont-btm mt-5">
						<div class="food-icon align-items-center">
							<div class="delapp-right-cont-btm-box">
								<div class="food-icon-inner">
									<span><img src="https://cabme-landing.siswebapp.com/img/surge-free.png" alt="Food Delivery App"></span>
									<h4 class="mt-3">Surge-free Guarantee</h4>
								</div>
							</div>
							<div class="delapp-right-cont-btm-box">
								<div class="food-icon-inner">
									<span><img src="https://cabme-landing.siswebapp.com/img/book-now-latter.png" alt="Food Delivery App"></span>
									<h4 class="mt-3">Book for Now or Later</h4>
								</div>
							</div>
							<div class="delapp-right-cont-btm-box">
								<div class="food-icon-inner">
									<span><img src="https://cabme-landing.siswebapp.com/img/cashless.png" alt="Food Delivery App"></span>
									<h4 class="mt-3">Cashless Payment</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="sec-how-it-work py-7" id="how-it-works">
		<div class="container">
			<div class="row">
				<div class="col-md-12 sec-title text-center mb-5">
					<h2>How it Works</h2>

				</div>
			</div>
			<div class="row howitwork-content">
				<div class="col-md-3">
					<div class="howitwork-block howitwork-block1 text-center">
						<span class="hw-icon"> <img src="https://cabme-landing.siswebapp.com/img/how-it-icon.png" alt="How it work"> </span>
						<div class="hwit-detail mt-5">
							<h3>Book in Juast 2 Tabs</h3>
							<p>
								Cab me in cupide non proident, labore sunt in culpa qui officia.
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="howitwork-block howitwork-block2 text-center">
						<span class="hw-icon"> <img src="https://cabme-landing.siswebapp.com/img/get_driver.png" alt="How it work"> </span>
						<div class="hwit-detail mt-5">
							<h3>Get a Driver</h3>
							<p>
								Get droiver  cupide non proident,  sunt in culpa qui officia.
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="howitwork-block howitwork-block3 text-center">
						<span class="hw-icon"> <img src="https://cabme-landing.siswebapp.com/img/track_driver.png" alt="How it work"> </span>
						<div class="hwit-detail mt-5">
							<h3>Track your Driver</h3>
							<p>
								Track your driver proident, labore sunt in culpa qui officia.
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="howitwork-block howitwork-block4 text-center">
						<span class="hw-icon"> <img src="https://cabme-landing.siswebapp.com/img/arrive_safely.png" alt="How it work"> </span>
						<div class="hwit-detail mt-5">
							<h3>Arrive safely</h3>
							<p>
								Arrive at your place saffely non proident, labore sunt in culpa qui officia.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<section class="sec-get-started py-7" id="mobile-app">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 get-started-left">
					<div class="sec-title mb-3 dark-title">
						<h2>Get a Mobile Application</h2>
					</div>
					<div class="cust-ser-block">
						<p>
							CabMe provides you vast car options through this cab service app. Our taxi services have numerous cars accessible with them through this greatest cab booking app.
						</p>
					</div>
					<div class="row get-started-btm mt-5">
						<div class="col-md-12 d-flex">
							<div class="get-started-icon">
								<span class="get-icon"><img src="https://cabme-landing.siswebapp.com/img/clean_car.png" alt="Get Started"></span>
							</div>
							<div class="get-started-cont">
								<h3>Clean Car</h3>
								<p>
									You can get best quality and clean cars in affordable price.
								</p>
							</div>
						</div>
						<div class="col-md-12 d-flex">
							<div class="get-started-icon">
								<span class="get-icon"><img src="https://cabme-landing.siswebapp.com/img/transp_billing.png" alt="Get Started"></span>
							</div>
							<div class="get-started-cont">
								<h3>Transparent Billing</h3>
								<p>
									This app gives you 100% transparency in billing whether its online or cash.
								</p>
							</div>
						</div>
						<div class="col-md-12 d-flex">
							<div class="get-started-icon">
								<span class="get-icon"><img src="https://cabme-landing.siswebapp.com/img/rerliable_service.png" alt="Get Started"></span>
							</div>
							<div class="get-started-cont">
								<h3>Reliable Service</h3>
								<p>
									Cab services provides very much hassle-free and reliable.
								</p>
							</div>
						</div>
						<div class="col-md-12 d-flex">
							<div class="get-started-icon">
								<span class="get-icon"><img src="https://cabme-landing.siswebapp.com/img/courteous_drivers.png" alt="Get Started"></span>
							</div>
							<div class="get-started-cont">
								<h3>Courteous Drivers</h3>
								<p>
									This app driver is very much Polite and clever of city map.
								</p>
							</div>
						</div>
					</div>
					<div class="ban-btn">
						<a href="#"><img src="https://cabme-landing.siswebapp.com/img/appstore.png"></a>
						<a href="#"><img src="https://cabme-landing.siswebapp.com/img/google_play.png"></a>
					</div>
				</div>

				<div class="col-md-6 get-started-right">
					<div class="get-started-img text-right">
						<img src="https://cabme-landing.siswebapp.com/img/get-mobile-rg.png" alt="Get Started">
					</div>
				</div>

			</div>
		</div>
	</section>

</div>

<footer class="section-footer border-top bg-dark">
	<div class="container">
		<section class="footer-top pb-5 text-center pt-0">
			<div class="ft-logo mb-5">
				<img src="https://cabme-landing.siswebapp.com/img/footer-logo.png" alt="Logo">
			</div>
			<div class="footer-tp-middel d-flex align-items-center mb-5">
				<div class="ft-social">
					<ul>
						<li>
							<a href="#"><img src="https://cabme-landing.siswebapp.com/img/fb_footer.png" alt="facebook"></a>
						</li>
						<li>
							<a href="#"><img src="https://cabme-landing.siswebapp.com/img/twitter_footer.png" alt="twitter"></a>
						</li>
						<li>
							<a href="#"><img src="https://cabme-landing.siswebapp.com/img/insta_footer.png" alt="instagram"></a>
						</li>
						<li>
							<a href="#"><img src="https://cabme-landing.siswebapp.com/img/pentrest_footer.png" alt="pinterest"></a>
						</li>
						<li>
							<a href="#"><img src="https://cabme-landing.siswebapp.com/img/g+_footer.png" alt="google"></a>
						</li>
					</ul>
				</div>
				<div class="ft-app-link ml-3">
					<ul>
						<li>
							<a href="#"><img src="https://cabme-landing.siswebapp.com/img/appstore_footer.png" alt="App Store"></a>
						</li>
						<li>
							<a href="#"><img src="https://cabme-landing.siswebapp.com/img/google_play_footer.png" alt="App Store"></a>
						</li>

					</ul>
				</div>
			</div>
			<div class="footer-tp-bottom">
				<div class="contact-info">
					<ul>
						<li>
							<a href="https://cabme-landing.siswebapp.com/contact-us">CONTACT US</a>
						</li>
						<li>
							<a href="https://cabme-landing.siswebapp.com/about-us">ABOUT US</a>
						</li>

					</ul>
					<ul>
						<li>
							<a href="tel:552532560235"><img src="https://cabme-landing.siswebapp.com/img/call.png" alt="info"> +55 253 2560 235</a>
						</li>
						<li>
							<a href="mailto:info.cabme@gmail.com"><img src="https://cabme-landing.siswebapp.com/img/mail.png" alt="info"> info.cabme@gmail.com</a>
						</li>

					</ul>
				</div>

			</div>

		</section>

		<section class="footer-copyright border-top py-3">
			<div class="container text-center">
				<p class="mb-0">
					© Copyright 2022-2023 Cabme. All rights reserved.
				</p>
				<p class="mb-0"></p>
			</div>
		</section>
	</div>
	<a href="#" id="toTopBtn" class="cd-top text-replace js-cd-top cd-top--is-visible cd-top--fade-out" data-abc="true"></a>
</footer>', '2023-06-16 05:24:09', '2023-06-13 05:24:09');

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `language` varchar(200) NOT NULL,
  `code` varchar(200) NOT NULL,
  `flag` varchar(1200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `is_rtl` varchar(200) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `language`, `code`, `flag`, `status`, `is_rtl`, `creer`, `modifier`, `updated_at`) VALUES
(1, 'English', 'en', 'ic_uk.png', 'true', 'false', '2022-11-16 07:47:35', '2022-11-16 07:47:35', '2022-11-16 07:47:35'),
(2, 'Arabic', 'ar', 'Arabic.png', 'true', 'false', '2022-12-30 11:56:31', '2022-12-30 11:56:31', '2022-12-30 11:56:31');

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_20_103748_create_tj_cms_table', 2),
(6, '2014_10_12_000000_create_landing_page_templates_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `parcel_category`
--

DROP TABLE IF EXISTS `parcel_category`;
CREATE TABLE `parcel_category` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `parcel_orders`
--

DROP TABLE IF EXISTS `parcel_orders`;
CREATE TABLE `parcel_orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user_app` varchar(11) NOT NULL,
  `id_conducteur` varchar(11) DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `lat_source` varchar(30) NOT NULL,
  `lng_source` varchar(30) NOT NULL,
  `lat_destination` varchar(30) NOT NULL,
  `lng_destination` varchar(30) NOT NULL,
  `source_city` varchar(100) NOT NULL,
  `destination_city` varchar(100) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_phone` varchar(15) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `receiver_phone` varchar(15) NOT NULL,
  `parcel_weight` varchar(10) NOT NULL,
  `parcel_dimension` varchar(60) NOT NULL,
  `parcel_image` json NOT NULL,
  `parcel_type` varchar(255) NOT NULL,
  `parcel_date` varchar(30) NOT NULL,
  `parcel_time` varchar(30) NOT NULL,
  `receive_date` varchar(30) NOT NULL,
  `receive_time` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `reason` longtext NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `payment_status` varchar(5) NOT NULL,
  `id_payment_method` varchar(11) NOT NULL,
  `distance` varchar(30) NOT NULL,
  `distance_unit` varchar(10) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `tip` varchar(10) DEFAULT NULL,
  `admin_commission` varchar(10) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `rejected_driver_id` json DEFAULT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--
DROP TABLE IF EXISTS `payment_settings`;
CREATE TABLE `payment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_id` varchar(500) DEFAULT NULL,
  `key` varchar(500) DEFAULT NULL,
  `clientpublishableKey` varchar(500) DEFAULT NULL,
  `secret_key` varchar(500) DEFAULT NULL,
  `merchant_Id` varchar(500) DEFAULT NULL,
  `merchant_key` varchar(500) DEFAULT NULL,
  `public_key` varchar(500) DEFAULT NULL,
  `private_key` varchar(500) DEFAULT NULL,
  `encryption_key` varchar(500) DEFAULT NULL,
  `tokenization_key` varchar(500) DEFAULT NULL,
  `accesstoken` varchar(500) DEFAULT NULL,
  `callback_url` varchar(500) DEFAULT NULL,
  `webhook_url` varchar(500) DEFAULT NULL,
  `cancel_url` varchar(500) DEFAULT NULL,
  `notify_url` varchar(500) DEFAULT NULL,
  `return_url` varchar(500) DEFAULT NULL,
  `isEnabled` varchar(200) NOT NULL,
  `isLive` varchar(200) DEFAULT NULL,
  `isSandboxEnabled` varchar(200) DEFAULT NULL,
  `id_payment_method` varchar(255) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `tax_type` varchar(200) DEFAULT NULL,
  `tax_amount` varchar(200) DEFAULT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `app_id`, `key`, `clientpublishableKey`, `secret_key`, `merchant_Id`, `merchant_key`, `public_key`, `private_key`, `encryption_key`, `tokenization_key`, `accesstoken`, `callback_url`, `webhook_url`, `cancel_url`, `notify_url`, `return_url`, `isEnabled`, `isLive`, `isSandboxEnabled`, `id_payment_method`, `username`, `password`, `tax_type`, `tax_amount`, `creer`, `modifier`, `deleted_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 'true', 10, NULL, NULL, NULL, NULL, '2022-07-11 12:43:30', '2023-01-17 06:52:36', NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, 5, NULL, NULL, NULL, NULL, '2022-07-12 06:58:54', '2023-01-16 06:00:16', NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 'true', 7, NULL, NULL, NULL, NULL, '2022-07-12 06:58:37', '2023-01-16 11:12:44', NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, 9, NULL, NULL, NULL, NULL, '2022-07-12 06:58:43', '2023-01-13 11:22:28', NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 'true', 11, NULL, NULL, NULL, NULL, '2022-07-12 06:56:57', '2023-01-16 11:12:12', NULL),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 'true', 12, NULL, NULL, NULL, NULL, '2022-07-12 06:57:19', '2023-01-16 11:12:29', NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 'true', 13, NULL, NULL, NULL, NULL, '2022-07-12 06:58:19', '2023-01-16 11:13:22', NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 'true', 14, NULL, NULL, NULL, NULL, '2022-07-12 06:58:11', '2023-01-16 11:13:43', NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'false', NULL, 15, NULL, NULL, NULL, NULL, '2022-07-12 06:58:04', '2023-01-16 11:13:35', NULL),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 0, NULL, NULL, 'percentage', '18', '2022-12-15 13:09:39', '2022-12-15 13:09:39', NULL),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 'true', 16, NULL, NULL, NULL, NULL, '2022-12-15 13:09:39', '2023-01-16 11:13:53', NULL),
(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, 17, NULL, NULL, NULL, NULL, '2023-01-02 11:21:13', '2023-01-02 11:21:13', NULL);


-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--
DROP TABLE IF EXISTS `referral`;
CREATE TABLE `referral` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `referral_by_id` int(11) DEFAULT NULL,
  `referral_code` varchar(255) NOT NULL,
  `code_used` varchar(255) NOT NULL,
  `creer` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tj_cms`
--

DROP TABLE IF EXISTS `tj_cms`;
CREATE TABLE `tj_cms` (
  `cms_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cms_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tj_commission`
--

DROP TABLE IF EXISTS `tj_commission`;
CREATE TABLE `tj_commission` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(21) NOT NULL,
  `value` varchar(21) NOT NULL,
  `type` varchar(21) NOT NULL,
  `statut` varchar(5) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tj_commission`
--

INSERT INTO `tj_commission` (`id`, `libelle`, `value`, `type`, `statut`, `creer`, `modifier`, `updated_at`) VALUES
(1, '', '10', 'Percentage', 'yes', '2022-05-20 09:25:56', '2023-01-24 05:24:09', '2023-01-24 05:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `tj_complaints`
--

DROP TABLE IF EXISTS `tj_complaints`;
CREATE TABLE `tj_complaints` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `id_user_app` varchar(255) NOT NULL,
  `id_conducteur` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `id_ride` varchar(15) DEFAULT NULL,
  `id_parcel` varchar(15) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `tj_conducteur`
--

DROP TABLE IF EXISTS `tj_conducteur`;
CREATE TABLE `tj_conducteur` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) NOT NULL,
  `cnib` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `statut` varchar(255) NOT NULL,
  `statut_vehicule` varchar(255) NOT NULL,
  `status_car_image` varchar(255) DEFAULT NULL,
  `online` varchar(255) DEFAULT NULL,
  `login_type` varchar(255) NOT NULL,
  `photo` text,
  `photo_path` text,
  `photo_licence` text,
  `photo_licence_path` text,
  `photo_nic` text,
  `photo_nic_path` text,
  `photo_car_service_book` text,
  `photo_car_service_book_path` text,
  `photo_road_worthy` text,
  `photo_road_worthy_path` text,
  `tonotify` varchar(255) NOT NULL,
  `device_id` text,
  `fcm_id` text,
  `address` text NOT NULL,
  `bank_name` text,
  `branch_name` text,
  `holder_name` text,
  `account_no` text,
  `other_info` text,
  `ifsc_code` varchar(200) DEFAULT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `reset_password_otp` varchar(255) DEFAULT NULL,
  `reset_password_otp_modifier` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_verified` varchar(1) NOT NULL,
  `parcel_delivery` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_conducteur_transaction`
--
DROP TABLE IF EXISTS `tj_conducteur_transaction`;
CREATE TABLE `tj_conducteur_transaction` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` varchar(20) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `id_conducteur` varchar(255) NOT NULL,
  `id_ride` varchar(255) DEFAULT NULL,
  `id_parcel` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_country`
--
DROP TABLE IF EXISTS `tj_country`;
CREATE TABLE `tj_country` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(21) NOT NULL,
  `code` varchar(5) NOT NULL,
  `statut` varchar(5) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tj_country`
--

INSERT INTO `tj_country` (`id`, `libelle`, `code`, `statut`, `creer`, `modifier`, `created_at`, `updated_at`) VALUES
(1, 'Burkina Faso', 'FF', 'no', '2019-12-27 02:38:54', '2023-01-04 08:51:50', NULL, '2023-03-03 02:21:02'),
(2, 'India', 'IN', 'no', '2019-12-27 02:46:12', '2023-02-28 07:58:23', NULL, '2023-03-07 11:38:21'),
(3, 'Andorra', 'AD', 'no', '2019-12-27 03:04:49', '0000-00-00 00:00:00', NULL, '2023-02-17 14:58:11'),
(4, 'United Arab Emirates', 'AE', 'no', '2019-12-27 03:07:24', '0000-00-00 00:00:00', NULL, '2023-03-07 11:38:19'),
(5, 'Afghanistan', 'AF', 'no', '2019-12-27 03:07:40', '0000-00-00 00:00:00', NULL, '2023-03-07 11:38:18'),
(6, 'Antigua and Barbuda', 'AG', 'no', '2019-12-27 03:08:17', '0000-00-00 00:00:00', NULL, '2023-02-17 14:58:09'),
(7, 'Anguilla', 'AI', 'no', '2019-12-27 03:08:27', '0000-00-00 00:00:00', NULL, NULL),
(8, 'Albania', 'AL', 'no', '2019-12-27 03:08:40', '0000-00-00 00:00:00', NULL, NULL),
(9, 'Armenia', 'AM', 'no', '2019-12-27 03:08:57', '0000-00-00 00:00:00', NULL, NULL),
(10, 'Netherlands Antilles', 'AN', 'no', '2019-12-27 03:09:11', '0000-00-00 00:00:00', NULL, NULL),
(11, 'Angola', 'AO', 'no', '2019-12-27 03:09:25', '0000-00-00 00:00:00', NULL, '2023-03-10 00:44:55'),
(12, 'Antarctica', 'AQ', 'no', '2019-12-27 03:10:34', '0000-00-00 00:00:00', NULL, NULL),
(13, 'Argentina', 'AR', 'no', '2019-12-27 03:10:44', '0000-00-00 00:00:00', NULL, '2023-02-23 06:07:22'),
(14, 'American Samoa', 'AS', 'no', '2019-12-27 03:10:55', '0000-00-00 00:00:00', NULL, NULL),
(15, 'Austria', 'AT', 'no', '2019-12-27 03:11:05', '0000-00-00 00:00:00', NULL, '2023-02-17 14:58:16'),
(16, 'Australia', 'AU', 'no', '2019-12-27 03:11:18', '0000-00-00 00:00:00', NULL, NULL),
(17, 'Aruba', 'AW', 'no', '2019-12-27 03:14:28', '0000-00-00 00:00:00', NULL, NULL),
(18, 'Azerbaijan', 'AZ', 'no', '2019-12-27 03:14:37', '0000-00-00 00:00:00', NULL, NULL),
(19, 'Bosnia and Herzegovin', 'BA', 'no', '2019-12-27 03:14:46', '0000-00-00 00:00:00', NULL, NULL),
(20, 'Barbados', 'BB', 'no', '2019-12-27 03:14:56', '0000-00-00 00:00:00', NULL, NULL),
(21, 'Bangladesh', 'BDyu', 'no', '2019-12-27 03:15:19', '2023-02-23 06:07:44', NULL, '2023-02-23 06:07:44'),
(22, 'test', 'ts', 'no', '2022-09-07 11:51:39', '2023-01-23 14:33:34', '2022-09-07 11:51:39', '2023-02-13 23:20:40'),
(23, 'India', 'in', 'no', '2022-11-24 11:53:45', '2022-11-24 11:53:45', '2022-11-24 11:53:45', '2023-02-09 12:16:47'),
(24, 'test', 'ts', 'no', '2023-01-10 12:45:43', '2023-01-10 12:45:43', '2023-01-10 12:45:43', '2023-02-18 10:14:46'),
(25, 'Morocco', '+212', 'no', '2023-02-04 09:09:44', '2023-02-04 09:09:44', '2023-02-04 09:09:44', '2023-02-13 23:20:38'),
(26, 'Qatar', 'QA', 'no', '2023-02-12 09:41:29', '2023-02-12 09:41:29', '2023-02-12 09:41:29', '2023-02-12 09:41:29'),
(27, 'italia', '+39', 'no', '2023-02-13 23:20:04', '2023-02-13 23:21:47', '2023-02-13 23:20:04', '2023-02-18 10:15:07'),
(28, 'Costa Rica', '+506', 'no', '2023-02-13 23:38:39', '2023-02-13 23:38:39', '2023-02-13 23:38:39', '2023-02-18 10:14:50'),
(29, 'Kenya', 'KE', 'no', '2023-02-16 06:05:10', '2023-02-16 06:05:10', '2023-02-16 06:05:10', '2023-02-18 10:14:50'),
(30, 'Türkiye', 'TR', 'no', '2023-02-16 10:14:43', '2023-02-16 10:14:43', '2023-02-16 10:14:43', '2023-02-18 10:14:50'),
(31, 'Ghana', 'GHS', 'no', '2023-02-16 14:16:19', '2023-02-16 14:16:19', '2023-02-16 14:16:19', '2023-02-18 10:14:49'),
(32, 'pakistan', '+92', 'no', '2023-02-18 10:14:27', '2023-02-18 10:14:27', '2023-02-18 10:14:27', '2023-02-23 06:07:27'),
(33, 'مصر', 'مصر', 'no', '2023-02-19 12:08:35', '2023-02-19 12:08:35', '2023-02-19 12:08:35', '2023-02-19 12:08:35'),
(34, 'Brasil', 'BR', 'no', '2023-02-20 15:26:42', '2023-02-20 15:26:42', '2023-02-20 15:26:42', '2023-02-23 06:07:28'),
(35, 'South Africa', 'ZA', 'no', '2023-02-21 08:19:12', '2023-02-21 08:19:12', '2023-02-21 08:19:12', '2023-02-23 06:07:29'),
(36, 'Thailand', 'Thai', 'no', '2023-02-24 04:37:38', '2023-02-24 04:37:38', '2023-02-24 04:37:38', '2023-02-24 04:37:38'),
(37, 'Malawi', 'Mal', 'no', '2023-03-01 07:35:36', '2023-03-01 07:35:36', '2023-03-01 07:35:36', '2023-03-01 07:35:36'),
(38, 'Turkey', 'TUR', 'yes', '2023-03-02 19:48:57', '2023-03-02 19:48:57', '2023-03-02 19:48:57', '2023-03-02 19:49:10'),
(39, 'Nigeria', 'NGR', 'no', '2023-03-02 22:01:53', '2023-03-02 22:01:53', '2023-03-02 22:01:53', '2023-03-02 22:01:53'),
(40, 'Cuba', 'CU', 'no', '2023-03-03 16:32:59', '2023-03-03 16:32:59', '2023-03-03 16:32:59', '2023-03-03 16:32:59'),
(41, 'France', 'FRA', 'yes', '2023-03-06 01:44:19', '2023-03-06 01:44:19', '2023-03-06 01:44:19', '2023-03-06 01:45:16'),
(42, 'EGYPT', 'EG', 'no', '2023-03-08 20:46:24', '2023-03-08 20:46:24', '2023-03-08 20:46:24', '2023-03-08 20:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `tj_currency`
--
DROP TABLE IF EXISTS `tj_currency`;
CREATE TABLE `tj_currency` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(21) NOT NULL,
  `symbole` varchar(21) NOT NULL,
  `statut` varchar(5) NOT NULL,
  `decimal_digit` varchar(255) NOT NULL,
  `symbol_at_right` varchar(10) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tj_currency`
--

INSERT INTO `tj_currency` (`id`, `libelle`, `symbole`, `statut`, `decimal_digit`, `creer`, `modifier`, `created_at`, `updated_at`) VALUES
(1, 'Dollar', '$', 'yes', 2, '0000-00-00 00:00:00', '2023-01-23 14:50:57', '2023-01-16 07:26:44', '2023-01-25 05:01:17'),
(2, 'Indian Rupee', '₹', 'no', 2, '0000-00-00 00:00:00', '2023-01-23 14:50:30', '2023-01-16 10:58:43', '2023-01-25 13:26:04'),
(3, 'Euro', '€', 'no', 2, '0000-00-00 00:00:00', '2023-01-17 12:32:31', '2023-01-17 12:32:31', '2023-01-17 12:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `tj_discount`
--

DROP TABLE IF EXISTS `tj_discount`;
CREATE TABLE `tj_discount` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(1200) NOT NULL,
  `discount` varchar(1200) NOT NULL,
  `type` varchar(1200) NOT NULL,
  `discription` varchar(5000) DEFAULT NULL,
  `coupon_type` varchar(200) NOT NULL,
  `expire_at` datetime NOT NULL,
  `statut` varchar(12) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `tj_favorite_ride`
--

DROP TABLE IF EXISTS `tj_favorite_ride`;
CREATE TABLE `tj_favorite_ride` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(70) NOT NULL,
  `latitude_depart` varchar(21) NOT NULL,
  `longitude_depart` varchar(21) NOT NULL,
  `latitude_arrivee` varchar(21) NOT NULL,
  `longitude_arrivee` varchar(21) NOT NULL,
  `depart_name` varchar(200) NOT NULL,
  `destination_name` varchar(200) NOT NULL,
  `distance` varchar(255) NOT NULL,
  `distance_unit` varchar(10) NOT NULL,
  `statut` varchar(10) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `id_user_app` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_location_vehicule`
--
DROP TABLE IF EXISTS `tj_location_vehicule`;
CREATE TABLE `tj_location_vehicule` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nb_jour` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `contact` varchar(21) NOT NULL,
  `statut` varchar(21) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_vehicule_rental` varchar(255) DEFAULT NULL,
  `id_user_app` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_message`
--

DROP TABLE IF EXISTS `tj_message`;
CREATE TABLE `tj_message` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `id_requete` varchar(255) NOT NULL,
  `id_user_app` varchar(255) NOT NULL,
  `id_conducteur` varchar(255) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `user_cat` varchar(21) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tj_note`
--
DROP TABLE IF EXISTS `tj_note`;
CREATE TABLE `tj_note` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ride_id` varchar(255) DEFAULT NULL,
  `parcel_id` varchar(255) DEFAULT NULL,
  `niveau` varchar(255) NOT NULL,
  `id_conducteur` varchar(255) NOT NULL,
  `id_user_app` varchar(255) NOT NULL,
  `statut` varchar(5) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_notification`
--

DROP TABLE IF EXISTS `tj_notification`;
CREATE TABLE `tj_notification` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `to_id` varchar(255) NOT NULL DEFAULT '0',
  `from_id` varchar(255) NOT NULL DEFAULT '0',
  `titre` text NOT NULL,
  `message` text NOT NULL,
  `statut` varchar(5) NOT NULL,
  `type` varchar(111) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_payment_method`
--

DROP TABLE IF EXISTS `tj_payment_method`;
CREATE TABLE `tj_payment_method` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(21) NOT NULL,
  `image` text NOT NULL,
  `statut` varchar(10) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tj_payment_method`
--

INSERT INTO `tj_payment_method` (`id`, `libelle`, `image`, `statut`, `creer`, `modifier`, `updated_at`) VALUES
(5, 'Cash', 'image_method_1575136572.6831_944653490.png', 'no', '2019-11-30 11:04:28', '2019-11-30 17:56:12', '2023-01-09 08:01:36'),
(7, 'PayFast', 'image_method_1575134063.1561_602480122.png', 'no', '2019-11-30 17:14:23', '0000-00-00 00:00:00', NULL),
(8, 'Credit Card', 'image_method_1575134086.263_1420646508.png', 'No', '2019-11-30 17:14:46', '0000-00-00 00:00:00', NULL),
(9, 'Wallet', 'image_method_1578411935.0009_2031756.png', 'yes', '2020-01-07 15:45:35', '0000-00-00 00:00:00', NULL),
(10, 'Stripe', 'stripe.png', 'yes', '2022-07-08 07:49:23', '0000-00-00 00:00:00', NULL),
(11, 'PayStack', 'paystack.png', 'yes', '2022-07-08 08:38:13', '0000-00-00 00:00:00', NULL),
(12, 'FlutterWave', 'flutterwave.png', 'yes', '2022-07-08 08:40:05', '0000-00-00 00:00:00', NULL),
(13, 'Razorpay', 'razorpay_@3x.png', 'yes', '2022-07-08 08:40:32', '0000-00-00 00:00:00', NULL),
(14, 'Paytm', 'paytm_@3x.png', 'yes', '2022-07-08 08:40:59', '0000-00-00 00:00:00', NULL),
(15, 'PayPal', 'paypal_@3x.png', 'yes', '2022-07-08 08:41:35', '0000-00-00 00:00:00', NULL),
(16, 'Mercadopago', 'marcado_pago.png', 'yes', '2022-12-15 13:05:58', '2022-12-15 13:05:58', '2022-12-15 13:56:48'),
(17, ' applePay', '', '', '2023-01-02 11:20:05', '2023-01-02 11:20:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tj_privacy_policy`
--

DROP TABLE IF EXISTS `tj_privacy_policy`;
CREATE TABLE `tj_privacy_policy` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `privacy_policy` text NOT NULL,
  `statut` varchar(20) NOT NULL,
  `career` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tj_privacy_policy` (`id`, `privacy_policy`, `statut`, `career`, `modifier`, `updated_at`) VALUES
(1, '<p><b>Privacy Policy</b></p><p><br></p>', 'true', '2023-06-12 09:23:34', '2023-06-12 09:23:34', '2023-06-12 09:23:34');

--
-- Table structure for table `tj_requete`
--

DROP TABLE IF EXISTS `tj_requete`;
CREATE TABLE `tj_requete` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user_app` varchar(255) NOT NULL,
  `depart_name` varchar(100) NOT NULL,
  `destination_name` varchar(100) NOT NULL,
  `latitude_depart` varchar(21) NOT NULL,
  `longitude_depart` varchar(21) NOT NULL,
  `latitude_arrivee` varchar(21) NOT NULL,
  `longitude_arrivee` varchar(21) NOT NULL,
  `stops` json DEFAULT NULL,
  `place` text NOT NULL,
  `number_poeple` varchar(255) NOT NULL,
  `distance` varchar(255) NOT NULL,
  `distance_unit` varchar(10) CHARACTER SET armscii8 NOT NULL,
  `duree` varchar(21) NOT NULL,
  `montant` varchar(255) NOT NULL,
  `tip_amount` varchar(255) DEFAULT NULL,
  `tax` json DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `admin_commission` varchar(2000) NOT NULL,
  `transaction_id` varchar(2000) NOT NULL,
  `trajet` text NOT NULL,
  `statut` varchar(255) NOT NULL,
  `statut_paiement` varchar(10) NOT NULL,
  `id_conducteur` varchar(255) NOT NULL,
  `id_payment_method` varchar(255) DEFAULT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `date_retour` date DEFAULT NULL,
  `heure_retour` time NOT NULL,
  `statut_round` varchar(5) NOT NULL,
  `statut_course` varchar(10) NOT NULL,
  `id_conducteur_accepter` varchar(255) NOT NULL,
  `trip_objective` varchar(111) NOT NULL,
  `trip_category` varchar(111) NOT NULL,
  `age_children1` varchar(111) NOT NULL,
  `age_children2` varchar(111) NOT NULL,
  `age_children3` varchar(111) NOT NULL,
  `feel_safe` varchar(1) NOT NULL,
  `feel_safe_driver` varchar(1) NOT NULL,
  `car_driver_confirmed` varchar(1) NOT NULL DEFAULT '0',
  `otp` varchar(255) DEFAULT NULL,
  `otp_created` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `dispatcher_id` varchar(255) DEFAULT NULL,
  `ride_type` varchar(255) DEFAULT NULL,
  `user_info` json DEFAULT NULL,
  `rejected_driver_id` JSON DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_settings`
--

DROP TABLE IF EXISTS `tj_settings`;
CREATE TABLE `tj_settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `footer` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `website_color` varchar(2000) NOT NULL,
  `driverapp_color` varchar(2000) NOT NULL,
  `adminpanel_color` varchar(2000) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_logo_small` varchar(255) NOT NULL,
  `google_map_api_key` varchar(2000) NOT NULL,
  `is_social_media` varchar(200) NOT NULL,
  `driver_radios` varchar(200) NOT NULL,
  `user_ride_schedule_time_minute` varchar(200) NOT NULL,
  `trip_accept_reject_driver_time_sec` varchar(200) NOT NULL,
  `show_ride_without_destination` varchar(20) NOT NULL,
  `show_ride_otp` varchar(20) NOT NULL,
  `show_ride_later` varchar(20) NOT NULL,
  `delivery_distance` varchar(20) NOT NULL,
  `app_version` varchar(20) NOT NULL,
  `web_version` varchar(20) NOT NULL,
  `contact_us_address` longtext NOT NULL,
  `contact_us_phone` varchar(15) NOT NULL,
  `contact_us_email` varchar(60) NOT NULL,
  `minimum_deposit_amount` int(10) NOT NULL,
  `minimum_withdrawal_amount` int(10) NOT NULL,
  `referral_amount` int(10) NOT NULL,
  `mapType` varchar(100) NOT NULL,
  `driverLocationUpdate` int(10) NOT NULL,
  `delivery_charge_parcel` varchar(200) NOT NULL,
  `parcel_active` varchar(5) NOT NULL,
  `parcel_per_weight_charge` varchar(30) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tj_settings`
--

INSERT INTO `tj_settings` (`id`, `title`, `footer`, `email`, `website_color`, `driverapp_color`, `adminpanel_color`, `app_logo`, `app_logo_small`, `google_map_api_key`, `is_social_media`, `driver_radios`, `user_ride_schedule_time_minute`, `trip_accept_reject_driver_time_sec`, `show_ride_without_destination`, `show_ride_otp`, `show_ride_later`, `delivery_distance`, `app_version`, `web_version`, `contact_us_address`, `contact_us_phone`, `contact_us_email`, `minimum_deposit_amount`, `minimum_withdrawal_amount`, `referral_amount`, `mapType`, `driverLocationUpdate`, `delivery_charge_parcel`, `parcel_active`, `parcel_per_weight_charge`, `creer`, `modifier`) VALUES
(1, 'Cabme', '© 2022-2023 Cabme. All rights reserved.', '', '#0062eb', '#006cfa', '#092a77', 'app_logo.png', 'app_logo_small.png', '', '', '20', '', '300', '', 'no', '', 'KM', '5.0', '5.0', 'Your Address', '1234567890', 'info@yourdomain.com', 0, 19, 25, 'inappmap', 5, '5', 'yes', '10', '2019-12-15 09:41:04', '2023-09-26 12:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `tj_sos`
--

DROP TABLE IF EXISTS `tj_sos`;
CREATE TABLE `tj_sos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ride_id` varchar(255) NOT NULL,
  `latitude` varchar(60) NOT NULL,
  `longitude` varchar(60) NOT NULL,
  `status` varchar(200) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `tj_tax`
--

DROP TABLE IF EXISTS `tj_tax`;
CREATE TABLE `tj_tax` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(21) NOT NULL,
  `value` varchar(21) NOT NULL,
  `type` varchar(21) NOT NULL,
  `statut` varchar(5) NOT NULL,
  `country` varchar(255) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tj_tax`
--

INSERT INTO `tj_tax` (`id`, `libelle`, `value`, `type`, `statut`, `creer`, `modifier`) VALUES
(1, 'GST', '5', 'Percentage', 'yes', '2022-07-25 09:23:34', '2023-01-20 05:47:08');

-- --------------------------------------------------------

--
-- Table structure for table `tj_terms_and_conditions`
--

DROP TABLE IF EXISTS `tj_terms_and_conditions`;
CREATE TABLE `tj_terms_and_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `terms` text CHARACTER SET utf8 NOT NULL,
  `statut` varchar(11) CHARACTER SET utf8 NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tj_terms_and_conditions` (`id`, `terms`, `statut`, `creer`, `modifier`, `updated_at`) VALUES
(1, '<p><b><font color="#000000">Terms and Conditions</font></b></p>', 'true', '2023-06-12 09:23:34', '2023-06-12 09:23:34', '2023-06-12 09:23:34');

--
-- Table structure for table `tj_transaction`
--

DROP TABLE IF EXISTS `tj_transaction`;
CREATE TABLE `tj_transaction` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) NOT NULL,
  `id_user_app` varchar(255) NOT NULL,
  `deduction_type` varchar(255) NOT NULL,
  `ride_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(200) NOT NULL,
  `payment_status` varchar(200) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_type_vehicule`
--

DROP TABLE IF EXISTS `tj_type_vehicule`;
CREATE TABLE `tj_type_vehicule` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(21) NOT NULL,
  `prix` varchar(21) NOT NULL,
  `image` text NOT NULL,
  `selected_image` text NOT NULL,
  `status` varchar(5) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_type_vehicule_rental`
--

DROP TABLE IF EXISTS `tj_type_vehicule_rental`;
CREATE TABLE `tj_type_vehicule_rental` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(21) NOT NULL,
  `prix` varchar(21) NOT NULL,
  `image` text NOT NULL,
  `no_of_passenger` varchar(255) DEFAULT NULL,
  `nombre` varchar(21) DEFAULT NULL,
  `nb_place` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_user_app`
--
DROP TABLE IF EXISTS `tj_user_app`;
CREATE TABLE `tj_user_app` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(21) DEFAULT NULL,
  `prenom` varchar(21) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(21) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `login_type` varchar(21) NOT NULL,
  `photo` text,
  `photo_path` text,
  `photo_nic` text,
  `photo_nic_path` text,
  `statut` varchar(10) NOT NULL,
  `statut_nic` varchar(10) DEFAULT NULL,
  `tonotify` varchar(5) NOT NULL,
  `device_id` text,
  `fcm_id` text,
  `creer` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifier` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(10,2) DEFAULT NULL,
  `reset_password_otp` varchar(4) DEFAULT NULL,
  `reset_password_otp_modifier` varchar(20) DEFAULT NULL,
  `age` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `otp` varchar(20) DEFAULT NULL,
  `otp_created` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_user_note`
--

DROP TABLE IF EXISTS `tj_user_note`;
CREATE TABLE `tj_user_note` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ride_id` varchar(255) NOT NULL,
  `niveau_driver` varchar(255) NOT NULL,
  `id_conducteur` varchar(255) NOT NULL,
  `id_user_app` varchar(255) NOT NULL,
  `statut` varchar(5) CHARACTER SET utf8 NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `tj_vehicle_images`
--

DROP TABLE IF EXISTS `tj_vehicle_images`;
CREATE TABLE `tj_vehicle_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_vehicle` varchar(255) NOT NULL,
  `id_driver` varchar(255) NOT NULL,
  `image` text CHARACTER SET utf8 NOT NULL,
  `image_path` text CHARACTER SET utf8 NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `tj_vehicule`
--

DROP TABLE IF EXISTS `tj_vehicule`;
CREATE TABLE `tj_vehicule` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `car_make` varchar(100) NOT NULL,
  `milage` varchar(100) NOT NULL,
  `km` varchar(100) NOT NULL,
  `color` varchar(21) NOT NULL,
  `numberplate` varchar(100) NOT NULL,
  `passenger` varchar(255) NOT NULL,
  `id_conducteur` varchar(255) NOT NULL,
  `statut` varchar(5) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_type_vehicule` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_vehicule_rental`
--

DROP TABLE IF EXISTS `tj_vehicule_rental`;
CREATE TABLE `tj_vehicule_rental` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(21) NOT NULL,
  `statut` varchar(5) NOT NULL,
  `prix` varchar(255) NOT NULL,
  `nb_place` varchar(255) DEFAULT NULL,
  `image` text NOT NULL,
  `id_type_vehicule_rental` varchar(255) NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tj_vehicule_service_book`
--

DROP TABLE IF EXISTS `tj_vehicule_service_book`;
CREATE TABLE `tj_vehicule_service_book` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_conducteur` varchar(255) NOT NULL,
  `km` varchar(100) CHARACTER SET utf8 NOT NULL,
  `photo_car_service_book` text CHARACTER SET utf8 NOT NULL,
  `photo_car_service_book_path` text CHARACTER SET utf8 NOT NULL,
  `file_name` text CHARACTER SET utf8 NOT NULL,
  `creer` datetime NOT NULL,
  `modifier` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@cabme.com', NULL, '$2y$10$4D/Oi3x7gxPwZ/zxCKtgCOlPNujUnUER0vkMjQ0moL7l3cAJwTIJa', '2GNetjFykZX19AyhzjlNfbUPDi1hfrTt5cKv6QOGbgDWHOxq4WUJwUVkxGkl', '2022-02-26 12:22:29', '2022-03-02 08:48:06'),
(2, 'Super user', 'admin@demo.com', NULL, '$2y$10$4D/Oi3x7gxPwZ/zxCKtgCOlPNujUnUER0vkMjQ0moL7l3cAJwTIJa', 'Iv14KAPpjUvZclfqM2yCjQJ8VNmcAPaSSV1wX5AtoCRwaDellHDF6ZJlRc6o', '2022-03-02 10:18:22', '2022-03-02 10:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `users_access`
--

DROP TABLE IF EXISTS `users_access`;
CREATE TABLE `users_access` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `accesstoken` varchar(1111) NOT NULL,
  `user_type` varchar(1111) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_conducteur` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `note` varchar(200) NOT NULL,
  `statut` varchar(200) DEFAULT NULL,
  `creer` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `modifier` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

