Return-Path: <jailhouse-dev+bncBDOKTXXSZADRB4MW36EAMGQEA5MGHVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3133EC309
	for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Aug 2021 15:56:02 +0200 (CEST)
Received: by mail-il1-x138.google.com with SMTP id r5-20020a92d985000000b002246fb2807csf44136iln.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Aug 2021 06:56:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628949361; cv=pass;
        d=google.com; s=arc-20160816;
        b=iNMmiGJTqzngRClXUleRE+yRIkXYnxNovrjyVAcAPnoHGaKb1pBOn+4SYKttwjWQFT
         U+RbG28V+ddVEBTVqP4ApW5arUQjg99kJhIGAmo7urOYYl9lRwNczEccv+NhStRfQBjT
         K6z6LcXDjwrRgRqH4RdU/dL8b4ko9+vIToyWa6LpK9MJQFQLAVelJMg5NkoohrTIsbsd
         E+IKcE+GJDCZxiRZ2e8K8aQFGZs62dhjK1uOSoG++jVeh87Zs/WvUIStWIAAcgQkeAeO
         xWuYBQ9nmdVbDIRcLeZP0hdNHDUA3ZM445KHL1VjNuzo+f8l2Uw2gzTeoCjZxz/s6NKZ
         m1ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=G39HzdvHPtFrGbO9ApzsHSu+T+v8W6EBPrbBVRyniLo=;
        b=lqQpEul9lDeuNuEHr9EiY9PUAwj93Q0oDGVsgqpqkEgCwEh+nVYRaWXznUHRPyvHh4
         IrAWRDv4mrj0kceJNAYzUPvCWMtiz0z5tg7Z65R/1YOrhuDc1bIv+TZSP+6fnEnQ1ert
         O8J/yLWZWWI4r9o0H+lJac2iad34LbNeGAQGbo4xMxd0vzpHJyYLp/DZ4ie3D62lHdDV
         nxxiJ76ozEEt9G1cBNsWK2Ux4IlXHwns5qvrg6T3J6Tb7MGNg9Ff0UFTbdQF//a1CMRW
         99RZ17f/ijTp9X5cLD2BzD9L5RbxX3cf/JOeO994VFfGT3X2zdaOFBj/+t2tYvFUUT0b
         oWRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=S3RctYwa;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G39HzdvHPtFrGbO9ApzsHSu+T+v8W6EBPrbBVRyniLo=;
        b=rfCiVCgbI9QATg2zCm17Y6F03d+f+J+J5i0iCQ01X5jSKCHn+oDkbu031ZPGZhOJRh
         TvEfd7uEMPt2NjCta3xjcQzxz2wFvIU252EAxuihGv5Ex3MCg5vv0XoXeRd4cmFIcSnP
         3NifBD6srGQBYEZJ1kyLxYrS94iK0LxjkvyJ7p9QwyGc5AxA6nYEBvEJbc2kBslXqGqi
         lml345sycUZrNy+G/ReELlSlhkA3gn9fqXCREpK80Gi97z+y4N9uvg6ClXBdbgjdfJcd
         LzcYzXM03S3ofi++7VAxojKfaQjsd6r5i2p4OnbbHePnvI0N4PrJQE08ofLbqRme6IoX
         K4eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G39HzdvHPtFrGbO9ApzsHSu+T+v8W6EBPrbBVRyniLo=;
        b=ZLuMTaEJqIzvcfi1DbPxAS+zouV9YxB6cBwBf93fI42kZbW/BbfkYMQj5HTlfb6G8M
         5H4Q+/+PJ6RMNtc25YOVN1lVA29dVj9W9gE+usYFLUZgvRglL5SvWZPKepHS4zUKcGWX
         IKTjA7QzWZJTWNuugktaALM5K75Iu0kca+1uIUiSgILKDk1dnQrppn5bSIjOQ3E6Wqhx
         kx4JHQ3HZuFUntPowgKQm7qTidkKKvakKetgVRC81PM02HYpZUr7kMfCyiGn+IbKryRy
         nbnvVUVHk0NgL25iP5RRRM84rzJo1xAJr5yOUKXGwih7XZiMg89nXNOuwQd30/zRfCcc
         EGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G39HzdvHPtFrGbO9ApzsHSu+T+v8W6EBPrbBVRyniLo=;
        b=EKXkD3bcDTe73R7WVMPN3gwOxJb34ZWQNhMII9oOFZJKYJ+Yra2h8wagj6Wvp5IfBE
         3iFGj6pFtgcueHVwGJIQLwhdlA0i/NvBpYirclaemf7d73gvt9YWVpvqDoJ4kiQUyGQa
         fzo+RdnH7fAinN6KxLB0eUGAC7PZMWVKkC4YfQ1gJO7m9yfs+mn+XILOiH/oe/4Djjz5
         VDJ6bnm3ivYTKSaSjmB7TOhRvRi0nUehBhxWwlDcCBO/6X7kXlvSkWlrCG9IWH2JK42N
         wi+xV4GNzufJYP2fP6eJC8NK9fUqadSdbzcPGmQgty4ixwEc1tH5mQGYuvXPPtmJ80Q6
         Fk3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530y2MdxMuG9m4CS3XlVv8U6BMANNiodLOSxDkWdH4D+zM/WoFKe
	+fv9cuaRl2zS0R++94U/S+0=
