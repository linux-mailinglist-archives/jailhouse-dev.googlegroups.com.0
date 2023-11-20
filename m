Return-Path: <jailhouse-dev+bncBCLNDZG33ILRB67F5OVAMGQEHCR73FA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113a.google.com (mail-yw1-x113a.google.com [IPv6:2607:f8b0:4864:20::113a])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B927F0BB3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Nov 2023 06:47:41 +0100 (CET)
Received: by mail-yw1-x113a.google.com with SMTP id 00721157ae682-5c9e60ee210sf8091327b3.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 19 Nov 2023 21:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700459260; x=1701064060; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:x-original-sender
         :mime-version:subject:message-id:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ycWs1B26R3dVtqMs/OzTajFFdPqiEqMyQUcYggrRqSk=;
        b=u75vb/qVGlPMATO/qroGfrsoPvEts3xNHbpvt2mkXS3ecReYhpSvYe87rHfEFVX1rK
         u68e1djipYrIhPV+IbeHwJQ7wCIP3+ldfSlrhujQx0ClXxmLGxLV8bWoN4s4RJPtKAHF
         8R44Pm4Xw4hrVhVxP5eOU9PzqWWcgV9OJDNCXuVDz3jcZglQ0ei4W19DtUrBzzFh2iJv
         KZbuaWaHTEKQOxIn4WovdNjYxtcyFmwBTtnG7nC2xtCBL0GnTksUgD2ov59uOUhctO+Z
         urxSR+ZdUIA08W2qHoB8ixtcKnQmR7cO1S85ebxNUqOJNVKt7Em3neJM26/WlJt9tO6T
         ObHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700459260; x=1701064060;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ycWs1B26R3dVtqMs/OzTajFFdPqiEqMyQUcYggrRqSk=;
        b=UDubHn/7jJNUcb1I/PWPoHka5SgzkgmHVx4UYQK3tVTBpB98d5Pw2er7su7w4gmCxL
         8nKREF1ED+dFceGmv8bySFguX4udZfxVvKt+GpFf5rWEbq/I4hs4FWkIym2nudrjzRdL
         8ld6DoD3+P9AGCnNtw1ThHQerUXNNFVmwLcah4OZGxpXpNWayh2w+25Xf7Z3CI6TwuVP
         uskGa50IMc3qyMYu2SusbZc04tEzzqiDMGt58v+T2KdlprGEAc9hxl2qkqBMCzsu8Bs9
         BcZCHAl97buH/NdgB+k6sFXBbMZzu6yF4uPNNHb4p5i5oyzn4azkJtP9zvBEUcBbVC7/
         MUFQ==
X-Gm-Message-State: AOJu0Yxqk+oxJ/4WDZMAtbuU4gDBYUPoHaXCbeBCzunnRSBQeP4velP6
	KuFOnly0GrYV38nCShcNicQ=
X-Google-Smtp-Source: AGHT+IEoWieUNOK9k2O2yGva3t25ggARCFGEZ1j9FGvb0OEfaNlMbEadlwl/9Wc+grUqUEywLMtjyg==
X-Received: by 2002:a81:9c42:0:b0:5c6:3c93:cf1a with SMTP id n2-20020a819c42000000b005c63c93cf1amr4024765ywa.17.1700459259943;
        Sun, 19 Nov 2023 21:47:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:248a:b0:6cb:4f0a:aeba with SMTP id
 c10-20020a056a00248a00b006cb4f0aaebals1027757pfv.2.-pod-prod-02-us; Sun, 19
 Nov 2023 21:47:38 -0800 (PST)
X-Received: by 2002:a63:f90f:0:b0:5bd:bbe8:e393 with SMTP id h15-20020a63f90f000000b005bdbbe8e393mr1262152pgi.11.1700459258425;
        Sun, 19 Nov 2023 21:47:38 -0800 (PST)
Date: Sun, 19 Nov 2023 21:47:37 -0800 (PST)
From: =?UTF-8?B?J+W8oOW5sycgdmlhIEphaWxob3VzZQ==?= <jailhouse-dev@googlegroups.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
Subject: =?UTF-8?Q?arm_cortex_A55_support=EF=BC=9F?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_11402_467967781.1700459257500"
X-Original-Sender: 2022280902@qq.com
X-Original-From: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
Reply-To: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
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

------=_Part_11402_467967781.1700459257500
Content-Type: multipart/alternative; 
	boundary="----=_Part_11403_1596129393.1700459257500"

------=_Part_11403_1596129393.1700459257500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hi All

I would like to know, are there any examples that are adapted to arm cortex=
=20
A55?
Or are there any SOCs that are arm cortex A55 and have successfully=20
transplanted the jailhouse program?

I saw that A57 and A53 products have suppressed jailhouse applications, but=
=20
I didn=E2=80=99t see A55?

Cheers,
Zhang

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n%40googlegroups.com.

------=_Part_11403_1596129393.1700459257500
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Hi All<br /><br />I would like to know, are there any examples that a=
re adapted to arm cortex A55?<br />Or are there any SOCs that are arm corte=
x A55 and have successfully transplanted the jailhouse program?<br /><br />=
I saw that A57 and A53 products have suppressed jailhouse applications, but=
 I didn=E2=80=99t see A55?<br /><br />Cheers,<br />Zhang<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n%40googlegroups.co=
m</a>.<br />

------=_Part_11403_1596129393.1700459257500--

------=_Part_11402_467967781.1700459257500--
