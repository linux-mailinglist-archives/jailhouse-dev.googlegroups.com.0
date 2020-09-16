Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBF44RD5QKGQEIGCTDUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3226C319
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 15:07:36 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id o13sf2211512ljp.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 06:07:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600261655; cv=pass;
        d=google.com; s=arc-20160816;
        b=LOhMa+id0cSskfl0dTLwgiuJM85A6Ous3y7dowviiQOi8Os4cbMmTCNtkoPcHw/BoL
         t+Hjn/iFuT0/PYgEvW6jUPl/rWlDknOE3Oy+lvvxup26IXpjH/moTVu18wwfTsyWuv0f
         VCVmFo68Kr6OK2IXNOSub7CT8+MNBrtpK1PxP3GIsRAioU2DEZ3Au4EA/iC5laDUKFJ3
         su2X5OXJZDbCGLQ2cSNRLYZSYSLkhulGcJxVHDSpjML31nRSTIJXgiMcnlpACfkk2IXy
         LGs1W/iDNKyi+FXMKvHXwutHb8dpJHiyFk0taAFW2WtME2V+aoXWL+orTaL9y6iJNYuJ
         FBxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:cc:date:message-id:subject
         :mime-version:from:sender:dkim-signature;
        bh=YiSQX+2rJFPnfyHPo/IxKloRwuCBHbfIimQfopRywNM=;
        b=oRDgfOs6TPlF3++eJJOgP2q7/DBCwzQ/lrCJD7D0KVYLpC2MsfbKu6MJ0QnWrkjelX
         at+lQTPckgbWEd4rnOUOMNXuD+eN+OfgXP1gPPvuYUnoGjquH2aeVOVvbY4SAnn000zN
         LiynmNm0+VD53BSaKyvI6DaxWD2D88lVyv29BGP/fnxXigtLB5koc2Iu256jl31KIy4o
         dBnNVvX+IAR7AauRI+RwjBXwsCKaVC3NaMB0kZvFOLKVwpib8GkzNdczLjhUT90zfWRA
         5lh1npE9MLK9gLVOLWNokL6rol/+txgHup4uf/uPNduTIL5PEJ7BJNxzDT3YCPlrK6kF
         SABQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=j16hu+ka;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:mime-version:subject:message-id:date:cc:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YiSQX+2rJFPnfyHPo/IxKloRwuCBHbfIimQfopRywNM=;
        b=b8useV03tDsLHkS7kFrMnoelFaf5wyLx3Qg9tmzc5rOVnLIhETDp1RL8CdFP1L46k5
         uM72w48HB4BukzOaQn1Qdb2UgPiRc7c86wyNIXbsGyYxcx2dS42fGIT6ck9x/oa/6VCx
         BXDLTV5RGUlz+KagvABxCu8FgRFw7acIsrWAJ28zlspPMOIJmClG+92hAqvxkE2xfw81
         I7LniyP7d+udIp4sZ8FV0n2I9sVyiEnOLxT3Dsf0T0nF2zpydqE9Dx6ao+5bvpx1SAkx
         MNDcxwMWmS+uR56d8FiRvcBPEioGaJpXsZYbBMbzJ64TfSnpzKTvIgSdHWu9f0xIjCYJ
         56JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:mime-version:subject:message-id:date
         :cc:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YiSQX+2rJFPnfyHPo/IxKloRwuCBHbfIimQfopRywNM=;
        b=gtjmJtNmTqgw9cIQ9p6x17a4IJzEbvtb3km7XvVZKWGAK3sTwoe9UTv1Q87fLiet3O
         gMVqANVLi5B8grYYQjx6nNMpoCwY66CgI31a8VPPkebcePm8ZjJYj1WRdIKTjbUm+n0R
         0zCSU3obzVfXvMY1gbquGgB8Bmzu6WlmzLARghGxNaY8ZpeHefrtc2iWtGqdvmp9vbQv
         F9XjqxHDJxw4CFYL416CsKamFEgP/1fB+/Cpq81m308MpVFaEmU2EpR+HJy9jiP4qSSl
         HQGyXrTTJ4WnygDEbtgXauP8t3CDH23AU05KjdgAnGZEXoBUY587YSK37vo2KawLRhH4
         ISDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531LXGsbjhdJNsKgE/v/btE7m/XPr6PUkqeUtbZXRX9V+ccx/MU1
	i67zNZmHtBiIXyAvUx4HaDM=
X-Google-Smtp-Source: ABdhPJwVYbbnyAPYSEXCp0/cHns1R5pvHV7vCiqGhmi4/KMYqxFlvwQKeRGoZLHBPrX7S9iaqk6A1w==
X-Received: by 2002:a2e:743:: with SMTP id i3mr8154490ljd.113.1600261655548;
        Wed, 16 Sep 2020 06:07:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:93c7:: with SMTP id p7ls290479ljh.11.gmail; Wed, 16 Sep
 2020 06:07:34 -0700 (PDT)
