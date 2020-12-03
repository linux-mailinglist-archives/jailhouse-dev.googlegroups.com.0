Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBRFJUT7AKGQE7KHDJPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC482CDB67
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 17:39:33 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id i1sf1166059edt.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 08:39:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607013573; cv=pass;
        d=google.com; s=arc-20160816;
        b=VVT98PlIoleGCmc8kZZEpbODI61Ls5OiUwtE07y237sdzYHsi3xZY452eUdanjwAFI
         6FEZhQ+iO6st83abAAYZ1JSVhwGHgwRUPbweBt++vDfO6k4+C/RVCJCnhXK9eaDaHNaV
         i2wW9pFtVgROJUvYyLZiPSyjmmnlt1xhfecnxDZzhbLbt8o2HTsYb9EzCfvHFSVFOMt/
         OsW/szOLOHG2EdaCCQtYt6tvPgWebd7siCAdo3gg1bkn6zrJ+lFg6qxkbZpJ6QFmU+FS
         C0UexutLWYJVwftjZ0D4ZotPv98+d8JEukpw6tEbrPgY+oiYUSS1ZUlK1wlVHVbFt3Sy
         1mJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ehfUgX0dyH47eEBA+iQ/4IRT+Z8ZhBJr8gz2s5HISRI=;
        b=OYixUt4esm6lroOIaZrvBxzDBDXx21nKbK89BwA1njA6gQc5/jLftwUV1FYu8At1oJ
         4AKNSfOPi4rPzuG3gttuevJsvcFbWtxOCbyvVR770YQuetjbK/J6AEPJdsE0Z8TyahRs
         0FAivgNEcNTV55IMH6NL//KyyLBtLlCoA6+OR+LEyl+Z1m3kd7Nifa5S8Hz57wUkHXYk
         KOoXa6kncpC2LCuvQBXp/I7AHtL/vqgqIXPdcw5te5pmlEupAoeusAzKCcxnwGhjJBWe
         /iPZz19R4rtjr9sb5t6v4SvnBzzmZ9dT4Qiq2rhSs1CKCEyr4h2z23K35oz84akUCBUe
         TVpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=mD40VzH4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ehfUgX0dyH47eEBA+iQ/4IRT+Z8ZhBJr8gz2s5HISRI=;
        b=p7IUx/MT9Yfk0+OfqUIj0FqJXaJstON8H2Xh/c/fGiQZ9huocR3Ykm3S/CPzmwFnUN
         T83rDDqT2up37bapMv8CdIF3V7uAOZjBVr6+M3WyKFV/miI3CQMWqazKTSlfwMPpwMj/
         rfgAy2Xl5BN9VGI4TLcDs6r2Eu5ZLh2gkT+a3VHQ1tsdARA6wmT53mkIzdpVr1djkH9B
         o4uhQtuZ1bR3lscTggyX1sk5lztD23dgKHG1MUH05im/yH36tvVs+lPhwCbUQnkuATHW
         N10D2k5hpxHAvStS3XmZEe61NvqhgnoCCD+6WcwiRBFAVDBjIS+VTf1H+rwYOtRsgztw
         bdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ehfUgX0dyH47eEBA+iQ/4IRT+Z8ZhBJr8gz2s5HISRI=;
        b=Iwv45GH1vexEXkEnK1CctUk70Lc4R47EyolZo7IdVQD3kTTlr0lWw4rMfR+H6GRAN7
         mx+7ZYxxV+xxKOHAp7whEVAdJdNh2ApL995+KycMB1EPWY6bAeOkfrNIoV81kSIbq9yA
         IP+H8RMKWniTCxhht3H8Cx+Mywjlgua4tX5gPQ5mwIzIwpZQDBxmsHA192tvviQsXixO
         3C9gWyf+wHY7lg7w6ZS3ynU3DqvJSbOO6od7+KO5LbZePFyb2kWqKjUTqD3M/O0H5Df2
         YolG4Xf6qY9bnlYX9IakDBpcwhBBEnpTzYa03Z8wYnuIVPuY0cDOMIY03yLt3aCDo6RO
         44SA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hibfFxfkDyJ7dqvKNMa0ZI7J55i7xeGhePIwBC/e8VqfMxNLT
	SKQ0vH+UUWqIcJKvYXX+y3M=
X-Google-Smtp-Source: ABdhPJzBkK0vyVRBvvMQgsh9y5zWeFQMQKyG5P9W7fSdioQEeHdDtoDW62S4nMRFgOT3yUM6j8F5xw==
X-Received: by 2002:a17:906:3153:: with SMTP id e19mr3430315eje.17.1607013572876;
        Thu, 03 Dec 2020 08:39:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:22d3:: with SMTP id dm19ls2094765edb.2.gmail; Thu,
 03 Dec 2020 08:39:32 -0800 (PST)
