Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJHH4OBAMGQECB7YGOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE0345023
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:37 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id p4sf57954ljj.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442277; cv=pass;
        d=google.com; s=arc-20160816;
        b=jVV0XaPjwoCuk6mXgWrDg8MLXfi2TgAm8lXgvtO9tIKBxqWvcZZEeUWrY84LbEwnaS
         54OrESWKP4JD5DkSTFgzlp/C1em0QihtjzX/zIMk1E3UvsrvAeQ5//R5qt7JH7AnLAMB
         2FtLhdGYGxwa6LmgqkqGRdNyFTUsyIyFE7pJRqoVeTczXRskbCXepvPzfMLxrG0tp3lj
         /2eKpIP95oMD0nv9DTcAxQr0grortB+FmLxhzrjtrrFSelm2/x38PQAyK25+/mKOO1+L
         fcdl6V0TKYarI+Cd6jUc+H5lWNv9cPszUEsamkXNSwA1SHNZuV+o56nc8C+hp1PzioTj
         SZHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=riiLDBA2332vezFhbYvSAAnoz6Dd0eJNHOZ7Qs2PYyI=;
        b=KR7U9b0AVie8SwCRLsqWGjE2U/wLT8Zrrea+7CTICine2OgiRXLnDVIpVZek17plwZ
         JOv9m3x8rR824R6Ud9U9CVAdsLmG3fqou48rWPH1h9vTlwqPSNAzqV7kLuC71Ew1HQnF
         LNAcvWU8Z3++rpyLL1amMrfJKprNmJSCFZH+iTBVrWpo86J4J5tUnR8y3PLTI6vuva4P
         7oZnWuo2e/u1Dtry/B1+W+DBYu/Dfs0aea1bAyJA0cr1PSEowF7n9zaFjVEwL+n5xRDX
         FmhA+5uPH/Juj2zwzQrkHfThl7yuAMWaRyAVqtVHWNIJ9+f1tFQbD4cTSY694JkSOgex
         tyDA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=KKt4Ogfv;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=riiLDBA2332vezFhbYvSAAnoz6Dd0eJNHOZ7Qs2PYyI=;
        b=jALRN+mUDsLL+jrdZe7XOa629pTGtWqwXkvyYRMuwl1OUoVYt4c0TzkkdtJOHccr50
         nio0Auc+4FqpKVNbSR2eo1qYv9g7BzKfVWLVCwuGYjwawVWuDiHF7GqJElQNGhSo7zUY
         HSxf4Ll6vpM1hu+XaYWqHu0UeaHbL2WNrktJaYKZtiROK6oucdSnCJVb6SbsCLwqNaUl
         IGxZVSUAAlWI6tcqliKZIYLMSip/cjOAXMmBQgDy+q8lP33XjqpjFbgndb1JJUNfPKiw
         y6CCcamcbQuRsp/zlgYqcckeIo7huUjzPUkJEI1aST4d+w+kX+sOtDktw3rsGTrFL8V+
         Jrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=riiLDBA2332vezFhbYvSAAnoz6Dd0eJNHOZ7Qs2PYyI=;
        b=eDsmLPoVBaTYvgT5EFermrOABG/4OD3G85j+gpErOPPKM8ZIF6lR4OUG5CKy+2i9u1
         Ps4aOwnvlsIJQ3VD9XJUwRtgar9GWWFRIrakgbX2/uzv9emDMWV8jfbtrCimpCXqmrfd
         HtjOmRhNh6wpUhByRWl218e8w9YCCEluje/vmI0MZukC2dNw33UadSR3de3WM6IAJ0fo
         w7VY8IYg2VjGYCR7VvX0w0jkx95p6yFf7f9e1ZHzs00PtN0v6hGFupODeI0ZnNr6K6pX
         XIUsI+khCUiHOOS+s3BJ1Z2ezGrkVsv+Bk4Ba1MwueRdHQoEhAYiQ6QNERWrLlGJMhXo
         Np0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/9C8pf5cWYXvG4rf2r5Vwj35l5xIBbdlg0S9mOUGZHUw6MElL
	1MqQggDMfPBEpirRNsAhFiM=
X-Google-Smtp-Source: ABdhPJx4a0A+ioin6+ys1nIg1JDO70x4wAEWWnn4poFIW+wRU9r6cD3W5fG+g2S3BKd5LB6bkJohtg==
X-Received: by 2002:a19:850b:: with SMTP id h11mr510766lfd.283.1616442277152;
        Mon, 22 Mar 2021 12:44:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls3060418lff.3.gmail; Mon, 22
 Mar 2021 12:44:36 -0700 (PDT)
