Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBB4U4RD5QKGQEBDDRQSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id E28D026C321
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 15:09:06 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id r9sf2446631edi.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 06:09:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600261746; cv=pass;
        d=google.com; s=arc-20160816;
        b=WGDMTIrJUjH6UmdpUVPz9P2qM5Tvsiw8gZgwtSjKd/HeiG4+JpSPAbeCM8XUehFKLy
         IZrDxken+E/Miks57rhOMigcIeVjCkxdF2zEabI5z9WxUrbqXJ2WUqdm61HMZy45Xxwx
         o4ev7181ClugJ/zTx0jMxyA4Al+tl1Op+m0pKtp2zqsxB0U+8lIXPBTwccJjLSUjJm3+
         Zlb/R6F4r6PvfKZ8XS/8WEiWJ/YLWh/h1cDxTVKVz8c7RSdPV+TSTw5gkZgjm+hc5K0W
         GEIxX/uwp5qsa8Q+DSFMfM0kaMv30MgDIQ03iYPYYkD5jTtq/19COUxLda3nqKRxy32i
         6nqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:cc:date:message-id:subject
         :mime-version:from:sender:dkim-signature;
        bh=9pJ+M9LyZPjY+csRm0vTjKGezCjdh50X7xXhMAvkgEQ=;
        b=umobS1ocl8Dkpy1EfQjUldO8Ny26ejBvDW0DS8xMKKo7GqAE4vI43NKAGaQwPZDeiz
         No3+3AISg0vYm9ChmGTaCgpZ17sZvYC/+krjTFR8ytGkYM9kIUl5BBAUMKhEZEc7B337
         4jHeNpeQKrSLj8t1czN2lLPkwlc4GJZ9Rf3szfyJOW0GmkwSbW8/sxlkt/MjVkghZdTY
         mEAcnm+wIc+fPDzfGn4CqjCbvPMR9BRCh7KWn7hxViV5T0C7gE5XdzXFZbUWKMUiiZI0
         6ZXiuKtoEsbHYy7jU5qqyWKO3SuKrLvVB9cVPWK5AaOxIOn1TgOoaKDzvFUKDrJLMAW2
         dhNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=UADwCN+X;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:mime-version:subject:message-id:date:cc:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9pJ+M9LyZPjY+csRm0vTjKGezCjdh50X7xXhMAvkgEQ=;
        b=rdZGxOXpnCgy4XoVcTPUfauWCsoe2D6faaPaFyWx4Q34FvU3gFscjZs/tvp4O1CzRZ
         S13RUlyLu+X16P1STkanxsDkG9iUsVmreB9Nw2GZgGqjSBdawm3OLDR6jffCzJWCFShI
         5nwyoFO/YssPlBU6uGTfd6JvhvrvqpWER0HezFN2NZexr2njZLkLydkmqf6C/vVJrXlx
         yn6dDbS2sLtTGU7lzyHM8HL3ByO027R3/aCTtHquB5jm/tuDf/hy+Gofsne4E5t+NZaz
         n+7CfdijAphZpCefY4CzgEu0aJgI+v+BH8ULLkOSoz94lpz/LZaiE63crmv1sAeVveE9
         GySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:mime-version:subject:message-id:date
         :cc:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9pJ+M9LyZPjY+csRm0vTjKGezCjdh50X7xXhMAvkgEQ=;
        b=REeprnYhakWO1aL/JPVSV39+hUbcLoyp81l2zUi/l2aM3rrJcdwXc1OZXWGF/ZrHZO
         JIM2x1t6azM0G9EefYfp2Y82a4NoCuuY1Yj3FnVMU+eHAQGmAzzPbI6D+yzh9/HqfGiK
         B8iWqsRbIwPQXjXIKwMl3HvEctaW/i+LsNQllG5Wiui7l896loOfE3dNOfA3lqW1j0nj
         090UNLXx78K/NwdyQFXjO0QToVaKFGx82p4ls69PusvQZFyvgysGwwXJZfCTjoGic8aX
         LCvw3lcF+zvwr8IhBy0lytescGoFiChW/tomqoyjtgkjXSukhQ3I97gK+FYMvMlHWM0U
         cOLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532BA8ODI0qeh/ZaaJHOnAldNafujwqUJdxW6Ku2acV62CuMkM9R
	+VikVeyrxUjxivO/ArRxASQ=
X-Google-Smtp-Source: ABdhPJxcoHbMMf57gAfUk07yOpwCdJ7U9dYkQ7MwejaPJhMBDmnv7WTAoCrPILYzcRI4Lp+rO9R6dA==
X-Received: by 2002:a17:907:70cb:: with SMTP id yk11mr24939875ejb.312.1600261746646;
        Wed, 16 Sep 2020 06:09:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f996:: with SMTP id li22ls1034889ejb.10.gmail; Wed,
 16 Sep 2020 06:09:05 -0700 (PDT)