X-Received: by 2002:a2e:a587:: with SMTP id m7mr8552291ljp.133.1600261654205;
        Wed, 16 Sep 2020 06:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600261654; cv=none;
        d=google.com; s=arc-20160816;
        b=PWsiEwfNL97fE6RvaUGlBBDfmXKO4ezbf4CTDNOJlbxLtrqy7K5dl7j2WVbiuxcm+T
         qcIyDFlfvUr3HTLw9xVvHVgnz2ztovGa4LvKnSiWJnwZLcInyX73RJp/zpMxdNsunQK1
         JC8a9YixAD6qEyUhVa4+CMvEzE9E7x/AprXIgvs0UZmZYndfgR+yHHtUb0zZFIuqPrD4
         x77AANQqzagr/5QVYSw5bjmb2yVCS34Ja9CjrJuo09FT5TXzFM0OwLB7i/FjcR6dCxEk
         LzdTRMnia4b4sUIN2XofI7GPFqkxE6QgKiGFhmWfjtPDuS/JwwN2os59icu8kBL1KVry
         0zcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:dkim-signature;
        bh=qjcE6pszkQT8che7QaGl9z8/lepK1/3q9TO1QPkP+88=;
        b=y5+Pny30YKHHLXyKVDIE3z2TJ/KiS8QsWCxn8E/Khb3D1ZiehHiBVX7Hs5VCzX+vDx
         IzuypW/FnhQWkXUAjsw0xZCE3LYHR7BYMI74aEhpsjjjtWFEU/bbbsgrjHnaTo4uxPdo
         B6hni7AtukcoElnK8jqhQ2EfEXkFnk9ZRN2KqbhX1/hHRFxcaZ12YCXWN8EyAVwu4j75
         HX1ThJAnfxilvkd0LQtfClBlbUR6VYFARF9anPVEyvfNqQkf0yHdnYeJfshAVMDZErI8
         fcHjrrBeAdPHOuV0xpZuMpmVizaSPlhC732Q8mZrEwOPgJU6dTF00yv7cOm+dZl5hgwe
         IfQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=j16hu+ka;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.19])
        by gmr-mx.google.com with ESMTPS id 21si519006ljq.5.2020.09.16.06.07.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) client-ip=212.227.15.19;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from meter.plexim.com ([212.126.163.234]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK4Z-1kacEu1uzZ-00rFx4; Wed, 16
 Sep 2020 15:07:33 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: [PATCH V2 1/2] arch64: Make sure SMC and HVC calls don't have side 
 effects
Message-Id: <C9905595-F658-4431-AF1D-F9ECDD38A20C@gmx.de>
Date: Wed, 16 Sep 2020 15:07:33 +0200
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:svuWjNZpw3TfuQ4sj+dCYtUZ3Vg19bGyFaWHB4blnN6EZc0WqfU
 VFZWAQj0zm6n1AB3+sJULepx9wupGUofkZsP8KeBTpcCAHqmChVk4V/z3DmN+zzydZLVjW+
 V08CU4L9ZcVzYGFpBDNaQYiAhjq1tysxnZVLX5IUtHLsBj56MVnJ7QGgLjoyhOfOmAShAHA
 uxAldPunsaiBAbKLsx3Lg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tAqjCFnxIjo=:PXq+yrGSY5vOuo2VUciEwz
 UQpBCkKTztOPGjGoXuJV8Wrr68JdpHPekxfOCoqf2vV//vgVGVT+lMWPiwr7pHIid5lUMB/1p
 TJwxA0pq1JNSaqNzNqVX2LR07U+BN04+5XcQFJvXubMR9Q/vk7l4vzFv9Mxm0EVOHG6vVhj2w
 To2B6mUz4MaobG0IzLpY95e34HdzuENfbvBPeWYjJbS6cF3O3gAfB9WHJbFObylQW00rM4kqb
 VlTbqQyzsQf4+AiLm+C9KkJLT+Tn2M+AyjMY9imJqygjJIqWTAauVShGiuKhDFaoxGV/I8hwa
 6e6GPkKBzlzHdj9LbZ2OfkWLyrzpUdoPd/aTirScIfMRgy7642Uy4sGiOGzvt2PEoY11NcQCp
 LPACbSHKWtT4NPlX6rT82NzUAT07XGhrOkSXMDTaNxfpVgX3vQjlNxkcnQ7YGBs3UlVPcrc/B
 Z9tveaME2x+KDDFqvehS24el3NAqZD9o6B+04odvhjEdsqPZI7PUG/jkMaBYplfgWnfdFOd1K
 98S+0qsziz2tHdvOoIJ6XWjKvKtw8ez3FvkvmO8GP/RUIH8bVvhmqhiiLOwprcZ6gnYHp4+yP
 Eof455iRIXrOUQ8jyEPBs0G7VTysUglw2W3GNfQvbIGmiEN7W9a5rT3EKOaRVcz+yvoG4g5Ei
 2Nnuw8CyEgi/SYC/UbLQejGwzd1x94wqrcJBEfVOhZ5O40PLDIoOHFhYN0Br/JzaQCTYW9Jjq
 F0aqDvDaWqRmnpvyRMT70gvDwVQplx1PJtV1K6ohpZf/eUhgkWh5KPtXgQ0frHWsHpQAg8idF
 HPqQTjFj5Hji3UbAx3bA3DtmblMANQUY/o4TiJf9ebuxGla5yrmHHT/Zg8ZaGodZJr78/PaNm
 5eawU7r5jRmwFIA4jF4KVZk1sJtTJXRzYuCn+zJG4nTsueDyYxYQTzzjOMy4RnoWMvRzRCenB
 9plSka1ocL5Um58jVOo5pOOsk8TYzaoNOJqdkUl6rTwbV7K1Z7vsz01r7y/SF/MZFjR+kiU5b
 KUOJSw0byjdfNZ+EtleujSwzuZIKOQcEPcGyG9ZPMxTmrrXCaoDOY/ZqiXa1Am6sDmNbLH9OK
 6Mp0oGeqny8IYOrlL8ay40OmJT87Hh9NygTUhIiPEiYEADBNgLjj7epN9Spv83Ct+HonoVU5k
 63lPg2NbSWLXmvOucIC3jhU7cJkyNwvqiYuxTBMvqiRrnkAYEMTQFkcq4AK8VfXoCHzlDRwLg
 RD5KYz75KoTZ3UAjnJOIBaEe9iOHiwFz8wZ3bEw==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=j16hu+ka;       spf=pass
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

SMC/HVC calls may modify registers x0 to x3. To make sure the compiler
doesn't assume input registers to be constant, also mark these registers
as output when used as input.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
---
 hypervisor/arch/arm64/include/asm/smc.h      | 13 ++++++-------
 include/arch/arm64/asm/jailhouse_hypercall.h | 20 +++++++++++---------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/arm64/include/asm/smc.h
index 1a5d5c8..c80fe15 100644
--- a/hypervisor/arch/arm64/include/asm/smc.h
+++ b/hypervisor/arch/arm64/include/asm/smc.h
@@ -28,8 +28,8 @@ static inline long smc_arg1(unsigned long id, unsigned long par1)
 	register unsigned long __par1 asm("r1") = par1;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
-		: "r"(__id), "r"(__par1)
+		: "+r" (__id), "+r"(__par1)
+		:
 		: "memory", "x2", "x3");
 
 	return __id;
