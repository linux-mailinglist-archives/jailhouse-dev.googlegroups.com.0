Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU5I2GBAMGQELYUAONI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2153416B6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:35:48 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id a22sf17704416ljq.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:35:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139348; cv=pass;
        d=google.com; s=arc-20160816;
        b=VSyPpERSvBy5Ye1zePzWZAyQu+IO/5qNUR8IbUDWfRZu1qPhz/XNlwgTmjiKPlGRfS
         h6iqVmFpK7lcXSjWvY+Z0pdV0lS52YRothTqGoUucpehSUxiyCxsP8Oib+YcCQkUq0AG
         yCy00QuoAUS5H03afjLYBEVPdrPqy9zJVhhidIjIN77jNQtlkkBuR84tQE/K46p7ZFOC
         uVB/MyAVD+0G1MAngoG6zgBYPkl9Q6dijesjGdm2GqEwiVV6YUyvxpqxOtY+yOiZION6
         KmrQDrKjdgm66zKU2dY8IfFZ9rtn8stFoEspTaPrUYMHHRh/fxF9cR+msWox2PaceKON
         V/Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GcqH8WX6L3V21IUp/Ol5WZ8UhIXWBmBZ2qVt6/D6xu0=;
        b=iMAk2bHPRk/lxdZtrjjQmLvTKbDFOXsMCvpEVrRv/6A0kAE0jBu4yVmkoNQkcFWTiG
         Wie23LsgOUO0Chy237Mfnwx9sMIw0/Dc2qAOS/NrDCNhfgwJsAnosfGKDXhBVpfjgOhU
         UOOFOGkl5ebBUqHV9u8El5KyQWjZukDhbD8YjpX1yWG1Vc8aCVIb5ye5P427wou37h5+
         J0f/8GCg8yrsDsODm+VYOg1Xm2/MPzRtWcmC1T0nY3W3ZwsPz+oy9Sd07HpIVyREcb7+
         xAxQiXFXX+bj+wkM0Da9smRh131uVUrNDsk9qlFa+zekup+DHpWZIPqLBgb+kJ5lFvcX
         /7mw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GcqH8WX6L3V21IUp/Ol5WZ8UhIXWBmBZ2qVt6/D6xu0=;
        b=f1Il1bYXCUC+sSLTMjB+bRx1HXl+1RqP9U2ZSUSKXS/KaKmTCg5OY1u5cR3heX7iKC
         JPgsOZ/oAwhb5YeRqIh86EceZLA+NxiF8t97GLIGKh7OUh9XXTUVnOpeBlvSGDjambqU
         thSep8BRuwJY2q27wBwxEm+aC644ytJuJHzVuAu01/HWPgTEnpsCKBgLA7Iv4mjNp4xt
         nL1jx0XMYscMIJedQIVZxl8bkDCJ6mOJt7mZRicnBXOJWmQW8VB8XsW/Rg/UZz5/FjS3
         EBE5SxAgrIsgVqwF07sLYi2Kg8953v9OWpSVc0JwOWw/fylX+66MKQANsH69nE0pew2f
         aXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GcqH8WX6L3V21IUp/Ol5WZ8UhIXWBmBZ2qVt6/D6xu0=;
        b=XnNCO1PgjkLmIIm2Sf7ydjw02ix26MXJLKDqTSdm23VEnZpT+fCfqVYM47UwraBsH/
         6pYs+FbmOZvN0wD6qNz8ZUrILEk8CxUqgGig5PvHRNIDRrsp4KnvIXQlw67mdSgXVB+Z
         ThN/G2ShImkWTTuSPq1pyr83ZZHk7qMdOqe2Ugu2QuZJYzylApH6XWzNY62+FxWPCilU
         OUQW1upQ9Ox0SqSqFBH6ix6dDuMIWRKJlE30kqmSPgDxgd1/oYlg8RFshKmQSIzubW31
         Ov+BUrWWIZEbJurRTWC4QLb2r2ppQTdf6uHsgBak5ZUOzdIJtLf/T4gIYkh5C9z85YSp
         N/qg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530jNHuaEC6670wXYzwjiGrqzDsPpwggH9flbiKjHJNeYBhrIlAO
	Kr9SY8e6GAHk06kuw0YCmvM=
X-Google-Smtp-Source: ABdhPJzAqwCkbCFsyAp4kvsN+P4yznnyXSSu2/C/VklZXdND2YA7Tz4GTcjIYwJu00ARRKsKI0ntag==
X-Received: by 2002:a2e:a58f:: with SMTP id m15mr65133ljp.400.1616139348136;
        Fri, 19 Mar 2021 00:35:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58f8:: with SMTP id v24ls3535250lfo.2.gmail; Fri, 19 Mar
 2021 00:35:46 -0700 (PDT)
