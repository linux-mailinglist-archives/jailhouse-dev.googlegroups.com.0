Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBLHGXKAAMGQEF63UQEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310A302497
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:49 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id ck25sf7210665edb.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576109; cv=pass;
        d=google.com; s=arc-20160816;
        b=LTLuMUkHJq3sRjoyblEb/CV6K8f2talgES/+TrsrYsAD0iGq0YSBp4sH6jjaTFs43B
         jjNYskPlUwyv2AztDUVw7sUrFz2Wzit1Y1FY+YLxB+AvecGUYW/t9Q0LpotllvEL2X4+
         AwGyOu8terIJrYiBpcAmgzCk9v+G8Hto07J/YbrkHkq4ZHK8UH4272NifhEdaHWW79Vr
         U8WWo++leW43wCE1FJzkFzbov925XAfJ188tdnndAntYw70PwBQAapbXCnNCncBsFdgG
         JNJH+iP7YPjqeGRczeiqEQ8tJPelLeBYgDLshzVs//NbH1duFw95AevM3ppj3KemDBiD
         NVtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=aHp00pxABbvkUctRoESLlnxR0JGTFvTQzYYFMjU6cnQ=;
        b=toMwIfw4DiA9WdKKBprIA7XucHqSsYhbHljPpvniSv9kwBrX1ejQVTgL56zYqJKKVD
         Hi7nc7pCebWxBt38vhn3KUV0tLYincHSGFWA1Rz15L8RRqa9eOlfgiDWWILIRBOEiHyE
         wIrDDg5txMuId7GhHxmYs7OOeC+fzydWdvj1albg8+Q/a3lTrgFG9AJM1p+8KQwPAm1L
         PyDyHVmtlf7S989sef8ZELHBiVHuzMO+RXA2gD2ErD3XPvbv5tjjBTHzLonVjVgbJIT6
         bCYqZDVNXZ2KUoedBx+bGM3sL9MZ8cKYPKv/Cf9WV6yCe9U1L7cfxHhqHy0FCA6ri0hJ
         RReQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=T3aaYk7S;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aHp00pxABbvkUctRoESLlnxR0JGTFvTQzYYFMjU6cnQ=;
        b=cu7NPw7j2EPzSNz8vaf4FimUwPZ8ScH61ITFv5YkGyNjNvs7z0nLQdbjQkuz55kmeD
         pF6P4UW5FibNT1ZO8zmInvDF2apTjHsR9Ho6b6kNWEe/KaDQlHSPQ8644J0VDxckWH61
         WHxvBJAt86tU4fDLrcqNd50Ntwr+RNj6GzgCbxGNTkPM8yx+5yzIkS1DsoWT5GkwuM92
         S+MT1k0t/gyPcTfLJ5v+sGIE3Hh2gWCggyUqzkXsnGLG1Z/JUKUWe22Wii7Ls7LCWrkT
         bft0Hh+Jxjemxr+EO06bYg+A2b+lTotRwgPHV26KXrglmOYtvCSEx9E6dtfi0T3yqIQc
         xaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aHp00pxABbvkUctRoESLlnxR0JGTFvTQzYYFMjU6cnQ=;
        b=lA+LNfzqsw/MkkLWovInI5o1GUCoBGbVypwVkq4mHmygYdmY3j+vzrT0oiiYpDuwc9
         kOilw2wuj49qIqr73Iqzz8b1+1sWYtZHuAX59h/x6DcllxY9ZzmCen0aazBc+WqNvaQy
         dOHbkaJ1bzZQrNSnjEUnSSj7DWnJq+aAjsIyPt+2eV9gh39jphaUNv16TalpOv0JwY5s
         T2xl/iNO+MWHEoe4gg9v9i9jQ4KfVRSVwiN0+oo3fJOoZIBH/7V4IX8VWDh3YhHKh6C0
         6QPIL3FHBrxoyZfBLeeaKSJn0qLL9aIXCTNDJOwx9eznd6m8tycZh2Z5Q0hnrXY45vCu
         7yNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315MtPcmVL52CkU4urMj2DTAy1cCsZTaVUxhfU952xlD69z4omT
	tOJIhVSWI0zzY3UqCX7VAIM=
X-Google-Smtp-Source: ABdhPJw2eAatbnDULLWTEmADzX084odUjpsTXkfSyA5ficS6aZX7HYfSATYHLWpfqof8mGngoYkx8A==
X-Received: by 2002:a50:fd12:: with SMTP id i18mr171285eds.220.1611576108872;
        Mon, 25 Jan 2021 04:01:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:520e:: with SMTP id s14ls16109504edd.3.gmail; Mon,
 25 Jan 2021 04:01:48 -0800 (PST)
