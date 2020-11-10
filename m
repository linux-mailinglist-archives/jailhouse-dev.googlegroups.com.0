Return-Path: <jailhouse-dev+bncBCMPVWOP6MBRBBVXVH6QKGQEE7C2J4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C24C2AD254
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 10:21:14 +0100 (CET)
Received: by mail-pf1-x440.google.com with SMTP id w79sf8887252pfc.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 01:21:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605000070; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jd3QgH4h9NDXV5dlGSFdlsOJXlhdoLF4mYT24cn/whvxG49x+CEudNKsOHGqUcA5Bc
         s3QuoWl7hDdNH/2uu8B+OgwZQIPh2gVpUmnCDIhesx1M+0aG3Pqlrp9i+kwooXmtCZPZ
         +dROxpsziGvM3Dcb0lCFoBvSwMunQ1vCQvJIbQpfbvmqxeKhjxURXpaqxBWmKUloPe1e
         IZz7R2rzhmv0WcnYusbKCTYe47Y6Rmd7669KzzWa45ueK7FJa1NQxttpgQKbszJCvgZR
         oc1EN33FtSnaD5FyZ7dWBm9qTNvIBvgvKPwexKkWhEwPigSkY8eAhvGvcTNg0CcOMFjM
         GUdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:date:auto-submitted
         :mime-version:message-id:subject:to:reply-to:from:dkim-signature;
        bh=QxObciVoMfWBk/0Tufv6OlLO4m+loMKAH1JOym7ZBjs=;
        b=BMwn11nQxY+1sxIYB1CvjqH0ILEdPBOuL3iprFM+ShNdy+BbQctJPrMpmdf99/Q3+L
         k/v2qLh+T06sLOP09YX8MVfhVhD2NHd15jIP3/rWaffNBwO0ICD7ihyxke7Q1TKUNx9X
         0HTWkXcBczSc4rGbr2lR7LDAFQ24zgs1lJcjA3hW0yiugcgVr7IruDRMnNTBpi5xSzza
         Q9j01voZzl3o8RrpcIj5tD0yzmIFvvEvptR437o7+I/6kYGiHz1rBCddUiMU50rN7oIw
         oasyi98qMCeTByo/OQQVQBw58wm3KVGgahzFvDQljQN3kW1Kjztq3hbGca2SYLAYTByO
         mN+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@slack.com header.s=uwk3bwvqdj7skisaka6vhyomezh2btzz header.b="NM/RwvMO";
       dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EzFHkx6y;
       spf=pass (google.com: domain of 01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@mail.slack.com designates 69.169.237.184 as permitted sender) smtp.mailfrom=01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@mail.slack.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=slack.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:reply-to:to:subject:message-id:mime-version:auto-submitted
         :date:feedback-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QxObciVoMfWBk/0Tufv6OlLO4m+loMKAH1JOym7ZBjs=;
        b=Uqfi7S8j+NTSmU1/7dSR+qdcLrPpIjyK4z3+eomaQHb9HUO+5IDCjrKssw0WK2GwDs
         9ERN5uft3sE0AdcONoGzXsCE9MeSHtraSM0ulIqevhcD8aCWgnBsrTnfKbpDVjofp6/J
         oeGo/yZb6zd+xCfa45kB39i/96qeLh+JHCKHv8reIigBglXCdYZKzuaJUk1irR1mZ2UM
         yG+1VuYfVTCN5SzxS3bWyxnpYsq47quIdabht3fFixm45B32hvavxGHR8y4nLfB3gdkM
         PY6QbcHlfZvlFyb1wiE7RNLwl2Wy4EaC4o21vyw8Y5SHVeAm0RWixOcDOCVQqjp7HzGd
         kcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:subject:message-id:mime-version
         :auto-submitted:date:feedback-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QxObciVoMfWBk/0Tufv6OlLO4m+loMKAH1JOym7ZBjs=;
        b=ewTHsjPvPJGCCT5dcIeHb3IH9pkjex9ked7tAJ39fE/Ko668hiBm7Ww8Mk4UByWTgj
         lh+1ROBO7wvWjxOZEbIEvDfv0X+uvP5hUaqG8Ny3SPSkDdGIMEEpFOAe+vQ9T2Bgx5ON
         zpyfjhPB3FS0kH8/u9WZTXY0hwSTKkr1U6sV3uQvVFxmRlykw2SJ7QlvrqxplOb0xLvD
         qobHiUKdZBlbe6WL7s/3Y1qeGKH+2LdGuAU3xbDOULZH5y3DSkgiVxTcT58o9kNBllzl
         XIslYcG5ywPNgcaKOzx74S4CblfNV1DiuX+CyArhhTNDKUCnfjHCCoSFLjzaATrjXvU0
         OHeg==
