Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBEOUR3VQKGQEU25HFJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F39A9CCC0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 11:44:49 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id h3sf9442797wrw.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 02:44:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566812689; cv=pass;
        d=google.com; s=arc-20160816;
        b=W4Tp2RCiUEUpjOzVkUfi6T1IG2ntvEOS127y2vyUf2Z6ku9O2czy2k4vvs25iGh6Hk
         +l4vHSgtl7BcPVp7q+FtlnwIR4QQawtA1rvt4ZLMOEEMn2bfMiIQiD7eHSTfQCdGInOc
         fMTebSomf5K1AsCfNusyDCqBHPiWrEUcparHpnA6lYXV8+1X6MFwWC3JJmblpP/aGPXH
         ilEiut6+YFfEyKdxUv3xqFxtOVhQUAkoiXBBg6LCVQDh/rPKlTjNuRlXrEKsmvlu1r7G
         4l78tCTM3we9bi+ekRPiTrhNXi0g6c4HJVketIqG0sEclA6JE/UEUwnrmCcDUV/XvkgB
         fjng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:date:message-id:subject
         :mime-version:content-transfer-encoding:from:sender:dkim-signature;
        bh=h0UqF9VyTLii3f0hhSR7Ggp1443dVYY/1c0qp1UtgUQ=;
        b=isz57XufWpu8HSHVWjWPSBrLyLc7ab2Nm+vxb6nmvSuWDczH6/D5hB9Rt4Wi1jPAIR
         d4nBBOS9mrzHfyy7RtYzstyCEVERxNrr0aq3o3l5DnddM9bCp9uZOWqIWz3BVCsaCCJv
         v28YqslBaR57xRRzx1JQxerOUzz2qcwr72HqDkJ3nMIwEqRYGDbVG9M5n05qMxt+172p
         pv0aK/g1kX7ycQ4MNPW3mVtsDH9bEz9LCMaWkRWd6CyHsKvSv+h/oB/DPtkFSWSmOH3A
         hrh66yb94qdw/tD1D7Atb0X244AvGS2y9eIBzLaLOKHIjfMUfasO8c5f21isu5hPIFdj
         ml7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=j6oDLmOL;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h0UqF9VyTLii3f0hhSR7Ggp1443dVYY/1c0qp1UtgUQ=;
        b=Kgneo5xC7DqiVles9L0W3H2aNtfvyKiQUQpcg+0SdjtavwEiC2jH0AkUT2WREyuNMN
         0qy/qEFr4HYFrSgllKwpNNfL6jNXUTbu/JeGWgYzJd4POfhLqcICB9yiwo+p/4tPkMZW
         UCnlo25vABaFZw96XPtV8Lh856dpEoMJWIVHM0gtEp6SPYnUegB5km9m6PnojwQNGii3
         wGy8gwzfCusaM4FvaNF0sGmGPAuya2rWVjQVXjhkQFQsMjiU+jPQz5jAZMDQVJtD7xQ3
         dUtDvLn8VHMjoFgMAKmrLBqubaSd5Njaq6V2KvNByr3Xsy4jL2NaMCvToSGLmGoLgA35
         ouNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:content-transfer-encoding
         :mime-version:subject:message-id:date:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h0UqF9VyTLii3f0hhSR7Ggp1443dVYY/1c0qp1UtgUQ=;
        b=GzUzhnMoWsZ++YjfGU+41GE/w4R7Juum93AxU9NMJmgQtixtT7bv5necBfq9DOMyiu
         yQdfd57NFo7Q8rWbwUjjzGoOmDWR/en+BjoScWUsA+2iUYRN7Xh7D+DAwH1wHUt5xYL9
         FD9sjcsX50m2FQGWOgDQmeacWwZTm0ls0wAJeA7ChPS3cYD6LGNCYPokRjCMS4DNs5T+
         gOwRTE3T3Si8oKevq/+ezlBqYVtI1z3PQp6NoqFy5PzyR/EN/a/yLcxpWxxD09afbwp1
         Z/DGKY8PaMm4So5NYtfTp0my6uXCtsF6mYp+GcnP1w5JUBzo76gW5gysbHw2LBBWvGTD
         43bA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVwA3X07ypKdVs4khQKcHZWcslvi7L7tfkwaSyVMJ6PiW5H7myr
	W5xjqbKDtgoA5iyNzR5+Hpo=