X-Received: by 2002:a17:906:3c01:: with SMTP id h1mr26023406ejg.111.1600261745496;
        Wed, 16 Sep 2020 06:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600261745; cv=none;
        d=google.com; s=arc-20160816;
        b=pX+/+4yHEB6vmMry/yNkvhgOeRyvW/IXGihTdib6Q1mMTkFFWu+g+0Wiec7C3oxP2b
         /uSfBPRqzKQDEFlSm4YpLYOUW0w0jG3UCO5XVcMsq9VoeEYJgBGDapz8t1uzpJ9pO6cb
         6XUYBCwHMSe6QZwxVmMHriVMeoedCgOvBIEy+59rVnlbpEJTTcvLL0qwPsmI9hAH4UKL
         7RouGj9nYJcSkTgF0DOqa+RfDAfTRJ6SYTvPhmbdPv+xxHo6gCUKYa0jV9Xwg+NQPaJ3
         Z8T4JeUTXyaZBnWW/MMGLROIAMgUyYQsHFW0K6/JRYDiuHpC9qgODzVPPQTJ8ITNG515
         Fsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:dkim-signature;
        bh=yoh8LttxA8sxnK1vc7HY6XC4qLLDYNAobjdZDaSGn+E=;
        b=AFGk98edOox7F0o0nj79qlAtkNj0JYfNPTq9t1NlRigpuDfAiqh8ZJLmmyxLHrmCZ4
         g/eTlIQ4nE7ktBMlMQHI7+LSPH7Z/2tRT6M4F6Y23mh2wWfztGeusWH5WB6jaIrcMXvX
         dEHvg3LYFoZd/Nz1D3G9JHKaMRXn18Q3riPfuXL+1haT8AB1O3PaNiQTf3mQH0L/4g+4
         FujWCJKQ/6U3Hy1Zn4M0OTMkJMPi3OEpVZPCwoBHrprVtj4h+6jQombUx+bBb5XfQc6l
         8oxXeZz4e19dts9VlcJZa/QIfU6wH2skU1n5co2oDBUtsIgR7uxoibdqgn6hINiRTKUm
         pO4g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=UADwCN+X;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by gmr-mx.google.com with ESMTPS id w16si553026edq.4.2020.09.16.06.09.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from meter.plexim.com ([212.126.163.234]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1jxkd308cW-00VuFb; Wed, 16
 Sep 2020 15:09:05 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Subject: [PATCH V2 2/2] arch32: Make sure SMC and HVC calls don't
 have side  effects
Message-Id: <BC946534-03C8-4AB3-9473-C6B880E37A88@gmx.de>
Date: Wed, 16 Sep 2020 15:09:04 +0200
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:6bHshcBKYXbbQaxPo5ITj2AeaRv/HiwOYortNXXwv0ILCMCtxJ2
 kC969UYX+HgDzqE9Y4JVivgNDpjltm+6DehBsVmzI17umsFr3oDbh91PZdTjAFd78/tSV0q
 WPpetbqkmH4v4h6g9bQ8mWa29gv8cmt7czvp80ELZ9ESqiqxvFg9j4MuylEv72tlue0JeE4
 Nr86VG3TNQnPkclaezdSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gKjG1S5f3No=:CKfYOK8zBBfA8JSO1D85AR
 GRX7EMhSD2/lFJ3HfNPpzbXCeP1aYyKczPS2jIRosm3LJgE42MWX65E7qJwLCB7/vyI3HR83L
 iuxN7aC31Y6oe7LGXb4p7NqbwXQ9c1Q72Eo+JTR/Xq4DzzOpt8yS7qdz4qxnzhIMMcx1ANpFK
 FidbmGqXxgNBqN1BXWqLTbUNxH2181ixuB0+4GR3vBueVcZRuqUohDrUrIg4djPeQpf0aOHK8
 cQYvYO+wDbuebRm35GBqTkGjtrm8mWMIYbDwLucT6JyUd4cFKoNID3b0Mh1O12+oYSZ3751/1
 RLwdGPgod/LsCZ97oVM0DElWhCvWkqPigzTnyybp64maixqB4sFrNxSqscnisYQcBBHol07O8
 8Q0wcqkTqw+4ZMTflQa+Rhy977aiyRjiiSWnWu43hNJ7rbLUZYhNHg0JIRXPL4H7B4hepfTSe
 5pU6Qz/CRxjN157NRidHEg65pVNXYqhjAFrKdjbJ/zMHet3B8W9N0jPr5W9TLsfltyfxFpPd/
 8BYiM3csskS2sd+30ymV9AnctsDjCrwiYVlXKUnMUL6NUOxyTdg5HJ37o+T1OtGv+rcBRcAOl
 eKVC82xFRWQ16Q2807x+gqKtN/rw/lU6L2Z9xvNqE+9a1ZCNBbp4NKTtJBB9Pv7aRVf6l2jif
 I5/3qNDyogNybVtEeaXsH9Df38pE2h97Af2yzYpE2HpuKQljEcHzQI+JA+5RpleiiCWxhhLA9
 QUt7nAgeDW7hkpf+yScKvDJySYXbf6EEdI3tTnW6aedu3RmlOksRYicFAiFslZ7gSQbLdbpcY
 3bNJYiQInA6nUZ1qe3tBYsY1JhI2UkBLbZiHPrDz6tpfzKq7KSTcU+/YOMUNhJtvrD7MU8Sxe
 Ovqt5tCtNoGFw4wd4DImtHwYFeuqvWXPyL4kOYN5lrkqdcwLZFPAILPlXdEtKi2qd8ZOPvz3i
 teUaFOu9+YI9FIB13W4YeqtYsNEd4dFX8Y1994fOQ5BHiVnMEElLjCcB/pTEwQvi8ch9ilYVE
 1TMzk40fogqsC1onuOebMT853938R8I6ou/5IdGdcnxWrXl5J7pTGeS0RtlXLExcbHgsITdu7
 3gYsSefBYF8QZGvqLWLXAn+ckT3oUQEuo8xVLKtPFwKyXU26YjfxO2iym/aYHwZBQaANqOFhv
 /RR0zuCdzjH48oHqzbHBV8nyMWGKpN1vde9EFKxNn7Z8uk+uVjDbugp2Vgj4xfj/1u8P6ZDOY
 IfxXfXPhDLsaIMQWuZIAyNPQoU5pYT/7N06xH6A==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=UADwCN+X;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as
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

SMC/HVC calls may modify registers r0 to r3. To make sure the compiler
doesn't assume input registers to be constant, also mark these registers
as output when used as input.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
---
 hypervisor/arch/arm/include/asm/smc.h      | 12 ++++++------
 include/arch/arm/asm/jailhouse_hypercall.h | 20 +++++++++++---------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/hypervisor/arch/arm/include/asm/smc.h b/hypervisor/arch/arm/include/asm/smc.h
index 1e3cdd5..8aba196 100644
--- a/hypervisor/arch/arm/include/asm/smc.h
+++ b/hypervisor/arch/arm/include/asm/smc.h
@@ -18,8 +18,8 @@ static inline long smc(unsigned long id)
 	register unsigned long __id asm("r0") = id;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
-		: "r"(__id)
+		: "+r" (__id)
+		:
 		: "memory", "r1", "r2", "r3");
 
 	return __id;
