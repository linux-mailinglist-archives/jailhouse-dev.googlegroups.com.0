Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKUZ2D2AKGQEF5B5RIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EE71A633A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:34 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id n127sf2476051wme.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760874; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xqe7Z6htMLRaxH6LQ92SX3oyoFC6g45+yj2OzVFPlH/JPHL3U3QYQWBxU4StsZ8lvw
         hmDILFpxR4Z1Ly7+ZJ1wKLelRcGh2yrsDpv/bxCe6hW9NqHn8HSSO0m1bFOqYbIjeGbT
         b9oSz+JEoF7mKWhxJsjKiPNOw/fIeLqQgX4Sx8sXAW7WthrclN2YxuJnfvKHOtn6/jpR
         K8duew8gDc1KOWB6fEC3tsHHOChEXCAq4Qcilu/HqToC1V8ti6msP46+zFEPOyl0eMyt
         i8iEBySrDHRRooLfUnENiaNcR9XBX8CB3J8LSYjpJBestcRvUo+XiEc8Gsmozd/Op9DG
         QC+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=+b8c0daL8sZDT68JeROs7kH7lNhqC34rT13IJtr46SA=;
        b=wnsC4BvTaa42NIGXMiH0ynxaVmRVoxZHEg/utLoCkACFEg1XmpaaMX7MyGp25f1j2P
         unEugo3D0YOzzPE7g3NyPz4w1dW80lRuvkkgbs9IWdq1KDP3nGxXIiWAGnCHafN17F0j
         h5X5345l5K6+HsZN4qRbmjyw9tKmr9hZ3mfcLeY3HOuULT/S6rxJP916yVMkvsnCTwVa
         wBwnGLcaSIK2SZqOjD+/YUg4HxIYDqxNZsZnwIwvZ8kc4g1jr1DzI4FOYvQiaRTeBfzv
         +m5uvKh/89lsXVaE/RVloI7huMgV8nn4+IWaklQ0le8wCSOOw9eV0NCel3NxdtuMmkcP
         xhMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nxpw7o4F;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+b8c0daL8sZDT68JeROs7kH7lNhqC34rT13IJtr46SA=;
        b=he7mOUdEJklda2QXPlyHpEwE1SCULaR58U2TqvfYE9aLV8s+7ZBGrDrMjBWW2/1y6N
         y/iWYsaShwV51LTuKWWnie8/oHe4hlfBwe/ee2IHmBKKAE9NFCNLAbzunAEE/UQgG7ju
         2UrsVRgrptjNyd6Q/KuEcNEIv0pWa4/1qOWbc/qlUKfUPNTkOa7ztW9veiGp8IynkWzF
         8TyXZsY3i2+RVh9Dh+rNdcOc1OTCno1az9HReRck/kNNjKF1Qlxu5U4yC5ihYQGBl3hM
         koDusvnFrInohJdijGINiYRNeebvKtbDDUw1j93UpX9tJK4Ph2tdlwuUJ3ZUuIV/bkRn
         3q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+b8c0daL8sZDT68JeROs7kH7lNhqC34rT13IJtr46SA=;
        b=mCQBFVC26hMlIgvA8b9d5q0K4IFrQf6KOeN27X3uyKMYSa5/kSrTL3Pzbbkac/RzS1
         3f3duHw/M1J2Eth5s2UD5z0Tzus0FYUTg9xR/Gol8AkoEWvvnHAZPQMyVRi4QOZWy2vs
         pKlws6m+/SqlLzuqSouvbhympQLulbMRgIKoEYZTdUHfwwSyCXzruWWTIBoXf4kxUCdG
         RoSiuuLmUsDjYan6cr/0M7IJHQjkKkYdf/e8C9sD3ZnbZb8fXn5Qu/wKdL7Ukh3mygOE
         Cz4n2PCVuX7CvuP1lXz5KShMRF+1/O2opqtSQLzWfRMiwFVE4up3gmKhymKqqB3rPZtY
         Ephw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZ2ANKnnZI7PcofC6mT9ss9CXuYYuyni5mUc5+uYJju4alfUI2z
	cLtlhqVrGi9fMsszuIG7C6I=