X-Received: by 2002:a19:791e:: with SMTP id u30mr505150lfc.621.1616442276143;
        Mon, 22 Mar 2021 12:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442276; cv=none;
        d=google.com; s=arc-20160816;
        b=MYFO/AqTKD8ry2iGul4TE9c3G0d3Oyl5scgsq5bWKjGkH0Dg/EbXYei5Q2qZzjcpwf
         rdVz7ShpEycFS/fW2ktLGLVYaJR0uHFRBP/ktXbzZBYe378wNnSR2UmmOS7NBQQ54Zfv
         hyKtZydv+L572D0nW6aeCQdCjhqoj4s8QOpsXrOVN/dkiTfF/+oBdJ+kYSveEczw0WtF
         UsMnegsMvxL8uj+R6lfL7PXg5a7Ap96GQf1c8rWPCzV2oBGg/1w3JiOw8x5gFPjfuwx8
         buMuTn4/NfpdoJ6XkAAh/0aGgRfbwVM1pJ9vB5THunbuqRdui+4CXTAyKIMIOzCQZyFa
         FY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bD25lKaBD02llAOozv3A3l4iW+iWNAFrw1/KR7WNFs8=;
        b=adhcqVqM3PfOFfeHIjw919oakSsyzjHourrFkfngVXbxZLoHi+JQL2i8QhgLSXrRsX
         cbz8Y0dWdCJkacXFztxIG0u15FWflC2M2I4YX5RnivoDV+FdKPDWfWmVJocqKje3bBvI
         bKXciaPHWRBtNCLWP2trmPHP+evux0FjaxsnQDIYIp5gAiT40hY9WHeme15/1tbaHbEr
         KkXeenX/dpYd4v3XtligX4xik8VzHaJ89dsQEe8y7/ji+Yx8KaVDA4C5MMc+X9UioTub
         KxzfURkRAHsXzzQ8mp9N7dyImR04WywgJd58q513lL1V32ppwjnYFoZClBrHo5noNjKs
         ljTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=KKt4Ogfv;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id v26si642586lfo.2.2021.03.22.12.44.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hM3HNSzyXf;
	Mon, 22 Mar 2021 20:44:35 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id PCh3ka64bf2n; Mon, 22 Mar 2021 20:44:35 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hL5TVszyWm;
	Mon, 22 Mar 2021 20:44:34 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 4/9] driver: provide colored ioremap operation
Date: Mon, 22 Mar 2021 20:44:05 +0100
Message-Id: <20210322194411.82520-5-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=KKt4Ogfv;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
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

And provide wrappers for operations used in get_bit_range()

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 driver/cell.c                | 11 +++++-
 driver/main.c                | 75 ++++++++++++++++++++++++++++++++++++
 driver/main.h                |  3 ++
 include/jailhouse/coloring.h |  6 +++
 4 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/driver/cell.c b/driver/cell.c