@@ -31,8 +31,8 @@ static inline int smc_arg1(unsigned long id, unsigned long par1)
 	register unsigned long __par1 asm("r1") = par1;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
-		: "r"(__id), "r"(__par1)
+		: "+r" (__id), "+r"(__par1)
+		:
 		: "memory", "r2", "r3");
 
 	return __id;
@@ -46,8 +46,8 @@ static inline long smc_arg2(unsigned long id, unsigned long par1,
 	register unsigned long __par2 asm("r2") = par2;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
-		: "r"(__id), "r"(__par1), "r"(__par2)
+		: "+r" (__id), "+r"(__par1), "+r"(__par2)
+		:
 		: "memory", "r3");
 
 	return __id;
diff --git a/include/arch/arm/asm/jailhouse_hypercall.h b/include/arch/arm/asm/jailhouse_hypercall.h
index aabd66b..894dd5d 100644
--- a/include/arch/arm/asm/jailhouse_hypercall.h
+++ b/include/arch/arm/asm/jailhouse_hypercall.h
@@ -43,6 +43,7 @@
 #define JAILHOUSE_CALL_NUM_RESULT	"r0"
 #define JAILHOUSE_CALL_ARG1		"r1"
 #define JAILHOUSE_CALL_ARG2		"r2"
+#define JAILHOUSE_CALL_CLOBBERED	"r3"
 
 /* CPU statistics, arm-specific part */
 #define JAILHOUSE_CPU_STAT_VMEXITS_CP15		JAILHOUSE_GENERIC_CPU_STATS + 5
@@ -56,9 +57,10 @@ static inline __u32 jailhouse_call(__u32 num)
 
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
 
@@ -69,9 +71,9 @@ static inline __u32 jailhouse_call_arg1(__u32 num, __u32 arg1)
 
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
 
@@ -83,9 +85,9 @@ static inline __u32 jailhouse_call_arg2(__u32 num, __u32 arg1, __u32 arg2)
 
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/BC946534-03C8-4AB3-9473-C6B880E37A88%40gmx.de.
