Return-Path: <jailhouse-dev+bncBDH5LQU54QDBBVXMTKFQMGQEEDMTHDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1877F42BCE3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Oct 2021 12:35:04 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id 90-20020aed3163000000b002a6bd958077sf1705377qtg.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Oct 2021 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8zftIlTihIexYx4Jn8pLrQczaRn39Fn1gKwFWPYyW0o=;
        b=SQHCFf0LbJxMgCTT7LR47SbHiRJ3zjm9PPXx267xfwv+W/bylOhaVgXAC9hijoeML+
         oDqfa4B0QFMPnrCNQln6vw7j8s+VpimAV+jltifSOlU+6oJTIcQGx+vutRiBgMTdDFfq
         K8gli+kbCIT2PRgj7d3GaU3FlfeTKgy+/9rF3dDwkxQbOLlF1NNkzWKi3Rm1lAfhY83m
         vdivWnZTXPW/7IR1Sp0qQaBeOFsHQss4x8zizZQD5C7rIBYfFvLGiVEavHlRkBJmcR5Q
         sMSlSutPVyNZ4P0zLk15OEufuaDsYV1aXEZn8No9AAJPih3+UxVuM5lcT0nfoiIsdAip
         jzqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8zftIlTihIexYx4Jn8pLrQczaRn39Fn1gKwFWPYyW0o=;
        b=kW78wsjHgRbrfK+7ciSFhz4UMoVXtDY/f3aIOodpEsi+Er+yYItkj0Z2Q/dd/NHPsL
         lShlTawz+j5tTgTxnjV/STr0BYGwJ5CQ+TqSltFNmOi3Fjc+P9NZ/5UDQc6+zyfZbQM6
         6XGSuP1L1ZBp7aRszvBeVIMQB5d8aTK2cXiVrM8oPhr6hx0BCjr1gXMVG6tpTafwyhkN
         V7Z6K4tovAl1n8Q+A2TWJ9AL0f7Mzip4LcPh8oIoRApWsLW3QDZuPZuw7Z38Tp6pvxNC
         xvS8xQQA/EVZi+qKSaxOvlr7OBKAdlEnv/3bRVOYiuoMs2pmc6Zoc6ZYAAWlGFlUEI6u
         7Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8zftIlTihIexYx4Jn8pLrQczaRn39Fn1gKwFWPYyW0o=;
        b=fqECMs3UcRmFL/3MiKm/vTtwq0Ud6mtNjabjntonao/uI0VKJWEqKivP4Aw3wfNGBP
         1N1Y04+t9wdvV9NOlj+bsSQB4KDKtAyG0EngZ3shb36pRVpA38fdMuYYVMGUrWkwxMgC
         1yPaDePLsq7bF+GnOW/eh9e6bi2mSjysHtfCaDQK1liNswr+SCzcgAZOSPeqD1lYpcU0
         WxZ4xarUZk1Nn+66E9qRPYElnbg4mYpt/SChgd6+A4ARVIJ97HNDX2VyCteZIom0HlVo
         DjBeUo/Xoik8Vry5/m8rwBuoapvNOtVNMns6bdVDH8miZ8wi45QQKxj+Z0UC1vPg7jsv
         QA2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KYqWDR6svUbB6MQHY6s93eW3HpQ9238DSRX/cYic6goOD2uE4
	dMja90/Ri4lL0RgbvFOnIYw=
X-Google-Smtp-Source: ABdhPJzZLkgzX7Fn6OnLT7ktZuM5IJVswOhsIRaCyEWsGay/bw/8SzrQYOt5nzXjs9DlqZEcbW62Jg==
X-Received: by 2002:ac8:514f:: with SMTP id h15mr27863921qtn.340.1634121302983;
        Wed, 13 Oct 2021 03:35:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:10a3:: with SMTP id h3ls975474qkk.4.gmail; Wed, 13
 Oct 2021 03:35:02 -0700 (PDT)
X-Received: by 2002:a37:6c06:: with SMTP id h6mr24461506qkc.201.1634121302201;
        Wed, 13 Oct 2021 03:35:02 -0700 (PDT)
Date: Wed, 13 Oct 2021 03:35:01 -0700 (PDT)
From: "luigi.d...@gmail.com" <luigi.desimone3@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <23b3ad44-6475-40c4-a099-14c065a11c9bn@googlegroups.com>
Subject: jailhouse pre-built image for QEMU x86_64 boot loader issue
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2178_510036620.1634121301577"
X-Original-Sender: luigi.desimone3@gmail.com
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

------=_Part_2178_510036620.1634121301577
Content-Type: multipart/alternative; 
	boundary="----=_Part_2179_322034450.1634121301577"

------=_Part_2179_322034450.1634121301577
Content-Type: text/plain; charset="UTF-8"

Dear all, I noticed that on the pre-built qemu image for jailhouse demo 
there is no grub installed. I need to boot a specific compiled kernel 
version on the qemu VM, and I want to ask if there is an easy way to do 
this. Thanks.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23b3ad44-6475-40c4-a099-14c065a11c9bn%40googlegroups.com.

------=_Part_2179_322034450.1634121301577
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all, I noticed that on the pre-built qemu image for jailhouse demo the=
re is no grub installed. I need to boot a specific compiled kernel version =
on the qemu VM, and I want to ask if there is an easy way to do this. Thank=
s.

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/23b3ad44-6475-40c4-a099-14c065a11c9bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/23b3ad44-6475-40c4-a099-14c065a11c9bn%40googlegroups.co=
m</a>.<br />

------=_Part_2179_322034450.1634121301577--

------=_Part_2178_510036620.1634121301577--