index ade61edb..cab3a08a 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -335,8 +335,15 @@ static int load_image(struct cell *cell,
 
 	phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
 	page_offs = offset_in_page(image_offset);
-	image_mem = jailhouse_ioremap(phys_start, 0,
-				      PAGE_ALIGN(image.size + page_offs));
+	if (mem->flags & JAILHOUSE_MEM_COLORED) {
+		image_mem = jailhouse_ioremap_col(phys_start,
+				PAGE_ALIGN(image.size + page_offs),
+				mem->colors);
+	} else {
+		image_mem = jailhouse_ioremap(phys_start, 0,
+				PAGE_ALIGN(image.size + page_offs));
+	}
+
 	if (!image_mem) {
 		pr_err("jailhouse: Unable to map cell RAM at %08llx "
 		       "for image loading\n",
diff --git a/driver/main.c b/driver/main.c
index 64e2b9a4..7786dc25 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -53,6 +53,7 @@
 
 #include <jailhouse/header.h>
 #include <jailhouse/hypercall.h>
+#include <jailhouse/coloring.h>
 #include <generated/version.h>
 
 #ifdef CONFIG_X86_32
@@ -104,6 +105,7 @@ static int error_code;
 static struct jailhouse_virt_console* volatile console_page;
 static bool console_available;
 static struct resource *hypervisor_mem_res;
+static u64 coloring_way_size;
 
 static typeof(ioremap_page_range) *ioremap_page_range_sym;
 #ifdef CONFIG_X86
@@ -232,6 +234,75 @@ void *jailhouse_ioremap(phys_addr_t phys, unsigned long virt,
 	return vma->addr;
 }
 
+void *jailhouse_ioremap_col(phys_addr_t phys_start,
+			    unsigned long tot_size,
+			    u64 color_mask)
+{
+	struct vm_struct *vma;
+	/* ioremapping-colored-block params */
+	unsigned long bphys, bvirt, bsize;
+	/* bit: start, low, contiguous bit range width */
+	unsigned int bs, bl, bw;
+	unsigned int n;
+	u64 colors;
+
+	if (coloring_way_size == 0) {
+		pr_err("jailhouse: colored ioremap, but way_size = 0\n");
+		return NULL;
+	}
+
+	/* NOTE: the ioremapped size may not match the size reserved
+	 * into the configuration: the size of the image-to-be-loaded
+	 * can be smaller than the reserved area.
+	 */
+	tot_size = PAGE_ALIGN(tot_size);
+	vma = __get_vm_area(tot_size, VM_IOREMAP, VMALLOC_START, VMALLOC_END);
+	if (!vma)
+		return NULL;
+	bvirt = (unsigned long) vma->addr;
+
+	pr_err("IOREMAP P: 0x%08llx V: 0x%08lx "
+			"(S: 0x%lx C: 0x%08llx E: 0x%lx)\n",
+			phys_start, bvirt, tot_size, color_mask,
+			bvirt + tot_size);
+
+	bphys = bsize = 0;
+	/* ioremap the VAs to colored PAs blocks according to the color mask */
+	n = 0;
+	while (bvirt < (unsigned long)vma->addr + tot_size) {
+		bs = bl = bw = 0;
+		colors = color_mask;
+
+		while (colors != 0) {
+			/* update colors with next color-range */
+			get_bit_range(&colors, &bl, &bw);
+			bs += bl;
+			bphys = phys_start + (bs * PAGE_SIZE) +
+				(n * coloring_way_size);
+			/* depending on the color, the initial vma->phys_addr
+			 * might not be phys_addr
+			 */
+			if (bsize == 0)
+				vma->phys_addr = bphys;
+			bsize = bw * PAGE_SIZE;
+
+			if (ioremap_page_range_sym(bvirt, bvirt + bsize, bphys,
+						   PAGE_KERNEL_EXEC)) {
+				vunmap(vma->addr);
+				return NULL;
+			}
+
+			/* update next round */
+			bvirt += bsize;
+		}
+		n++;
+	}
+	pr_err("end P: 0x%08lx 1P: 0x%llx V: 0x%08lx (bsize = 0x%08lx)\n",
+		bphys, vma->phys_addr, bvirt - bsize, bsize);
+
+	return vma->addr;
+}
+
 /*
  * Called for each cpu by the JAILHOUSE_ENABLE ioctl.
  * It jumps to the entry point set in the header, reports the result and
@@ -579,6 +650,10 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	if (err)
 		goto error_unmap;
 
+	/* If present, initialize coloring parameter */
+	coloring_way_size = config->platform_info.color.way_size;
+	pr_info("coloring_size %llu", coloring_way_size);
+
 	error_code = 0;
 
 	preempt_disable();
diff --git a/driver/main.h b/driver/main.h
index 7c9f661c..a2069a76 100644
--- a/driver/main.h
+++ b/driver/main.h
@@ -23,6 +23,9 @@ extern void *hypervisor_mem;
 
 void *jailhouse_ioremap(phys_addr_t phys, unsigned long virt,
 			unsigned long size);
+void *jailhouse_ioremap_col(phys_addr_t phys_start,
+			    unsigned long tot_size,
+			    u64 color_mask);
 int jailhouse_console_dump_delta(char *dst, unsigned int head,
 				 unsigned int *miss);
 
diff --git a/include/jailhouse/coloring.h b/include/jailhouse/coloring.h
index bf025dff..1b109c67 100644
--- a/include/jailhouse/coloring.h
+++ b/include/jailhouse/coloring.h
@@ -10,8 +10,14 @@
  * COPYING file in the top-level directory.
  */
 /** MSB/LSB function names differs between Jailhouse and Linux */
+#ifdef LINUX_VERSION_CODE
+/* NOTE: use [0-63] variants */
+#define _lsb(x)	__ffs(x)
+#define _msb(x)	__fls(x)
+#else
 #define _lsb(x)	ffsl(x)
 #define _msb(x)	msbl(x)
+#endif
 
 /**
  *  Get range of contiguous bits in a bitmask.
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-5-andrea.bastoni%40tum.de.