X-Google-Smtp-Source: APXvYqwCJDJTQLqonKd9RB2jwcHCjTWxqBal71MA4dFLotQLTP17znvkuclqJAqNt2Q7MiZBQs/20A==
X-Received: by 2002:a1c:a383:: with SMTP id m125mr21040328wme.57.1566812689365;
        Mon, 26 Aug 2019 02:44:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:283:: with SMTP id 3ls6056988wmk.5.canary-gmail;
 Mon, 26 Aug 2019 02:44:48 -0700 (PDT)
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr21592223wmj.31.1566812688628;
        Mon, 26 Aug 2019 02:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566812688; cv=none;
        d=google.com; s=arc-20160816;
        b=NTe+ERq1QyY2I0mSfHqpPZe6WxhkDg2rPfADopwrNMyPkag6+7mtSG36F1YGDhUIxZ
         jZbY5tLOjbmTL2oXdOv1cgENpWH76I4Zq5mhxpdYeOy8X+v+sx6g0iMrDCX1B64fRmix
         tIZ+raXXp8khZqyBbH0LAraGv9VTKMQpFYS4YFRu6WAotbp/x3bLRRk3ymElIVW0Ccdm
         HbSdzxBm4EVyDVT3IQLjpyDeCI084vlNjgtByqm25dWbSs0+AHqxfLRtrlWPRwktidWd
         KNB+s9jutn09U1OlB15LbEVazSTZsJcOvXeOa6dyx6eMRUSGCzDjE0qtCqgNr2t6rp4g
         NJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:dkim-signature;
        bh=lycfNIkvfx+mtQSr1mfwORGNUIJ0CHMQI/9G2agNobg=;
        b=Jk4OT7qgpHEByQdWNjirH6tTEPNZFPNo0osPM/U1U/UnW3HoXb/e6ZtsyujeDn/yds
         kx9XE9Lq+1FR8VQhO+68NaAT92tygM8hdIBvO8uTD0Pzx3oOwYqYstjkuftnAMP8L8PD
         hAXlQDfKvO5iJa/0B+VBZreQtWlFXGVzosCRepTCh1uN4sBiApwqiOK1+N+m3ifpQLrQ
         aWekvM6yqwc7a9vnG++BsEj8inucVwKpfa8RPyP1SheskjKhyFV3nOxBDhsaNY1tNDEh
         EiLrkZlTp8W2s2Z+ZrXrTTJWcSJ3uUD9K7f5nqYxk/v1dh/llZqobV6xXf5tJrJpXlYG
         70fQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=j6oDLmOL;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.19])
        by gmr-mx.google.com with ESMTPS id a10si420133wmm.2.2019.08.26.02.44.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 02:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) client-ip=212.227.15.19;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1iHljr0n0x-018GWF for
 <jailhouse-dev@googlegroups.com>; Mon, 26 Aug 2019 11:44:48 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: IO access in jailhouse root cell