X-Received: by 2002:a50:934a:: with SMTP id n10mr182115eda.26.1611576108104;
        Mon, 25 Jan 2021 04:01:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576108; cv=none;
        d=google.com; s=arc-20160816;
        b=Wo+xig25aRo/omdFrOpPfUBHwjXYG1HCNa+harDemddiWcSlFjYx5AyrCeHK4wl/90
         bTzheVkjLjLbli8hNABkOmEuglll7ccpIg1kpb0GdoCxfzsnCe1xDfWYaRKlYH1stF6t
         XPV7m4h4DqFgIaIHEgLTocz7CmCdxL1AD0Z/9mN/nQ+M0Jj+AZrXuZ3nXeMOXkFbIYWe
         w7CZCZfwo6ygujrbPp6ivFK5mx058A6EKL4MMmzrKH0F0w/CTI1CX2OFcd/by95VNgmU
         AknMeMKKeVecuxrTejAoRwoIfNrnPApsgnSN1G0R77Da6lT87uB1iepDTSXbKVe6lKLl
         Y4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j4lA3dCOKa86pA3mjUbxPCgrHEgdtkmIpRr3H/MoZnE=;
        b=bbXPUNf9a14GQmQojQlsFy/NvBjF7AxMOIsWh8QIVk9gHKHaYR3wu8uObRj62bVvlb
         mIxEg6tZjlmjQlU9yo6ICauq2im9mrdglzKyjWj7xplE6GR9HigI08Y7CAeECxSY2Oo4
         KeUC1uw0dGjzKxO9BzExOJUoLtRMpPIWpHdPAHoKddMokc8cfAfqaRpVBlK57SDG6fxG
         We57R5FuTHJkxjzTmaL8P8qGRMmrZurjIinJ6ccNx8SZ9Ln5mci1Tos9S401zf5h4iWs
         frmhsLL4L+F8WgmXfV7w+JMl1OSkIG22MmDU4siPb5hVBUzv6eJGSt3h1W+zIMhBve5U
         /oNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=T3aaYk7S;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id k20si748817edx.3.2021.01.25.04.01.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:48 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT4C679fz1089;
	Mon, 25 Jan 2021 13:01:47 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id WTe4Trf14to9; Mon, 25 Jan 2021 13:01:47 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4C1Vmjzyjw;
	Mon, 25 Jan 2021 13:01:47 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 15/23] arm64: coloring: panic if a coloring operation is requested but way_size is not configured
Date: Mon, 25 Jan 2021 13:00:36 +0100
Message-Id: <20210125120044.56794-16-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=T3aaYk7S;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/include/asm/coloring.h | 21 ++++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch/arm64/include/asm/coloring.h
index f8bc1107..b2911a4b 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -21,6 +21,7 @@
 #include <jailhouse/utils.h>
 #include <jailhouse/control.h>
 #include <jailhouse/assert.h>
+#include <jailhouse/panic.h>
 #include <asm/cache_layout.h>
 
 #ifdef CONFIG_DEBUG
@@ -76,10 +77,6 @@ static inline void arm_color_init(void)
 	if (coloring_way_size == 0) {
 		coloring_way_size = arm_cache_layout_detect();
 	}
-
-	if (coloring_way_size == 0) {
-		col_print("Warning: no way size configured.\n");
-	}
 #endif
 	coloring_root_map_offset =
 		system_config->platform_info.color.root_map_offset;
@@ -107,8 +104,12 @@ static inline int arch_color_map_memory_region(
 		struct cell *cell,
 		const struct jailhouse_memory *mr)
 {
+	/* Cell create is the first action that can request a color
+	 * operation. Panic if we cannot perform it.
+	 */
 	if (coloring_way_size == 0) {
-		return -ENODEV;
+		printk("[COL] Way size = 0, but coloring requested\n");
+		panic_stop();
 	}
 
 	assert(!JAILHOUSE_MEMORY_IS_SUBPAGE(mr));
@@ -118,19 +119,13 @@ static inline int arch_color_map_memory_region(
 
 static inline int arch_color_remap_to_root(const struct jailhouse_memory *mr)
 {
-	if (coloring_way_size == 0) {
-		return -ENODEV;
-	}
-
+	assert(coloring_way_size != 0);
 	return color_cell_op(&root_cell, mr, COL_OP_LOAD, 0);
 }
 
 static inline int arch_color_unmap_from_root(const struct jailhouse_memory *mr)
 {
-	if (coloring_way_size == 0) {
-		return -ENODEV;
-	}
-
+	assert(coloring_way_size != 0);
 	return color_cell_op(&root_cell, mr, COL_OP_START, 0);
 }
 
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-16-andrea.bastoni%40tum.de.