X-Gm-Message-State: AOAM533Grv6Xce/m3FAtO2tUAdi+ffvx6zcXPW6sEY7z1n/8wTW1d+rn
	57va12ewmN7l95kjFRCY9iM=
X-Google-Smtp-Source: ABdhPJzsLpC+LRYUhAiDZj4gRxzHhM2vshEDWs4C/XLUmX5mvTpJAot7Y+m7GkUfMyUObXLh/twv6w==
X-Received: by 2002:a62:1408:0:b029:18b:78d:4c4b with SMTP id 8-20020a6214080000b029018b078d4c4bmr17185957pfu.25.1605000070435;
        Tue, 10 Nov 2020 01:21:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:8f47:: with SMTP id r7ls4003892pgn.8.gmail; Tue, 10 Nov
 2020 01:21:09 -0800 (PST)
X-Received: by 2002:a63:5f14:: with SMTP id t20mr16769514pgb.305.1605000069633;
        Tue, 10 Nov 2020 01:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605000069; cv=none;
        d=google.com; s=arc-20160816;
        b=cuJfRcmZvvWVIssk2rHBCSTRIGX5uQMWDZQCIXbWvrY6VewGq9Qfkp+Jt2NSCB+uxN
         XJjCSkCGwvHORL11VAGIlMj/PawOq0LfHpZjTBgXvUw8/O/U63MH9NQHFAU1Rlfrxfe0
         ZorjbsaLq2i2mIP44uzgEk6yv3wMKt0mWPpJBfaRxrPJjgkJAbCiLpsFOC0uaLjLB0k3
         rSVrhwJUGW1OHUhKcmxdaCeNrhtKXzdh5pJC2olKVK3hentit3T6IoqBNQiF/BvGnqLN
         O53BJFuDlNULNBZyi/bSdwaAC0uXo13kvcGB73kWYCSSWKJtr0C5ut8FHFMqTiMgU4AQ
         44GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:date:auto-submitted:mime-version:message-id:subject:to
         :reply-to:from:dkim-signature:dkim-signature;
        bh=QWeXp3E6HTrpVPFo+u1YS7SHCie3/YSUOvXbUOIeKQ8=;
        b=D7g+oDMXGmX5u7eF5IEvNw5N8c2SKYomcO6fSDN+mhp/yyecOla0iUNm0BYcapaTNp
         kKtpoHAhZEQ2Us9+zz/hF3qPfuYqy607t31a5pkpl0BOdq484kODce9snCsm1ipcH5ev
         A7syGBSKma4kxj1f4aFeEig6KRdIwFMBZE9Zjag7dmSNRGpa+a9ihUkqr7IaqUMDwxcm
         ELYusYWQf9A3XMpSvXq/MKltXsdoQYhaBU/umtq7IjgA916EHaIZ8gn/aZp8QRJzddlu
         YylYXhkvGjyNzeDTVH31wdFj7t73ippGZV0hBhoLWq9JwJ8dcLwYwGli7e2mnnL7d+Bn
         ewGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@slack.com header.s=uwk3bwvqdj7skisaka6vhyomezh2btzz header.b="NM/RwvMO";
       dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EzFHkx6y;
       spf=pass (google.com: domain of 01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@mail.slack.com designates 69.169.237.184 as permitted sender) smtp.mailfrom=01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@mail.slack.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=slack.com
