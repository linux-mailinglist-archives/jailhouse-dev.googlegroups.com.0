Return-Path: <jailhouse-dev+bncBCMPVWOP6MBRBVNKVH6QKGQEOAVVQ7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 809372AD1E2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 09:54:47 +0100 (CET)
Received: by mail-oi1-x23b.google.com with SMTP id z79sf1683884oia.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 00:54:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604998486; cv=pass;
        d=google.com; s=arc-20160816;
        b=lOiSond7wEPf4CwDAFcYfaX9DvPXKFD/4uUMzih+pro9xXSdvZAXV3PjqC2aXnIc8v
         Ys81nTGilp5BxHIy9s6rSexvskXzoKoRwdlerk6eoBNseH4AX4gekeiFuJjj+pfMPwVe
         vGyx2BTrsiTiDlPKIYMHW21Tb8HJHrlhqpAIs6RDF1whYHqlG6dIQXQ6sjXqi18PoSDM
         WNvSb85XM3fzAzk47ghqmwsAFt7zs8vY/vwQYn/mU5cBpv5jeKqR15nmBK+MSEtjJc7s
         VGyp0MDbp9VdBnq+fOAUADvCHuL/D89hykC/ZS1CER7SnrOlqAkVGuGQY/IhLw68jJ3n
         2V/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:date:auto-submitted
         :mime-version:message-id:subject:to:reply-to:from:dkim-signature;
        bh=hB7LHd7V0EkTdUw1oR0edse377qGHhApVddYRRpXB+Y=;
        b=Ba/i93RNe9sl+rsvz3pmKiBSkzuBJ1hSBO9NVZW7tMpmlPOlo0pikmfMZfjFvFH7S4
         +Zt79FadUrgjQs42uFOjMlcHa1WsZSL0A2Q0oI9D148djXKYK+zyf5ISRRsd5DcU3zuw
         HZjihwoOnUy3uAjHdM3HjyoefBl40OPo6ItVQixEJaPrHq/7kCo22ckhcMvu3NDqWIOx
         W/V3OZOfGM0pmSeOKZUDmwau8CrnZdmGNL5ueBg1IEDJitEn5mIH0ueQHZYHFv8IW9mB
         pAQ5sax/u1jekkTErcHaxGWaL+6R4wNFk6Amg/YLPxBunBSy5ccswsNNaSADg7KcQaG4
         Jxxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@slack.com header.s=s4xolb5s7tnx6yxtrm4adems7glgsuyf header.b=DEGje0ag;
       dkim=pass header.i=@amazonses.com header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=LFhP6gJp;
       spf=pass (google.com: domain of 01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@mail.slack.com designates 54.240.37.228 as permitted sender) smtp.mailfrom=01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@mail.slack.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=slack.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:reply-to:to:subject:message-id:mime-version:auto-submitted
         :date:feedback-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hB7LHd7V0EkTdUw1oR0edse377qGHhApVddYRRpXB+Y=;
        b=eNC6Y1A/fORDXUaz1KcfbXYZzPgOOUZ+8aCha8PJXLEBPicO5G+Nzi7YM6WbSVP2wY
         MGegLaPhftFX7StU/UFMFtiUef0xZx+DnWnXeurg2uxJl5AQaeJsexPGP2seERiecpQI
         uuzu3GbSY44CivR/ZaxC6sb5RNi4BSfA2dDzPE5AeF+aFaBkNpNXrncYSRnMAP+UR0Bi
         hqm00KQ7Nt1fUO/T1SIPjqpalLf9qO/ZZExt0JSDqI8D6LV2G0Xf7/63bJqCvW9y8qrv
         wx9aYmIf8WVQNXogKS+9aGfmshw3uoOsdRHua7EReSzYQRG0glRugqT/ckATJFhdMH6O
         RDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:subject:message-id:mime-version
         :auto-submitted:date:feedback-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hB7LHd7V0EkTdUw1oR0edse377qGHhApVddYRRpXB+Y=;
        b=ao8a5+E43DgjeDnVrVUzmmTzRIuaM78FiQLJYDbRbwg39t32W0CTHHJ8Jt//zKvRpT
         SU3dIGufv7SUC8mMRVY7wZZJ/sCWDIIDlzW72F4buafNwvnPJ2Kvwe28VBd6kUfrq/MJ
         51FW6jrq2G4h8sgKgu24iWcmERoKi74n2HSucBn+rKA/WjR76Blh5jpyqmHkODZ5enmn
         6ONrcCJN+DBvn/sc6HXGylkPPKmGl/RBs7FDCO7lJ/oUa3APQBSKOy02mTtCeAomiLNq
         Dqiiwz9YByM29dZjYK0+8MvFeBxelt2F6XtLT8OaXmsIGmA2aNWVbmoLfn2y4oggZSah
         l/hg==