Message-Id: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
Date: Mon, 26 Aug 2019 11:44:47 +0200
To: jailhouse-dev@googlegroups.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:oKvcZAweU54Rl6My7a5d424Pi+ickR0mMuF0HrklxsFZnCU9cOL
 UgbVIgp86PZQyknj9b5fnp6A3WpmpFybxJ/tjSYHxo8H13vzfgNbdyilpeqzT/kqllGKPyc
 JtnAxZKQNJkc8Akj0yLYDFZzW9AIaOvUN4+1TUgYKzCiR0NP0Eut8NlDITojMsMmy/R1KjR
 BFqr8+Tso64PJi7aGJRxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ci6ijyCI/c8=:PHbwBFrKMHUkxu8tRGadW0
 1eF+UNHQQmClzQYBLJSFUE0ec5OCM47I53yOnjTXxXO4uZJfqCxXgjsYaVD28NPOzmxx1kGBH
 INrP/rbGeOFhsaJgDAFh1YlDr2UX9NU7b8P7cP4zNrFwJDdaXRVboFmzJamqxYPEt4pp+Cd5T
 awTP1arSvZoVwRZHUtQU3JOBB78usvVZYoL3LRbyNJDjQLJDFGAFu3dq69BJzPMLPzZAaS4al
 Urxvgm0aXdCxFDJxkDwrMuvAuNW9/e/ZcQtN+qX3Stjz/A3JLPUg+2+YxjWiRQCdBeY3IWPbu
 bLGngAY4UwjuCKXruWbtGSc8zWDoEJ+9RqhXmgkktJxpSV6gMiwDGsbYbvM+LdLE5iuJm0EuL
 0ioGs9zJwLqo+IJhjH6ZL2lon3eM7mBoJPZgmpDRWnxb8DtaEL6DwmXXXtIM6skte8CwDNXP9
 YSv0qVTKrbs5X3g3PaiLI2WHNp/Ol3F8L8ehFd4JC10LXEjTckIwWunFqtmOjLsL7e9dYsXvY
 dCY2n+TKrGnSSzPD0KMmjd87S3lWRLvMCYktfQvZCeOEOcYYZX14ItI3nuWxocl6JKhXUnmRJ
 KUhnESMCgrlf6jQ8GS6JhybzbAiUGJGYsdzMwwjpb/JLarKQ6slmgCijQwmPfhktQMy2c4KMy
 VsKDNxMFnvndOott/gSYo0dyCqU+GEsPqUYXggGYtiLFcGDx6XKBM9AyI4iQbcDEwJcsE+jMJ
 pieBvR/oJjN8gBT/IM9ZKc8QB76J1bFiGfiiv28ojJp16H+hfO3boRxOMkGWEjltSLFIDa17s
 zCFl3gjGSPWGzrmsv2wS+u/JNP0l8jJCzg40fB3m/9eywq8JnwGndAdTeJ/IuI25KcptuTS7S
 jfnjrfdTkuHIbLAX2a07DVkX9vBUrC+zGOaoUYYhaZZoDPX43G6EjB6teLZBquoJPAKR6fziS
 DwXcpkrtaFv7NuTkLCalcCT99bU/Cb7V53UAgscSjnW/esGYvioLP7nloV054U7XsHaCSmImh
 OFoc48XvPJcCzMqwySnE/TR6ewBbuJtVEC3CtA5mzlwxNbMuTAPAyTngNTTbGnSUjFOVl0mgI
 8oOMFM9w4tz9ye9j56a0KjLvydlcKJVj40lg/egYRWi2ukhDhoeUfm/qayzdBG5VFcTXSdaY5
 tU/pU=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=j6oDLmOL;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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

I=E2=80=99m stuck with a problem when accessing IOs from the jailhouse root=
 cell.

Background: I=E2=80=99m running jailhouse on a Zynqmp ZCU-102 like board, w=
ith additional peripherals attached to i2c and SPI bus. The basic Linux sys=
tem is Petalinux 2018.2 (Kernel 4.14). I can run the zynqmp-zcu102-gic-demo=
 and have successfully extended it. The configuration for the root cell is =
zynqmp-zcu102.cell from the jailhouse repository.

Before starting jailhouse I can access my i2c and SPI peripherals from Linu=
x without problems, using either kernel io modules or direct i2c access fro=
m user space with i2cget / i2cset. Once I enable jailhouse (just the root c=
ell, no inmate configured) access no longer works (e.g. i2cget complains =
=E2=80=9Cresource busy=E2=80=9D).

The i2c registers are located at 0xff020000. This memory region should be c=
overed by the first entry in the root cell config:

		/* MMIO (permissive) */ {
			.phys_start =3D 0xfd000000,
			.virt_start =3D 0xfd000000,
			.size =3D	      0x03000000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},

Interrupts should also be delivered to the root cell:

	.irqchips =3D {
		/* GIC */ {
			.address =3D 0xf9010000,
			.pin_base =3D 32,
			.pin_bitmap =3D {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},


In fact, register access seems to work after enabling the root cell, so I=
=E2=80=99m suspecting some other cause.

Any ideas? Are there any kernel patches necessary for the root cell kernel?

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/76008E6A-1653-4358-AD31-4C8D332759C1%40gmx.de.