Received: from b237-184.smtp-out.us-west-2.amazonses.com (b237-184.smtp-out.us-west-2.amazonses.com. [69.169.237.184])
        by gmr-mx.google.com with ESMTPS id f14si390780pfe.3.2020.11.10.01.21.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 10 Nov 2020 01:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of 01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@mail.slack.com designates 69.169.237.184 as permitted sender) client-ip=69.169.237.184;
From: "'Slack' via Jailhouse" <jailhouse-dev@googlegroups.com>
Reply-To: no-reply@slack.com
To: "" <jailhouse-dev@googlegroups.com>
Subject: Jailhouse Hypervsior on Slack: New Account Details
Message-ID: <01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@us-west-2.amazonses.com>
Content-Type: multipart/alternative;
 boundary="=_4e8acc3b-bfd1-4d98-a8f0-4e7bac959e6f"
MIME-Version: 1.0
X-Slack-Team-ID: T01EKPMA8FJ
Auto-Submitted: auto-generated
X-Slack-Message-ID: ob-aaaacxce2pddaethhipopfjqae
Date: Tue, 10 Nov 2020 09:21:09 +0000
X-SES-Outgoing: 2020.11.10-69.169.237.184
Feedback-ID: 1.us-west-2.yYC5iBNQ02JwTlfWPiYV/5dg9uYAK9tw533hnbqAYig=:AmazonSES
X-Original-Sender: feedback@slack.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@slack.com header.s=uwk3bwvqdj7skisaka6vhyomezh2btzz
 header.b="NM/RwvMO";       dkim=pass header.i=@amazonses.com
 header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EzFHkx6y;       spf=pass
 (google.com: domain of 01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@mail.slack.com
 designates 69.169.237.184 as permitted sender) smtp.mailfrom=01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@mail.slack.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=slack.com
X-Original-From: Slack <feedback@slack.com>
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

--=_4e8acc3b-bfd1-4d98-a8f0-4e7bac959e6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Welcome to Slack

Ta-da! You=E2=80=99ve joined your first Slack workspace and we couldn=E2=80=
=99t be more delighted. Here are your account details, along with some tips=
 to help you get started.

Workspace name: Jailhouse Hypervsior

J

jailhousehypervsior.slack.com []

Open Slack [https://jailhousehypervsior.slack.com/x-p1495803348528-14898078=
84627-1489873248707/messages/C01EKPMAJ3A]

Tips for getting started

Take a quick tour

Get familiar with the basics of Slack [https://jailhousehypervsior.slack.co=
m/x-p1495803348528-1489807884627-1489873248707/resources/using-slack/your-q=
uick-start-guide-to-slack?utm_medium=3Demail&utm_source=3Dconfirmation-new-=
join] so you=E2=80=99re ready to get to work in no time.

Start working in channels

Keep conversations organized in channels [https://jailhousehypervsior.slack=
.com/x-p1495803348528-1489807884627-1489873248707/features/channels?utm_med=
ium=3Demail&utm_source=3Dconfirmation-new-join] =E2=80=94 organized spaces =
for everything related to a project, topic, or team.

Download Slack

For the best experience with Slack, download our apps [https://jailhousehyp=
ervsior.slack.com/x-p1495803348528-1489807884627-1489873248707/downloads?ut=
m_medium=3Demail&utm_source=3Dconfirmation-new-join&t=3DT01EKPMA8FJ] for de=
sktop and mobile.

See more tips [https://jailhousehypervsior.slack.com/x-p1495803348528-14898=
07884627-1489873248707/resources/using-slack/slack-tutorials?utm_medium=3De=
mail&utm_source=3Dconfirmation-new-join]