X-Gm-Message-State: AOAM530pEMnrrl7jOG3hvEJ2OoJveUkDYsFnW0GmGdVUpdd0vjt9ZY4m
	FMpzY4fyPPNJlHk7IM28qiY=
X-Google-Smtp-Source: ABdhPJzVEc37aW5c32KfW6k4U0KZ6xyek8ow/xKsYmq0NxdAVeqw2l0/mefGP9akXHCcgfKZ4fr8fw==
X-Received: by 2002:a9d:2206:: with SMTP id o6mr14292876ota.244.1604998486261;
        Tue, 10 Nov 2020 00:54:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:a843:: with SMTP id r64ls2844193oie.2.gmail; Tue, 10 Nov
 2020 00:54:45 -0800 (PST)
X-Received: by 2002:aca:3687:: with SMTP id d129mr2236190oia.100.1604998485518;
        Tue, 10 Nov 2020 00:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604998485; cv=none;
        d=google.com; s=arc-20160816;
        b=E15pkT8DiFF8vSzB4MGtG8nHdfklRu6gOW3UIvNz1EYZbM5EZ/YH1xxWuFW2gVI6sb
         cMDv8376+BRjhCESQUR+a/NueBZiWusSf73ieqrCrupq0MwTgAXYMuxOL0oPqsVyjyRB
         k3Fo4nV/ncFoo6OJhJ+VADWNJqyJybQ3SxfEgsmSVPG/EVLj0ZX45S3VXqxCg9dJzneH
         qmActG+Ric56dlpk8d3H/0ADlEr2+AYSlKVgCmWEqOkPEp+Ug4dedqwMDjc1sJe9r4Hv
         7Df4xPNpOsShtV+UO+jj7QOTLDY2/sZpV/6sy4OrEdINSAWT5T2Xq/V7ggtOTOLDnmaB
         wzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:date:auto-submitted:mime-version:message-id:subject:to
         :reply-to:from:dkim-signature:dkim-signature;
        bh=9fKG2R3tbzp+myuvq+6zseTvVLMdDlWppISynDhJlFk=;
        b=PkLvGeifdk+QRYKLKm5ixzMDgpmF+3gjt8PKuq3k/VEIGOdh0FHtGqCGLNyoCz1U3t
         Dn55VFVARPoJV4qP3kPrtabB2wQN0BvR25FABh6a6rycgWP2no0nR9HHKDcEkLaV/Cs7
         3XdLpGrrbdCp1KLicxWXjFDd2NcSWSkAN43XjZjPB7Ljy3Q3EfazjsbVWClwjTb2ewIO
         7BDHpUvN/c8B/taozFLK9iJNF3IEm2hMkxPRGRwXSHU2Ot4IKRdW8cYCa0RkQUhX02T1
         lRfzN3KTdjQAD2bHTWKj6wmC7qh6OLhlzF5U6zC3eYnJYPDotqkapiFRRXLLGeH7rx7I
         QRfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@slack.com header.s=s4xolb5s7tnx6yxtrm4adems7glgsuyf header.b=DEGje0ag;
       dkim=pass header.i=@amazonses.com header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=LFhP6gJp;
       spf=pass (google.com: domain of 01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@mail.slack.com designates 54.240.37.228 as permitted sender) smtp.mailfrom=01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@mail.slack.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=slack.com