@@ -43,8 +43,8 @@ static inline long smc_arg2(unsigned long id, unsigned long par1,
 	register unsigned long __par2 asm("r2") = par2;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
-		: "r"(__id), "r"(__par1), "r"(__par2)
+		: "+r" (__id), "+r"(__par1), "+r"(__par2)
+		:
 		: "memory", "x3");
 
 	return __id;
@@ -62,9 +62,8 @@ static inline long smc_arg5(unsigned long id, unsigned long par1,
 	register unsigned long __par5 asm("r5") = par5;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
-		: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
-		  "r"(__par4), "r"(__par5)
+		: "+r" (__id), "+r"(__par1), "+r"(__par2), "+r"(__par3)
+		: "r"(__par4), "r"(__par5)
 		: "memory");
 
 	return __id;
diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h b/include/arch/arm64/asm/jailhouse_hypercall.h
index 108d052..a9d13ee 100644
--- a/include/arch/arm64/asm/jailhouse_hypercall.h
+++ b/include/arch/arm64/asm/jailhouse_hypercall.h
@@ -42,6 +42,7 @@
 #define JAILHOUSE_CALL_NUM_RESULT	"x0"
 #define JAILHOUSE_CALL_ARG1		"x1"
 #define JAILHOUSE_CALL_ARG2		"x2"
+#define JAILHOUSE_CALL_CLOBBERED	"x3"
 
 /* CPU statistics, arm64-specific part */
 #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 5
@@ -54,9 +55,10 @@ static inline __u64 jailhouse_call(__u64 num)
 
 	asm volatile(
 		JAILHOUSE_CALL_INS
-		: "=r" (num_result)
-		: "r" (num_result)
-		: "memory");
+		: "+r" (num_result)
+		:
+		: "memory", JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,
+		  JAILHOUSE_CALL_CLOBBERED);
 	return num_result;
 }
 
@@ -67,9 +69,9 @@ static inline __u64 jailhouse_call_arg1(__u64 num, __u64 arg1)
 
 	asm volatile(
 		JAILHOUSE_CALL_INS
-		: "=r" (num_result)
-		: "r" (num_result), "r" (__arg1)
-		: "memory");
+		: "+r" (num_result), "+r" (__arg1)
+		:
+		: "memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);
 	return num_result;
 }
 
@@ -81,9 +83,9 @@ static inline __u64 jailhouse_call_arg2(__u64 num, __u64 arg1, __u64 arg2)
 
 	asm volatile(
 		JAILHOUSE_CALL_INS
-		: "=r" (num_result)
-		: "r" (num_result), "r" (__arg1), "r" (__arg2)
-		: "memory");
+		: "+r" (num_result), "+r" (__arg1), "+r" (__arg2)
+		:
+		: "memory", JAILHOUSE_CALL_CLOBBERED);
 	return num_result;
 }
 
-- 
2.7.4


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/C9905595-F658-4431-AF1D-F9ECDD38A20C%40gmx.de.