If you have any questions as you=E2=80=99re getting started, drop us a note=
 at help@slack.com. We=E2=80=99re glad you=E2=80=99re here!

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000%=
40us-west-2.amazonses.com.

--=_4e8acc3b-bfd1-4d98-a8f0-4e7bac959e6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org=
/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns=3D"http://www.w3.org/1999/xht=
ml"><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-=
scale=3D1.0"><link href=3D"https://fonts.googleapis.com/css?family=3DLato:4=
00,700,900" rel=3D"stylesheet"><title>Jailhouse Hypervsior on Slack: New Ac=
count Details</title><style type=3D"text/css">/* Global Resets */
	body, .background_main, p, table, td, div { font-family: 'Lato', 'Helvetic=
a Neue', Helvetica, Arial, sans-serif; }

	img {
		border: none;
		-ms-interpolation-mode: bicubic;
		max-width: 100%;
	}

	p {padding-bottom: 2px;}

	body {
		background: #fff;
		font-size: 17px;
		line-height: 24px;
		margin: 0;
		padding: 0;
		-ms-text-size-adjust: 100%;
		-webkit-text-size-adjust: 100%;
	}

	table {
		border-collapse: collapse;
		mso-table-lspace: 0pt;
		mso-table-rspace: 0pt;
		width: 100%;
	}

	td {
		font-size: 17px;
		line-height: 24px;
		vertical-align: top;
	}

	/* Footer */
	.email_footer td, .email_footer p, .email_footer span, .email_footer a {
		font-size: 15px;
		text-align: center;
		color: #434245;
	}

	.email_footer td {padding-top: 20px;}

	.preheader {
		display: none;
		mso-hide: all;
	}

	/* Typography */
	h1, h2, h3, h4 {
		color: #434245;
		font-weight: 400;
		line-height: 1.4;
		margin: 0;
		margin-bottom: 12px;
	}

	h1 {
		font-size: 30px;
		line-height: 36px;
		font-weight: 900;
		letter-spacing: -.75px;
		text-align: left;
	}

	p, ul, ol {
		font-size: 17px;
		line-height: 24px;
		font-weight: normal;
		margin: 0;
		margin-bottom: 15px;
	}

	p li, ul li, ol li {
		list-style-position: inside;
		margin-left: 5px;
	}

	a {
		color: #3498db;
		text-decoration: none;
	}

	a:hover {text-decoration: underline;}

	.button_link::after {
		position: absolute;
		content: '';
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		border-radius: 4px;
	}

	.button_link:hover::after {
		box-shadow: inset 0 -2px #237c4a;
	}

	.button_link.is_secondary:hover::after {
		box-shadow: none;
	}

	.button_link.plum:hover {
		background-color: #4a154b !important;
		border-color: #4a154b !important;
	}

	.button_link_wrapper.plum:hover {
		background-color: #4a154b !important;
	}

	.button_link.plum:hover::after {
		box-shadow: none;
	}

	.preview_text {
		color: transparent;
		display: none;
		height: 0;
		max-height: 0;
		max-width: 0;
		opacity: 0;
		overflow: hidden;
		mso-hide: all;
		visibility: hidden;
		width: 0;
		font-size: 1px;
		line-height:1px;
	}

	.preview_text a {
		color: #3AA3E3 !important;
		font-weight: bold;
	}

	/* Responsive and Mobile Friendly Styles */
	/* Yahoo Mail has a history of rendering all media query styles with class=
 selectors unless class is used as an attribute */
	@media only screen and (max-width: 600px) {
		table[class=3D"background_main"] .sm_full_width {
			width: 100% !important;
		}
		table[class=3D"background_main"] .sm_90_percent_width {
			width: 90% !important;
			padding: 16px !important;
			text-align: center !important;
			float: none !important;
		}
		table[class=3D"background_main"] .sm_side_padding {
			padding-right: 8px !important;
			padding-left: 8px !important;
			float: none !important;
		}
		table[class=3D"background_main"] .sm_small_top_padding {
			padding-top: 8px !important;
		}
		table[class=3D"background_main"] .sm_top_padding {
			padding-top: 16px !important;
		}
		table[class=3D"background_main"] .sm_auto_width {
			width: auto !important;
		}
		table[class=3D"background_main"] .sm_auto_height {
			height: auto !important;
		}

		table[class=3D"background_main"] .sm_border_box {
			box-sizing: border-box !important;
		}

		table[class=3D"background_main"] .sm_block {
			display: block !important;
		}
		table[class=3D"background_main"] .sm_inline_block {
			display: inline-block !important;
		}
		table[class=3D"background_main"] .sm_table {
			display: table !important;
		}

		table[class=3D"background_main"] .sm_no_side_padding {
			padding-right: 0 !important;
			padding-left: 0 !important;
		}
		table[class=3D"background_main"] .sm_no_border_radius {
			border-radius: 0 !important;
		}
		table[class=3D"background_main"] .sm_no_padding {
			padding-right: 0 !important;
			padding-left: 0 !important;
		}
		table[class=3D"background_main"] .sm_os_icons_height {
			/* this is to make the parent element the same height as the inline-bloc=
k img inside */
			height: 44px;
		}
		.social_img_bottom_margin {
			/*this class is for social_user_outreach email only*/
			margin-bottom: 20px !important;
		}
		.social_p_bottom_margin {
			/*this class is for social_user_outreach email only*/
			margin-bottom: 40px !important;
		}
	}

	/* More client-specific styles */
	@media all {
		.ExternalClass {
			width: 100%;
		}
		.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass fon=
t, .ExternalClass td, .ExternalClass div {
			line-height: 100%;
		}
		.email_footer a {
			color: #434245 !important;
			font-family: inherit !important;
			font-size: inherit !important;
			font-weight: inherit !important;
			line-height: inherit !important;
			text-decoration: none !important;
		}
	}
	a:hover {
		text-decoration: underline !important;
	}

	pre, code {
		--saf-0: rgba(var(--sk_foreground_low, 29, 28, 29), 0.13);
		border: 1px solid var(--saf-0);
		background: rgba(var(--sk_foreground_min, 29, 28, 29), 0.04);
		font-family: 'Monaco', 'Menlo', 'Consolas', 'Courier New', monospace !imp=
ortant;
		font-size: 12px;
		line-height: 1.50001;
		font-variant-ligatures: none;
		white-space: pre;
		white-space: pre-wrap;
		word-wrap: break-word;
		word-break: normal;
		-webkit-tab-size: 4;
		-moz-tab-size: 4;
		-o-tab-size: 4;
		tab-size: 4;
	}

	code {
		color: #e01e5a;
		padding: 2px 3px 1px;
		border-radius: 3px;
	}

	pre {
		margin-bottom: 16px;
		padding: 8px;
		border-radius: 4px;
	}

	blockquote {
		position: relative;
		margin-bottom: 16px;
		padding-left: 16px;
		border-left: rgba(var(--sk_foreground_low_solid, 221, 221, 221), 1);
		border-left-width: 4px;
		border-left-style: solid;
	}
</style></head><body><div class=3D"preheader plaintext_ignore" style=3D"fon=
t-size: 1px; display: none !important;"> Here are your account details, alo=
ng with some tips to help you get started. </div><div class=3D"plaintext_ig=
nore" style=3D"display: none; max-height: 0px; overflow: hidden;"> =C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0 =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
 =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
 </div><!--[if mso]><style type=3D"text/css">.background_main, table, table=
 td, p, div, h1, h2, h3, h4, h5, h6 {
								font-family: Arial, sans-serif !important;
							}</style><![endif]--><table style=3D"background-color: #ffffff; padd=
ing-top: 20px;color: #434245;width: 100%;-webkit-font-smoothing:antialiased=
; -moz-osx-font-smoothing:grayscale;   border: 0; text-align: center; borde=
r-collapse: collapse;" class=3D"background_main"><tr><td style=3D"vertical-=
align: top; padding: 0"><center><table id=3D"body" class=3D"card" style=3D"=
border: 0; border-collapse: collapse; margin: 0 auto; background: white; bo=
rder-radius: 8px; margin-bottom: 16px;"><tr><td style=3D"width: 546px; vert=
ical-align: top; padding-top: 32px"><div style=3D"max-width: 600px; margin:=
 0 auto;"><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><img width=3D"120" height=3D"36" style=3D"margin-top: 0; margin=
-right: 0; margin-bottom: 32px; margin-left: 0px; padding-right: 30px; padd=
ing-left: 30px;" src=3D"https://jailhousehypervsior.slack.com/x-p1495803348=
528-1489807884627-1489873248707/img/slack_logo_240.png" alt=3D""><!--[if ms=
o]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><h1 style=3D"font-size: 30px; padding-right: 30px; padding-left=
: 30px;">Welcome to Slack</h1><p style=3D"font-size: 17px; margin-left: 30p=
x; margin-right: 30px;">Ta-da! You=E2=80=99ve joined your first Slack works=
pace and we couldn=E2=80=99t be more delighted. Here are your account detai=
ls, along with some tips to help you get started.</p><!--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><div style=3D"padding-right: 30px; padding-left: 30px; padding-=
bottom: 30px;"><h4 class=3D"plaintext_only" style=3D"display: none">Workspa=
ce name: Jailhouse Hypervsior</h4><table style=3D"table-layout: fixed; bord=
er: 1px solid #A0A0A2; border-radius: 8px; padding: 40px 0; margin-top: 20p=
x; width: 100%; border-collapse: separate; text-align: center"><tr><td styl=
e=3D"vertical-align: middle;"><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"38">
<![endif]--><div style=3D"margin: auto; height: 38px; width: 38px; min-widt=
h: 38px; border-radius: 4px; color: #FFFFFF; font-size: 18px; line-height: =
38px; mso-line-height-rule: exactly; mso-text-raise: 10px; vertical-align: =
middle; text-align: center; background-color: #0576b9;">J</div><!--[if mso]=
>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"420">
<![endif]--><h3 class=3D"plaintext_ignore" style=3D"font-weight: 900; paddi=
ng-top: 10px; margin-bottom: 7px; font-size: 21px; font-size: 21px; margin-=
bottom: 2px; width: 70%; margin: auto; text-align: center; margin-top: 0;">=
Jailhouse Hypervsior</h3><!--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><h4 style=3D"margin-bottom: 2px;font-size: 17px; margin-bottom:=
 12px;"><a style=3D"white-space: nowrap; color: #717274; text-decoration: n=