X-Received: by 2002:a05:6512:3481:: with SMTP id v1mr41348lfr.193.1616139346902;
        Fri, 19 Mar 2021 00:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139346; cv=none;
        d=google.com; s=arc-20160816;
        b=rudoOchLaEDnrGdHteDNW3ddZm5RwgSHbmELMsSSUUTJ0qJCAbUZBFqICinZRmIWtA
         tMg9KagPPoVkM5eFqPDnFRgvaCXrbyY9urmOgkC1GzEvSKDS/Y/z61oIx9jJajEHFqNf
         pDhMWd3iFsRYVYWXH+OGps+jJn0nbcxxhaVG34A4d6yo/5fllah1Yer7I2OtaFF25IsQ
         3tDEQoWZpenyY0hpzDFroY1J7GPy8h6wnys32TlDlw0w+lQ/8FIZYypiLHN6kljdofja
         DFt/3TD5THVK5dyQ/+mCWr9NRF/1Em8w+ezYD8BizlRnSFdD3VtyHNNTErwuJdPlzADh
         /WsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=h1A9++sRyhXQGbTmM89+KUnrBRdB3bAUlxJkwCFzUwM=;
        b=GNLztLNfKmdW8/EC1VvAYyfif9JraPqvbkGNpbC+vhU+J89lrf6bltyVsX1WzMhH7v
         /3SzB1f6IRDYAOQctpqIUSQRuJq6cwn9AmoB2x9v7jwGrFDncYP2IEr1slTRFUCCuXqJ
         QhFOtQOL7lN64tzOiCJNyoBO9xwO1uxmon3kRZ+raXFZCQyg+oSjjyBBZblnzR1ugIpJ
         wGghlbOuUmcjVlyvDgvhgpwlYG6mhxq/KWdZcdN+G0c7dt8/L2rM5wM3eVtGuEP3C7rz
         S8puEmKY9SGZfgqIUcebSz9oI2Azr+76yWF7V3yXiKMzs+9f4alubu1E49Imor3gFeFg
         rQwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 63si159794lfd.1.2021.03.19.00.35.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7ZkU5022845
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:35:46 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjBx004384;
	Fri, 19 Mar 2021 08:30:45 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 01/11] arm-common: Reorder gicv2_cpu_init
Date: Fri, 19 Mar 2021 08:30:35 +0100
Message-Id: <49b3b33c1338a59fd333c69fffbff813990f8042.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616139045.git.jan.kiszka@siemens.com>
References: <cover.1616139045.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This pulls CPU ID validation and gicv2_target_cpu_map setup to the
beginning of gicv2_cpu_init so that we can fail early if needed, before
any changes to the hardware configuration are made. This will also help
when introducing SDEI-based management interrupts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/gic-v2.c | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index 4b69f74b..6a86ca8c 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -102,6 +102,24 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
 	u32 cell_gicc_ctlr, cell_gicc_pmr;
 	unsigned int n;
 
+	/*
+	 * Get the CPU interface ID for this cpu. It can be discovered by
+	 * reading the banked value of the PPI and IPI TARGET registers
+	 * Patch 2bb3135 in Linux explains why the probe may need to scans the
+	 * first 8 registers: some early implementation returned 0 for the first
+	 * ITARGETSR registers.
+	 * Since those didn't have virtualization extensions, we can safely
+	 * ignore that case.
+	 */
+	if (cpu_data->public.cpu_id >= ARRAY_SIZE(gicv2_target_cpu_map))
+		return trace_error(-EINVAL);
+
+	gicv2_target_cpu_map[cpu_data->public.cpu_id] =
+		mmio_read32(gicd_base + GICD_ITARGETSR);
+
+	if (gicv2_target_cpu_map[cpu_data->public.cpu_id] == 0)
+		return trace_error(-ENODEV);
+
 	/* Ensure all IPIs and the maintenance PPI are enabled. */
 	mmio_write32(gicd_base + GICD_ISENABLER, 0x0000ffff | (1 << mnt_irq));
 
@@ -146,24 +164,6 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
 
 	cpu_data->public.gicc_initialized = true;
 
-	/*
-	 * Get the CPU interface ID for this cpu. It can be discovered by
-	 * reading the banked value of the PPI and IPI TARGET registers
-	 * Patch 2bb3135 in Linux explains why the probe may need to scans the
-	 * first 8 registers: some early implementation returned 0 for the first
-	 * ITARGETSR registers.
-	 * Since those didn't have virtualization extensions, we can safely
-	 * ignore that case.
-	 */
-	if (cpu_data->public.cpu_id >= ARRAY_SIZE(gicv2_target_cpu_map))
-		return trace_error(-EINVAL);
-
-	gicv2_target_cpu_map[cpu_data->public.cpu_id] =
-		mmio_read32(gicd_base + GICD_ITARGETSR);
-
-	if (gicv2_target_cpu_map[cpu_data->public.cpu_id] == 0)
-		return trace_error(-ENODEV);
-
 	/*
 	 * Forward any pending physical SGIs to the virtual queue.
 	 * We will convert them into self-inject SGIs, ignoring the original
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/49b3b33c1338a59fd333c69fffbff813990f8042.1616139045.git.jan.kiszka%40siemens.com.