Received: from a37-228.smtp-out.amazonses.com (a37-228.smtp-out.amazonses.com. [54.240.37.228])
        by gmr-mx.google.com with ESMTPS id o23si710994oic.4.2020.11.10.00.54.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 10 Nov 2020 00:54:45 -0800 (PST)
Received-SPF: pass (google.com: domain of 01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@mail.slack.com designates 54.240.37.228 as permitted sender) client-ip=54.240.37.228;
From: "'Slack' via Jailhouse" <jailhouse-dev@googlegroups.com>
Reply-To: no-reply@slack.com
To: "" <jailhouse-dev@googlegroups.com>
Subject: =?utf-8?Q?peng=2efan_has_invited_you_to_work_with_them_in_Slack?=
Message-ID: <01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@email.amazonses.com>
Content-Type: multipart/alternative;
 boundary="=_45f9e277-0a91-482e-8663-9919c4dcf4b8"
MIME-Version: 1.0
X-Slack-Team-ID: T01EKPMA8FJ
X-Slack-Email-Template: welcome_email_invite
Auto-Submitted: auto-generated
X-Slack-Message-ID: ob-aaaacxce2pddaethgqjzdafuae
Date: Tue, 10 Nov 2020 08:54:44 +0000
X-SES-Outgoing: 2020.11.10-54.240.37.228
Feedback-ID: 1.us-east-1.kwXgUBITdY2w2KyDhc4cKlXKai8tXy8Sx50cu3XZbqE=:AmazonSES
X-Original-Sender: feedback@slack.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@slack.com header.s=s4xolb5s7tnx6yxtrm4adems7glgsuyf
 header.b=DEGje0ag;       dkim=pass header.i=@amazonses.com
 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=LFhP6gJp;       spf=pass
 (google.com: domain of 01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@mail.slack.com
 designates 54.240.37.228 as permitted sender) smtp.mailfrom=01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@mail.slack.com;
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

--=_45f9e277-0a91-482e-8663-9919c4dcf4b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Join your team on Slack

peng.fan (peng.fan@nxp.com) has invited you to use Slack with them, in a wo=
rkspace called Jailhouse Hypervsior.

Workspace name: Jailhouse Hypervsior

J

jailhousehypervsior.slack.com []

Join Now [https://join.slack.com/t/jailhousehypervsior/invite/enQtMTUwMjIzM=
Dk4NDIwOS1kMGVjZGM1MjU3NTExMjUzNTQ1ZGMxNmVlNzI3Mjg3MTIzZTRhMDc3NDgwODMzZmM2=
OGFmMjYxNThlMGJiMzZj?x=3Dx-p1495803348528-1478122999844-1486512921109]

peng.fan has already joined

[Profile picture of peng.fan.]

What is Slack?

Slack is a messaging app for teams, a place you can collaborate on projects=
 and organize conversations =E2=80=94 so you can work together, no matter w=
here you are. Learn more about Slack [https://jailhousehypervsior.slack.com=
/x-p1495803348528-1478122999844-1486512921109/?utm_medium=3Demail&utm_sourc=
e=3Dinvitation-to-join]

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000%=
40email.amazonses.com.