one !important;">jailhousehypervsior.slack.com</a></h4><table style=3D"widt=
h: 100%; text-align: center;" class=3D"sm_table"><tr style=3D"width: 100%;"=
><td style=3D"width: 100%;"><span style=3D"display: inline-block; position:=
relative; border-radius:4px; background-color:#611f69; " class=3D"button_li=
nk_wrapper plum"><a class=3D"button_link  plum" href=3D"https://jailhousehy=
pervsior.slack.com/x-p1495803348528-1489807884627-1489873248707/messages/C0=
1EKPMAJ3A" style=3D"border-top:13px solid; border-bottom:13px solid; border=
-right:24px solid; border-left:24px solid; border-color:#611f69; border-rad=
ius:4px; background-color:#611f69; color:#ffffff; font-size:16px; line-heig=
ht:18px; word-break:break-word;  display: inline-block; text-align: center;=
 font-weight: 900; text-decoration: none !important;">Open Slack</a></span>=
</td></tr></table></td></tr></table></div><!--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><h1 style=3D"font-size: 30px; padding-right: 30px; padding-left=
: 30px;">Tips for getting started</h1><!--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><div style=3D"padding-right: 30px; padding-left: 30px; margin: =
0; margin-top: 24px"><table style=3D"border-collapse: collapse; border: 0;h=
eight: 70px; table-layout: fixed; word-wrap: break-word; border-radius: 6px=
;"><tr><td style=3D"width: 40px;"><img style=3D"padding: 10px 0; display: b=
lock; margin-right: auto; margin-left: auto; height: auto;" width=3D"40" sr=
c=3D"https://a.slack-edge.com/d51da/img/email/eye_white_background@2x.png">=
</td><td><p style=3D"font-size: 17px; margin-left: 30px; margin-right: 30px=
; margin-bottom: 0"><span style=3D"font-weight: 900;">Take a quick tour</sp=
an></p><p style=3D"font-size: 17px; margin-left: 30px; margin-right: 30px;"=
><a style=3D"color: #0576b9; text-decoration: underline !important;" href=
=3D"https://jailhousehypervsior.slack.com/x-p1495803348528-1489807884627-14=
89873248707/resources/using-slack/your-quick-start-guide-to-slack?utm_mediu=
m=3Demail&utm_source=3Dconfirmation-new-join">Get familiar with the basics =
of Slack</a> so you=E2=80=99re ready to get to work in no time.</p></td></t=
r></table></div><!--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><div style=3D"padding-right: 30px; padding-left: 30px; margin: =
0;"><table style=3D"border-collapse: collapse; border: 0;height: 70px; tabl=
e-layout: fixed; word-wrap: break-word; border-radius: 6px;"><tr><td style=
=3D"width: 40px;"><img style=3D"padding: 10px 0; display: block; margin-rig=
ht: auto; margin-left: auto; height: auto;" width=3D"40" src=3D"https://a.s=
lack-edge.com/d51da/img/email/channel_white_background@2x.png"></td><td><p =
style=3D"font-size: 17px; margin-left: 30px; margin-right: 30px; margin-bot=
tom: 0"><span style=3D"font-weight: 900;">Start working in channels</span><=
/p><p style=3D"font-size: 17px; margin-left: 30px; margin-right: 30px;"><a =
style=3D"color: #0576b9; text-decoration: underline !important;" href=3D"ht=
tps://jailhousehypervsior.slack.com/x-p1495803348528-1489807884627-14898732=
48707/features/channels?utm_medium=3Demail&utm_source=3Dconfirmation-new-jo=
in">Keep conversations organized in channels</a> =E2=80=94 organized spaces=
 for everything related to a project, topic, or team.</p></td></tr></table>=