X-Google-Smtp-Source: APiQypIV9skUQfm9JZkWOQ7/l2GRLTYrQ02oaQvIWHouRlNo2LpQwUZe3CDJEckEUqifY9idVvYi+Q==
X-Received: by 2002:a5d:4c42:: with SMTP id n2mr18325982wrt.178.1586760874553;
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:224f:: with SMTP id a15ls13963062wmm.3.gmail; Sun,
 12 Apr 2020 23:54:34 -0700 (PDT)
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr18123833wmb.181.1586760874009;
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760874; cv=none;
        d=google.com; s=arc-20160816;
        b=l399QNi8lfUZTMaqHNp6vsLuIIvgVnTqzceuZny8hU9oRxnpNl5lFRdHevyCTJGZa4
         qflqBAMWGImdxbdLJ8gYH7nhTxqyoquzfaSY1dvpZ/aTjp/NREKU9AjrysSBsXcuDiQl
         f/ng7euqYZTV9ddnkGYpO4b1iKHFDhHGd9hCyQtbb+Bh/ZQoNVoA9fkXrrWbU+jH37o8
         qrhy9igl+5+nhLDJmaDDoFmwfz7QmVCd6LLZKrYUTm7dY0T0YVbCdv61ITlFg6SIYCMy
         e8JbvkCoWLve1/6gdedh1o3EL2lGd88AoNOEabnYDmCaapQ3ycHeqL+t3q9mtaWpZBr+
         fiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=441ZDrLh94qIIlmMMfKNe2qO1QnR+CTfe5BK069jDXA=;
        b=KyCq3HfNSZ68Grk3phd3Wt1I1SBb0fuHv78XgmovZt5wFueQLi69r7YltpsM0sLW0R
         MMXzZdbpFjRp1v5Psryu3b/wwy/fzojeF1r/C3ZMu5ruKvLI4T1ivPGWvWXhZZGjtitA
         asTViqRqCflWyTzD4T2Xm+jYkAoUdk2qsL3G3xuYjLTk88ReeOdcjXpiYymQv1H3aEBl
         f9/8y/UeDDPsesJx+I+bmz/ZlYVCjYl73MgWLtsffWSjViPwCeKz56OOQg1xkfyG9d30
         L6Kf5K0pIR3PJnb/gK78U7eiDFmdGJ3tAju7VYuUb6vZJFR3yOr7m2BAxK7tliz5+0ek
         4Tew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nxpw7o4F;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id g78si553547wmg.0.2020.04.12.23.54.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LgpNC-1isixr1waU-00oHO0 for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:33 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 02/13] arm-trusted-firmware: Add RPi4 patches to skip UART initialization