X-Google-Smtp-Source: ABdhPJzV+cjQI51QxbbKCD3c+CvUlROlpab0F5ezWb96D+1BSBa2DIm2FzflfF3/0C15sOy1JgcEUQ==
X-Received: by 2002:a05:6e02:1c2b:: with SMTP id m11mr2371330ilh.242.1628949361627;
        Sat, 14 Aug 2021 06:56:01 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:20ef:: with SMTP id q15ls628475ilv.2.gmail; Sat, 14
 Aug 2021 06:56:01 -0700 (PDT)
X-Received: by 2002:a05:6e02:15c8:: with SMTP id q8mr5363215ilu.285.1628949361280;
        Sat, 14 Aug 2021 06:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628949361; cv=none;
        d=google.com; s=arc-20160816;
        b=FehkAlFoAY+oAAOKRsuPCCRQ+HnEbaQe3Bwe098A84inMXocrmxMrJcroa3+wlVTJ3
         X6yW23znkifbwPanC30/zV52E2vrmMkLfqfL52NxQCa2jZZhOnWzPn+lX0jrNf7b+CjW
         7DsQ/Sdk9BtrKglwP3eeJ09zVLuPJFE22Gs21f1+Bae6cW/1f/EC3PGfQw8ZM+Pk9GZx
         FO939y2uz1tteSMGtQIhvooGETa6f+4ilW9PMDxB70SdMtDMyyAjHSsF3xtbK86O02RQ
         3pVOM1ZwblWf+B8yl6PjZApp7WTm9Wctxx7eG2YhD75jrue3okgJpVn0DraVLA7ESmml
         KPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from:dkim-signature;
        bh=E2FeKEReNCtsysiHXl+DCWfVdPoEa7fzwgIccKde1HQ=;
        b=Dr7Ec9cskjthWIapmJgUBAs/JstGYWo2p2CkyANg68uUc6AhRsBsk0zNOiAHL0yY3m
         f8l5Hivu+mHLQUdPkYIRqUrZp4QYvkqFtBS5wdC9U38oe3Cp1em2TzteDeAt5n+vnFl6
         oNQ798bs4TUaLS05p12HTIpiHKnJZU74PvkRiIwNsUfhdP6oEFaoiGP0krXG8CEhGN9d
         FyJ4MtzcwGvRs4RX1ZBf8VWQgKT2bnk96Dm41zQ0O+fx3DWaYrBqIG/iA206q0Lel/Pg
         4sl8w42sQQUmVPEHepmlZxNpd+eYit3KRe36nRrMCvRWqk4ld0qO95+SyizEj+po/acW
         yWmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=S3RctYwa;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com. [2607:f8b0:4864:20::1043])
        by gmr-mx.google.com with ESMTPS id e12si265393ile.4.2021.08.14.06.56.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 06:56:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) client-ip=2607:f8b0:4864:20::1043;
Received: by mail-pj1-x1043.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso25044518pjb.2
        for <jailhouse-dev@googlegroups.com>; Sat, 14 Aug 2021 06:56:01 -0700 (PDT)
X-Received: by 2002:a65:6805:: with SMTP id l5mr7057694pgt.0.1628949360514;
        Sat, 14 Aug 2021 06:56:00 -0700 (PDT)
Received: from localhost.localdomain ([47.89.83.12])
        by smtp.gmail.com with ESMTPSA id d198sm5783813pfd.101.2021.08.14.06.55.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 06:56:00 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2] ARM64: Only init bootstrap page table in master CPU
Date: Sat, 14 Aug 2021 13:55:57 +0000
Message-Id: <20210814135557.13135-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=S3RctYwa;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

There is not need to init bootstrap page table in all CPUs,
bootstrap page table is only for boot, when jump to C language
environment it will use the formal page table instead of
bootstrap page table.

Init bootstrap page table in all CPUs will impact hypervisor
startup time.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
 hypervisor/arch/arm64/entry.S | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index a9cabf7f..69af05f9 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -22,6 +22,9 @@
 #define LINUX_HVC_SET_VECTORS_LEGACY	1
 #define LINUX_HVC_SET_VECTORS		0
 
+#define INITIALIZED_BOOTSTRAP_PT	1
+#define UNINITIALIZED_BOOTSTRAP_PT	0
+
 	.data
 vmexits_total:
 	.quad CPU_STAT_VMEXITS_TOTAL
@@ -29,6 +32,9 @@ vmexits_total:
 vmexits_smccc:
 	.quad CPU_STAT_VMEXITS_SMCCC
 
+bootstrap_pt_status:
+	.byte UNINITIALIZED_BOOTSTRAP_PT
+
 /* x11 must contain the virt-to-phys offset */
 .macro virt2phys, register
 	add	\register, \register, x11
@@ -120,15 +126,24 @@ el2_entry:
 	cmp	x1, #0x16
 	b.ne	.		/* not hvc */
 
+	adr	x0, bootstrap_pt_status
+	ldaxr	w1, [x0]
+	mov	w2, #INITIALIZED_BOOTSTRAP_PT
+	/* Check whether bootstrap page table is created */
+	cmp	w1, w2
+	b.eq	1f
+
+	/* Set inited status */
+	stlxr	w1, w2, [x0]
 	/* init bootstrap page tables */
 	bl	init_bootstrap_pt
-
+1:
 	/* enable temporary mmu mapings for early initialization */
 	adr	x0, bootstrap_pt_l0
-	adr	x30, 1f		/* set lr manually to ensure... */
+	adr	x30, 2f		/* set lr manually to ensure... */
 	phys2virt x30		/* ...that we return to a virtual address */
 	b	enable_mmu_el2
-1:
+2:
 	/* install the final vectors */
 	adr	x1, hyp_vectors
 	msr	vbar_el2, x1
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210814135557.13135-1-gengdongjiu1%40gmail.com.