</div><!--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><div style=3D"padding-right: 30px; padding-left: 30px; margin: =
0;"><table style=3D"border-collapse: collapse; border: 0;height: 70px; tabl=
e-layout: fixed; word-wrap: break-word; border-radius: 6px;"><tr><td style=
=3D"width: 40px;"><img style=3D"padding: 10px 0; display: block; margin-rig=
ht: auto; margin-left: auto; height: auto;" width=3D"40" src=3D"https://a.s=
lack-edge.com/d51da/img/email/download_white_background@2x.png"></td><td><p=
 style=3D"font-size: 17px; margin-left: 30px; margin-right: 30px; margin-bo=
ttom: 0"><span style=3D"font-weight: 900;">Download Slack</span></p><p styl=
e=3D"font-size: 17px; margin-left: 30px; margin-right: 30px;">For the best =
experience with Slack, <a style=3D"color: #0576b9; text-decoration: underli=
ne !important;" href=3D"https://jailhousehypervsior.slack.com/x-p1495803348=
528-1489807884627-1489873248707/downloads?utm_medium=3Demail&utm_source=3Dc=
onfirmation-new-join&t=3DT01EKPMA8FJ">download our apps</a> for desktop and=
 mobile.</p></td></tr></table></div><!--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><div class=3D"sm_inline_block sm_90_percent_width" style=3D"tex=