Date: Mon, 13 Apr 2020 08:53:44 +0200
Message-Id: <aea3ac86dffa3b155ba4654ecc4764101b2cd774.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:f5FcD/BQvwtaRp23DYnoEmMjmahMuoOMDFrdFnao6GfJwr00jfu
 5qM3k78QN81y0/vek/WWTrJk3DIyuoejPXFxc0SLP/POaQtRT9+vLHWep+7MYpJALGxiW2Q
 b4XufGgbrUNzvNwA13nlQVwz/0R/3OYSW4nOoHFiHuzhVZ6dqskWLQayp0P6lWPHTUUNL0i
 U9ZCB3Is7q1YvAb07tZaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C4BjqKjtm8I=:ZXdiWeXE3RFoh2ZhVHFDlD
 6bGT8ogmScfDD7JI3Zr/zD+YQ8RdmEY8x5rhKLct6d+iz16/tv5A3cSEvtOHbSz3HwrnPZrje
 3AlkaXqcykT566x8D9uXrCCxiF+zZLUHLcQW386JSDAKc77TKBBVzru4bXAgbz0zT+2UDuhYC
 +uU2o71w1er0OgSlZy+E32WFfB3eeXRENAP90Tj6l9yOCa/wlAQdkFXuzewGtiN5SHX+zX6Lp
 vRAan+2R44p057kk6Y59UT7REBaLXBSiCd/JxGwT4mkqZPUADkyLfkmj/TfFQgSKGeGYwl347
 IouM0HYp9Xyo82AAwLNFSdJ/+cAUSIeYcfjr8dDjdm48aKPfsgh6RDbqfpclt91K5wil0DwCs
 DalgSKYStA/3kv14TuU/HUlm49q7iIx+eNsiAhXYRaXgmnIxa8IEpcc4jnG4tan7A3t+TM9TA
 WFHL7FOWjtNd5syckOiJWAf7DeXRwXzZdHYCtyQiTaSbj1XwsS86hTzbT6UESEUnLSbaGB0Ql
 lbZ+LXX0Zmn2RTqiH4qu30zL3bGTGQyzoRyreI2s9VpfF0w4Gh5VKy1d8gdsfY6oAQo42Bvli
 PzdW/BOBAgzaW/BA5RoIcyx5SRJpz2/sf+2aaWpxmUbHjpd9fxxfq/qUDhy7nLLB+nhFaE7RF
 8Rea/CJRfiuHOAU8tnvci3YLrrbBXXKWmc1R1zMYvo8UIPoLV/iIFJ31F8HyN33WJIu89ayIa
 edMCokgxP1d+ZYImHJ1V7kUnVpaJIOiOexhZ3iSXWadBY5GoIO+HNBSIQQqg7eKnEna+xx8Gp
 oYevEn6rbMwEyUhwNs3CA+omPwFpV55fanH6cCSzcEuvz3fq9e8j2lkhKSLoDrhe4Ec1dti7U
 XZx88RapAitRCWayJsZllqL5ue+5tat505GZ/XNvEQP3TKTG/aOurjNLI0x5JEeU15fYTANor
 M3Ix7sDtNBYg5DXIJ+12nfwKnj0djG2fCSN7LxYhbgCAixhCT75QVz9aP7gx2B7+XgXjMbSgs
 LE3VzcNwkdMxf/BG2VC4ig1my9ccmJY6PlaiBopG3E105EvPI7K/JBJZcF4orNj1cbsyloLui
 Z8aiqjI9K44P7iNR6uSsct8AxuXRSB95mWEpOX51pDnJxxPklLzJP/prv3S+qKTAzbRcUd8tS
 5BOh8pJ33weM86gYsCb6Yuca9XVeZCpHl2u0ss/o1DqozSS7NJl0mJbGYBT/U3BOaagLrRUi2
 U0P71CXX0p34Nn5Zr
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=nxpw7o4F;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This is needed for the latest bootloader firmware, or the output will
be garbage.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arm-trusted-firmware_2.2.inc                   |   4 +-
 ...16550-Prepare-for-skipping-initialisation.patch | 127 +++++++++++++++++++++
 .../0002-plat-rpi4-Skip-UART-initialisation.patch  | 109 ++++++++++++++++++
 ...03-rpi3-4-Add-support-for-offlining-CPUs.patch} |   5 +-
 4 files changed, 242 insertions(+), 3 deletions(-)
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
 rename recipes-bsp/arm-trusted-firmware/files/{0001-rpi3-4-Add-support-for-offlining-CPUs.patch => 0003-rpi3-4-Add-support-for-offlining-CPUs.patch} (89%)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
index 0354ac4..9f75497 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
@@ -13,6 +13,8 @@ FILESPATH =. "${LAYERDIR_jailhouse}/recipes-bsp/arm-trusted-firmware/files:"

 SRC_URI += " \
     https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;downloadfilename=atf-v${ATF_PV}.tar.gz;name=atf \
-    file://0001-rpi3-4-Add-support-for-offlining-CPUs.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
+    file://0001-console-16550-Prepare-for-skipping-initialisation.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
+    file://0002-plat-rpi4-Skip-UART-initialisation.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
+    file://0003-rpi3-4-Add-support-for-offlining-CPUs.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
     "
 SRC_URI[atf.sha256sum] = "07e3c058ae2d95c7d516a46fc93565b797e912c3271ddbf29df523b1ab1ee911"