X-Received: by 2002:a50:d1d3:: with SMTP id i19mr3141299edg.297.1607013571987;
        Thu, 03 Dec 2020 08:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607013571; cv=none;
        d=google.com; s=arc-20160816;
        b=JexKsH1tfX4cb0VfWcE4I1U0axZwM8m3+H0blRGgei1oYMQfGBI+ouEe8WZvmuWRt4
         AzrpVrxJTQhF2u4eDo6LPAA6xq23Ymr+WXShb5IhFN+tmT4O6SQ5+6LFcGnd/d8ZCK0O
         orvbdjHzL6AZNtt7F9LdVWRr+LwUIBjy3Yf72YxZSjSmykR7H3sjeBNL1i/ilUAsc/Xy
         HJed9hDj1Nhs+0bcVm+p6pG5OKfnbz34W8uJe0HEyWx2mHRe+xCF62c0/fFSRnNrTf6G
         hwHKkaCKTl956sB1wEvOZLVqrJEwv/d/doBWNOloHXhG0Gwv/fdl3MwAH3Pl3/VlnUWv
         unqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gKRQ4ztzqu/wJj/dHSOW6MmCw/LONEqNSXPQfQyGhxw=;
        b=dfljPWNGpLwg1l7ZQ1mHTeRMN08RrKIz4KlXYCBgvq6BDTadVtslWPhpernHjlUKPr
         AdWZ6Iwd3BX/WSEKVo3fEZQIjbhpC4e3sHNvpgUNIrHDE1/XTzaYmtrpyWKpbQWzu5gI
         qN3iRNacNB+F9tu3/UA+Q6051aJuJdVqrFz3wS0snm8QH7e6Iwd2BI27JzUEnMcFnImp
         JnPGaHXrvppMml2ZH807iHdhFccrNusgGprHkveeDhwIa26t863mZsjmi67wYbaX4hG0
         OYmi+g/PhKd+KYh0GMG6R5m33l5NuHX4vqSwQy45KN+f3lnq482Xbh8Sx+agfhFfkqxD
         VeeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=mD40VzH4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id v7si126883edj.5.2020.12.03.08.39.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 08:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Cn1l74sTKzyWg;
	Thu,  3 Dec 2020 17:39:31 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id YTTrFQTYxrsY; Thu,  3 Dec 2020 17:39:31 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Cn1l67574zyWc;
	Thu,  3 Dec 2020 17:39:30 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	nikhil.nd@ti.com,
	peng.fan@nxp.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v4 2/2] configs: add Wall and fix bracketing
Date: Thu,  3 Dec 2020 17:39:14 +0100
Message-Id: <20201203163914.54762-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203163914.54762-1-andrea.bastoni@tum.de>
References: <20201203163914.54762-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=mD40VzH4;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

In combination with Wextra, Wall enables additional checks such as
Wmissing-braces.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/Makefile                        |  2 +-
 configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
 configs/arm64/k3-j7200-evm.c            |  2 +-
 configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
 configs/arm64/k3-j721e-evm.c            | 12 +++++++-----
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/configs/Makefile b/configs/Makefile
index 513b0a9b..5a19621d 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -17,7 +17,7 @@ include $(ALWAYS_COMPAT_MK)
 LINUXINCLUDE := -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
 		-I$(src)/../hypervisor/include \
 		-I$(src)/../include
-KBUILD_CFLAGS := -Werror -Wextra -D__LINUX_COMPILER_TYPES_H
+KBUILD_CFLAGS := -Werror -Wall -Wextra -D__LINUX_COMPILER_TYPES_H
 
 ifneq ($(wildcard $(obj)/../include/jailhouse/config.h),)
 KBUILD_CFLAGS += -include $(obj)/../include/jailhouse/config.h
diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
index ace9cd3a..1fc98bf8 100644
--- a/configs/arm64/k3-j7200-evm-linux-demo.c
+++ b/configs/arm64/k3-j7200-evm-linux-demo.c
@@ -233,6 +233,6 @@ struct {
 
 	.stream_ids = {
 		/* Non PCIe peripherals */
-		0x0003
+		{0x0003},
 	},
 };
diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
index d0c8aee3..cc452157 100644
--- a/configs/arm64/k3-j7200-evm.c
+++ b/configs/arm64/k3-j7200-evm.c
@@ -354,6 +354,6 @@ struct {
 
 	.stream_ids = {
 		/* Non PCIe peripherals */
-		0x0002,
+		{0x0002},
 	},
 };
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 1b8b3c4c..af6a5a2f 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -261,6 +261,6 @@ struct {
 
 	.stream_ids = {
 		/* Non PCIe peripherals */
-		0x0003, 0xf003,
+		{0x0003}, {0xf003},
 	},
 };
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index aa5b47a9..19f9d967 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -402,13 +402,15 @@ struct {
 
 	.stream_ids = {
 		/* Non PCIe peripherals */
-		0x0002, 0xf002,
+		{0x0002}, {0xf002},
 		/* PCI1 */
-		0x0100, 0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107,
-		0x0108, 0x0109, 0x010a, 0x010b, 0x010c, 0x010d, 0x010e, 0x010f,
+		{0x0100}, {0x0101}, {0x0102}, {0x0103},
+		{0x0104}, {0x0105}, {0x0106}, {0x0107},
+		{0x0108}, {0x0109}, {0x010a}, {0x010b},
+		{0x010c}, {0x010d}, {0x010e}, {0x010f},
 		/* PCI2 */
-		0x4100, 0x4101, 0x4102, 0x4103, 0x4104, 0x4105,
+		{0x4100}, {0x4101}, {0x4102}, {0x4103}, {0x4104}, {0x4105},
 		/* PCI3 */
-		0x8100, 0x8101, 0x8102, 0x8103, 0x8104, 0x8105,
+		{0x8100}, {0x8101}, {0x8102}, {0x8103}, {0x8104}, {0x8105},
 	},
 };
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201203163914.54762-2-andrea.bastoni%40tum.de.