t-align: center; padding-right: 16px; vertical-align: middle; font-size: 30=
px; margin: 8px 0 36px 0"><table style=3D"width: 100%; text-align: center;"=
 class=3D"sm_table"><tr style=3D"width: 100%;"><td style=3D"width: 100%;"><=
span style=3D"display: inline-block; position:relative; border-radius:4px; =
background-color:#611f69; " class=3D"button_link_wrapper plum"><a class=3D"=
button_link  plum" href=3D"https://jailhousehypervsior.slack.com/x-p1495803=
348528-1489807884627-1489873248707/resources/using-slack/slack-tutorials?ut=
m_medium=3Demail&amp;utm_source=3Dconfirmation-new-join" style=3D"border-to=
p:13px solid; border-bottom:13px solid; border-right:24px solid; border-lef=
t:24px solid; border-color:#611f69; border-radius:4px; background-color:#61=
1f69; color:#ffffff; font-size:16px; line-height:18px; word-break:break-wor=
d;  display: inline-block; text-align: center; font-weight: 900; text-decor=
ation: none !important;">See more tips</a></span></td></tr></table></div><!=
--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--><!--[if mso]>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"padding: 0=
; margin: 0; width: 100%;">
    <tr>
        <td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; =
height: 20px;" height=3D"20">&nbsp;</td>
    </tr>
    <tr>
        <td style=3D"padding: 0; margin: 0;">&nbsp;</td>
        <td style=3D"padding: 0; margin: 0;" width=3D"540">