--=_45f9e277-0a91-482e-8663-9919c4dcf4b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org=
/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns=3D"http://www.w3.org/1999/xht=
ml"><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-=
scale=3D1.0"><link href=3D"https://fonts.googleapis.com/css?family=3DLato:4=
00,700,900" rel=3D"stylesheet"><title>peng.fan has invited you to work with=
 them in Slack</title><style type=3D"text/css">/* Global Resets */
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
t-size: 1px; display: none !important;">Join your team on Slack. <strong>pe=
ng.fan</strong> (<a href=3D"mailto:peng.fan@nxp.com">peng.fan@nxp.com</a>) =
has invited you to use Slack with them, in a workspace called <strong>Jailh=
ouse Hypervsior</strong>.</div><div class=3D"plaintext_ignore" style=3D"dis=
play: none; max-height: 0px; overflow: hidden;"> =C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0 =C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0 </div><!--[if mso=
]><style type=3D"text/css">.background_main, table, table td, p, div, h1, h=
2, h3, h4, h5, h6 {
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
528-1478122999844-1486512921109/img/slack_logo_240.png" alt=3D""><!--[if ms=
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
: 30px;">Join your team on Slack</h1><p style=3D"font-size: 17px; padding-r=
ight: 30px; padding-left: 30px;"><strong>peng.fan</strong> (<a href=3D"mail=
to:peng.fan@nxp.com">peng.fan@nxp.com</a>) has invited you to use Slack wit=
h them, in a workspace called <strong>Jailhouse Hypervsior</strong>.</p><!-=
-[if mso]>
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
nk_wrapper plum"><a class=3D"button_link  plum" href=3D"https://join.slack.=
com/t/jailhousehypervsior/invite/enQtMTUwMjIzMDk4NDIwOS1kMGVjZGM1MjU3NTExMj=
UzNTQ1ZGMxNmVlNzI3Mjg3MTIzZTRhMDc3NDgwODMzZmM2OGFmMjYxNThlMGJiMzZj?x=3Dx-p1=
495803348528-1478122999844-1486512921109" style=3D"border-top:13px solid; b=
order-bottom:13px solid; border-right:24px solid; border-left:24px solid; b=
order-color:#611f69; border-radius:4px; background-color:#611f69; color:#ff=
ffff; font-size:16px; line-height:18px; word-break:break-word;  display: in=
line-block; text-align: center; font-weight: 900; text-decoration: none !im=
portant;">Join Now</a></span></td></tr></table><div style=3D"margin-top: 16=
px; display: block; border-top: 1px solid #E1E1E4; padding-top: 16px; paddi=
ng-bottom: 16px; margin-left: 24px; margin-right: 24px; text-align: center"=
><h4 style=3D"font-size: 17px;font-weight: 900;">peng.fan has already joine=
d</h4><img src=3D"https://secure.gravatar.com/avatar/bd1578dc29252dc0fbe135=
8b4daf5138.jpg?s=3D72&amp;d=3Dhttps%3A%2F%2Fa.slack-edge.com%2Fdf10d%2Fimg%=
2Favatars%2Fava_0007-72.png" height=3D"40" width=3D"40" style=3D"height: 40=
px; width: 40px; border-radius: 4px; margin-right: 8px; " alt=3D"Profile pi=
cture of peng.fan." title=3D"Profile picture of peng.fan."></div></td></tr>=
</table></div><!--[if mso]>
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
<![endif]--><!--[if mso]>
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
<![endif]--><h1 style=3D"font-size: 24px; padding-right: 30px; padding-left=
: 30px;">What is Slack?</h1><p style=3D"font-size: 17px; padding-right: 30p=
x; padding-left: 30px;">Slack is a messaging app for teams, a place you can=
 collaborate on projects and organize conversations =E2=80=94 so you can wo=
rk together, no matter where you are. <a style=3D"text-decoration: underlin=
e !important;" href=3D"https://jailhousehypervsior.slack.com/x-p14958033485=
28-1478122999844-1486512921109/?utm_medium=3Demail&utm_source=3Dinvitation-=
to-join">Learn more about Slack</a></p><!--[if mso]>
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
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://slack.com/legal" st=
yle=3D"color: #434245; text-decoration: underline !important;">Policies</a>=
</span></td></tr></table></td></tr></table></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5=
c35-000000%40email.amazonses.com?utm_medium=3Demail&utm_source=3Dfooter">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/01000175b15d52f3-97f15e86-058=
a-4396-b74d-6634837c5c35-000000%40email.amazonses.com</a>.<br />

--=_45f9e277-0a91-482e-8663-9919c4dcf4b8--