diff --git a/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch b/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
new file mode 100644
index 0000000..10ca776
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
@@ -0,0 +1,127 @@
+From 62b9c075700eedbc6d308b51b17e90c031c1a300 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Thu, 12 Dec 2019 12:00:15 +0000
+Subject: [PATCH 1/3] console: 16550: Prepare for skipping initialisation
+
+On some platforms the UART might have already been initialised, for
+instance by firmware running before TF-A or by a separate management
+processor. In this case it would not be need to initialise it again
+(doing so could create spurious characters). But more importantly this
+saves us from knowing the right baudrate and the right base clock rate
+for the UART. This can lead to more robust and versatile firmware builds.
+
+Allow to skip the 16550 UART initialisation and baud rate divisor
+programming, by interpreting an input clock rate of "0" to signify this
+case. This will just skip the call to console_16550_core_init, but still
+will register the console properly.
+
+Users should just pass 0 as the second parameter, the baudrate (third
+parameter) will then be ignored as well.
+
+Fix copy & paste typos in comments for the console_16550_register()
+function on the way.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Change-Id: I9f8fca5b358f878fac0f31dc411358fd160786ee
+---
+ drivers/ti/uart/aarch32/16550_console.S | 18 +++++++++++++-----
+ drivers/ti/uart/aarch64/16550_console.S |  9 ++++++++-
+ include/drivers/ti/uart/uart_16550.h    |  5 +++++
+ 3 files changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/ti/uart/aarch32/16550_console.S b/drivers/ti/uart/aarch32/16550_console.S
+index 692188412..5cd9b30cd 100644
+--- a/drivers/ti/uart/aarch32/16550_console.S
++++ b/drivers/ti/uart/aarch32/16550_console.S
+@@ -89,16 +89,19 @@ endfunc console_16550_core_init
+ 	.globl console_16550_register
+
+ 	/* -------------------------------------------------------
+-	 * int console_stm32_register(uintptr_t baseaddr,
++	 * int console_16550_register(uintptr_t baseaddr,
+ 	 *     uint32_t clock, uint32_t baud,
+-	 *     struct console_stm32 *console);
+-	 * Function to initialize and register a new STM32
++	 *     console_16550_t *console);
++	 * Function to initialize and register a new 16550
+ 	 * console. Storage passed in for the console struct
+ 	 * *must* be persistent (i.e. not from the stack).
++	 * If r1 (UART clock) is 0, initialisation will be
++         * skipped, relying on previous code to have done
++         * this already. r2 is ignored then as well.
+ 	 * In: r0 - UART register base address
+ 	 *     r1 - UART clock in Hz
+-	 *     r2 - Baud rate
+-	 *     r3 - pointer to empty console_stm32 struct
++	 *     r2 - Baud rate (ignored if r1 is 0)
++	 *     r3 - pointer to empty console_16550_t struct
+ 	 * Out: return 1 on success, 0 on error
+ 	 * Clobber list : r0, r1, r2
+ 	 * -------------------------------------------------------
+@@ -110,10 +113,15 @@ func console_16550_register
+ 	beq	register_fail
+ 	str	r0, [r4, #CONSOLE_T_16550_BASE]
+
++	/* A clock rate of zero means to skip the initialisation. */
++	cmp	r1, #0
++	beq	register_16550
++
+ 	bl	console_16550_core_init
+ 	cmp	r0, #0
+ 	beq	register_fail
+
++register_16550:
+ 	mov	r0, r4
+ 	pop	{r4, lr}
+ 	finish_console_register 16550 putc=1, getc=1, flush=1
+diff --git a/drivers/ti/uart/aarch64/16550_console.S b/drivers/ti/uart/aarch64/16550_console.S
+index dab46e8c5..80c1b8646 100644
+--- a/drivers/ti/uart/aarch64/16550_console.S
++++ b/drivers/ti/uart/aarch64/16550_console.S
+@@ -92,9 +92,12 @@ endfunc console_16550_core_init
+ 	 * Function to initialize and register a new 16550
+ 	 * console. Storage passed in for the console struct
+ 	 * *must* be persistent (i.e. not from the stack).
++	 * If w1 (UART clock) is 0, initialisation will be
++	 * skipped, relying on previous code to have done
++	 * this already. w2 is ignored then as well.
+ 	 * In: x0 - UART register base address
+ 	 *     w1 - UART clock in Hz
+-	 *     w2 - Baud rate
++	 *     w2 - Baud rate (ignored if w1 is 0)
+ 	 *     x3 - pointer to empty console_16550_t struct
+ 	 * Out: return 1 on success, 0 on error
+ 	 * Clobber list : x0, x1, x2, x6, x7, x14
+@@ -106,9 +109,13 @@ func console_16550_register
+ 	cbz	x6, register_fail
+ 	str	x0, [x6, #CONSOLE_T_16550_BASE]
+
++	/* A clock rate of zero means to skip the initialisation. */
++	cbz	w1, register_16550
++
+ 	bl	console_16550_core_init
+ 	cbz	x0, register_fail
+
++register_16550:
+ 	mov	x0, x6
+ 	mov	x30, x7
+ 	finish_console_register 16550 putc=1, getc=1, flush=1
+diff --git a/include/drivers/ti/uart/uart_16550.h b/include/drivers/ti/uart/uart_16550.h
+index 32e38f0ac..2b95fa33a 100644
+--- a/include/drivers/ti/uart/uart_16550.h
++++ b/include/drivers/ti/uart/uart_16550.h
+@@ -87,6 +87,11 @@ typedef struct {
+  * framework. The |console| pointer must point to storage that will be valid
+  * for the lifetime of the console, such as a global or static local variable.
+  * Its contents will be reinitialized from scratch.
++ * When |clock| has a value of 0, the UART will *not* be initialised. This
++ * means the UART should already be enabled and the baudrate and clock setup
++ * should have been done already, either by platform specific code or by
++ * previous firmware stages. The |baud| parameter will be ignored in this
++ * case as well.
+  */
+ int console_16550_register(uintptr_t baseaddr, uint32_t clock, uint32_t baud,
+ 			   console_16550_t *console);
+--
+2.16.4
+
diff --git a/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch b/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
new file mode 100644
index 0000000..56cac70
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
@@ -0,0 +1,109 @@
+From 0ea846120c1df90cf8cf29ab3f664cf7e3eabc22 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Thu, 12 Dec 2019 16:31:11 +0000
+Subject: [PATCH 2/3] plat: rpi4: Skip UART initialisation
+
+So far we have seen two different clock setups for the Raspberry Pi 4
+board, with the VPU clock divider being different. This was handled by
+reading the divider register and adjusting the base clock rate
+accordingly.
+Recently a new GPU firmware version appeared that changed the clock rate
+*again*, though this time at a higher level, so the VPU rate (and the
+apparent PLLC parent clock) did not seem to change, judging by reading
+the clock registers.
+So rather than playing cat and mouse with the GPU firmware or going
+further down the rabbit hole of exploring the whole clock tree, let's
+just skip the baud rate programming altogether. This works because the
+GPU firmware actually sets up and programs the debug UART already, so
+we can just use it.
+
+Pass 0 as the base clock rate to let the console driver skip the setup,
+also remove the no longer needed clock code.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Change-Id: Ica88a3f3c9c11059357c1e6dd8f7a4d9b1f98fd7
+---
+ plat/rpi/rpi4/aarch64/plat_helpers.S |  4 ++--
+ plat/rpi/rpi4/include/rpi_hw.h       |  8 --------
+ plat/rpi/rpi4/rpi4_bl31_setup.c      | 16 +++++-----------
+ 3 files changed, 7 insertions(+), 21 deletions(-)
+
+diff --git a/plat/rpi/rpi4/aarch64/plat_helpers.S b/plat/rpi/rpi4/aarch64/plat_helpers.S
+index 46073b791..083c30e71 100644
+--- a/plat/rpi/rpi4/aarch64/plat_helpers.S
++++ b/plat/rpi/rpi4/aarch64/plat_helpers.S
+@@ -136,8 +136,8 @@ endfunc platform_mem_init
+ 	 */
+ func plat_crash_console_init
+ 	mov_imm	x0, PLAT_RPI3_UART_BASE
+-	mov_imm	x1, PLAT_RPI4_VPU_CLK_RATE
+-	mov_imm	x2, PLAT_RPI3_UART_BAUDRATE
++	mov	x1, xzr
++	mov	x2, xzr
+ 	b	console_16550_core_init
+ endfunc plat_crash_console_init
+
+diff --git a/plat/rpi/rpi4/include/rpi_hw.h b/plat/rpi/rpi4/include/rpi_hw.h
+index ed367ee20..b1dd4e92e 100644
+--- a/plat/rpi/rpi4/include/rpi_hw.h
++++ b/plat/rpi/rpi4/include/rpi_hw.h
+@@ -58,13 +58,6 @@
+  */
+ #define RPI3_PM_RSTS_WRCFG_HALT		U(0x00000555)
+
+-/*
+- * Clock controller
+- */
+-#define RPI4_IO_CLOCK_OFFSET		ULL(0x00101000)
+-#define RPI4_CLOCK_BASE			(RPI_IO_BASE + RPI4_IO_CLOCK_OFFSET)
+-#define RPI4_VPU_CLOCK_DIVIDER		ULL(0x0000000c)
+-
+ /*
+  * Hardware random number generator.
+  */
+@@ -88,7 +81,6 @@
+  */
+ #define RPI3_IO_MINI_UART_OFFSET	ULL(0x00215040)
+ #define RPI3_MINI_UART_BASE		(RPI_IO_BASE + RPI3_IO_MINI_UART_OFFSET)
+-#define PLAT_RPI4_VPU_CLK_RATE		ULL(1000000000)
+
+ /*
+  * GPIO controller
+diff --git a/plat/rpi/rpi4/rpi4_bl31_setup.c b/plat/rpi/rpi4/rpi4_bl31_setup.c
+index 53ab0c2e2..9e3b53979 100644
+--- a/plat/rpi/rpi4/rpi4_bl31_setup.c
++++ b/plat/rpi/rpi4/rpi4_bl31_setup.c
+@@ -119,8 +119,6 @@ void bl31_early_platform_setup2(u_register_t arg0, u_register_t arg1,
+ 				u_register_t arg2, u_register_t arg3)
+
+ {
+-	uint32_t div_reg;
+-
+ 	/*
+ 	 * LOCAL_CONTROL:
+ 	 * Bit 9 clear: Increment by 1 (vs. 2).
+@@ -136,16 +134,12 @@ void bl31_early_platform_setup2(u_register_t arg0, u_register_t arg1,
+
+ 	/*
+ 	 * Initialize the console to provide early debug support.
+-	 * Different GPU firmware revisions set up the VPU divider differently,
+-	 * so read the actual divider register to learn the UART base clock
+-	 * rate. The divider is encoded as a 12.12 fixed point number, but we
+-	 * just care about the integer part of it.
++	 * We rely on the GPU firmware to have initialised the UART correctly,
++	 * as the baud base clock rate differs across GPU firmware revisions.
++	 * Providing a base clock of 0 lets the 16550 UART init routine skip
++	 * the initial enablement and baud rate setup.
+ 	 */
+-	div_reg = mmio_read_32(RPI4_CLOCK_BASE + RPI4_VPU_CLOCK_DIVIDER);
+-	div_reg = (div_reg >> 12) & 0xfff;
+-	if (div_reg == 0)
+-		div_reg = 1;
+-	rpi3_console_init(PLAT_RPI4_VPU_CLK_RATE / div_reg);
++	rpi3_console_init(0);
+
+ 	bl33_image_ep_info.pc = plat_get_ns_image_entrypoint();
+ 	bl33_image_ep_info.spsr = rpi3_get_spsr_for_bl33_entry();
+--
+2.16.4
+
diff --git a/recipes-bsp/arm-trusted-firmware/files/0001-rpi3-4-Add-support-for-offlining-CPUs.patch b/recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
similarity index 89%
rename from recipes-bsp/arm-trusted-firmware/files/0001-rpi3-4-Add-support-for-offlining-CPUs.patch
rename to recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
index 33d288b..02d0440 100644
--- a/recipes-bsp/arm-trusted-firmware/files/0001-rpi3-4-Add-support-for-offlining-CPUs.patch
+++ b/recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
@@ -1,7 +1,7 @@
-From 92ff7ed78f8600adc9733663380706a1bdb3e4a9 Mon Sep 17 00:00:00 2001
+From 6368eab6c5129f4ee6679a2daa6f0d5315cfd655 Mon Sep 17 00:00:00 2001
 From: Jan Kiszka <jan.kiszka@siemens.com>
 Date: Sun, 8 Dec 2019 20:48:46 +0100
-Subject: [PATCH] rpi3/4: Add support for offlining CPUs
+Subject: [PATCH 3/3] rpi3/4: Add support for offlining CPUs

 The hooks were populated but the power down left the CPU in limbo-land.
 What we need to do - until there is a way to actually power off - is to
@@ -9,6 +9,7 @@ turn off the MMU and enter the spinning loop as if we were cold-booted.
 This allows the on-call to pick up the CPU again.

 Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+Change-Id: Iefc7a58424e3578ad3dd355a7bd6eaba4b412699
 ---
  plat/rpi/common/rpi3_pm.c | 10 ++++++++++
  1 file changed, 10 insertions(+)
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aea3ac86dffa3b155ba4654ecc4764101b2cd774.1586760835.git.jan.kiszka%40web.de.