<![endif]--><p style=3D"font-size: 17px; margin-left: 30px; margin-right: 3=
0px; margin-top: 20px;">If you have any questions as you=E2=80=99re getting=
 started, drop us a note at <a href=3D"mailto:help@slack.com">help@slack.co=
m</a>. We=E2=80=99re glad you=E2=80=99re here!</p><!--[if mso]>
		</td>
		<td style=3D"padding: 0; margin: 0; font-size: 20px; height: 20px;">&nbsp=
;</td>
	</tr>
	<tr>
		<td colspan=3D"3" style=3D"padding: 0; margin: 0; font-size: 20px; height=
: 20px; height: 20px;">&nbsp;</td>
	</tr>
</table>
<![endif]--></div></td></tr></table></center></td></tr><tr><td class=3D"ema=
il_footer" style=3D"font-size: 15px;color: #717274;text-align: center;width=
: 100%;"><table style=3D"margin: 20px auto 0; background-color: white; bord=
er: 0; text-align: center; border-collapse: collapse;"><tr><td>=C2=A0</td><=
td><span style=3D"display: block; color: #434245; font-size: 15px;"> Made b=
y <a href=3D"https://slack.com" style=3D"text-decoration: none; color: #434=
245;">Slack Technologies, Inc</a>
                <br/>
                500 Howard Street&nbsp;|&nbsp;San&nbsp;Francisco,&nbsp;CA&n=
bsp;94105&nbsp;|&nbsp;United States </span></td><td>=C2=A0</td></tr><tr><td=
>=C2=A0</td><td style=3D"font-size: 15px; padding: 16px 8px 24px; vertical-=
align: top; text-align: center;"><span><a href=3D"https://slackhq.com" styl=
e=3D"color: #434245; text-decoration: underline !important;">Our Blog</a> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://jailhousehypervsior=
.slack.com/x-p1495803348528-1489807884627-1489873248707/account/notificatio=
ns" style=3D"color: #434245;font-size: 15px; text-decoration: underline !im=
portant;">Email Preferences</a> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a hre=
f=3D"https://slack.com/legal" style=3D"color: #434245; text-decoration: und=
erline !important;">Policies</a></span></td></tr></table></td></tr></table>=
</body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa7=
3b1-000000%40us-west-2.amazonses.com?utm_medium=3Demail&utm_source=3Dfooter=
">https://groups.google.com/d/msgid/jailhouse-dev/01010175b1758008-a5c3cccf=
-f630-4771-9a1f-5ecdbeaa73b1-000000%40us-west-2.amazonses.com</a>.<br />

--=_4e8acc3b-bfd1-4d98-a8f0-4e7bac959e6f--
