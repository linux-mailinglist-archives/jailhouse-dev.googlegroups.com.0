Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBNXGXKAAMGQETUL3YSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4B030249E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:59 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id f65sf3363411wmf.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576118; cv=pass;
        d=google.com; s=arc-20160816;
        b=ankSZRT+quzNAXSwqBH64nzqcRkFG+s04y+3rp8xWysHvB8qmgpO3tdj/jXQLyN9mo
         d3ilQDyVrPCjatVXI+/+bhGI7TICXqxbvUOWnYFVC6p8puVo2z4jTPQ585hLz2TmKUvY
         5m6i7ebKjwTBofSLaCQUdSDBz8Okj23onL3KtD0Lymh3JG3TW9sSfKpzGr+hVkvXTAxp
         nGghU+G16MX+DQK1Ht5GNfdspbhctVSuzVSkE0QhsRFjP+i4EMkPspqXbyppQ6UprtLW
         0nBDulzlghBwUQkt/zHLbES48EXvKbbmE0W8qEdwtacq0ARdm7Nd6OLPp4VVoLQhVkVu
         1wIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LiMu6XI46qPa9SZ7+wsiWaIWn7XFJ9DwIVI01+5mJog=;
        b=IrX8KIgf6Vq66Yt2keKTCb6+MXnTFAbPp0d/fcKxyXn/EqgZrb5KN38cxzR2HjVim0
         +Dkt+zXcXMEaqBfyg7GIEBk/QdFO0yX6e6K5YPRsWhLTi4wf7wEGyrU7wGfRnr1fmI6J
         i7B7ksqbjHxYOG9GUOaMy1Y0bDdYI0p8BGL2d/7pKvUgn8fKcMSSlCBffaiZrBt4He/B
         Enm0YcDcR7ktDeg7rs504F2TM7zR8+jNJCY6u6NXDUXCG4xgp41zSLqvBmvRbpA3PaX0
         QT0o0bBxWZzJ56i83beiJIh991788Cj3Z+38fc5u14kR8UPycb9so1XP2TslEz1Sk40p
         UOJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=xSbbOWJX;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LiMu6XI46qPa9SZ7+wsiWaIWn7XFJ9DwIVI01+5mJog=;
        b=ogOw7SvMzBnfc0Dx6Gr22b0TO7rpgtd+LmCFKZUC93Oyik9O6xr/CafJa9Xk9rgSPU
         LilsvO5l2HgUKfWgniGzIPjzvcUwzLuDSQJPYWxEe7DT987v+XlSqu2cVEh4EheTs52k
         O510g/ilSiZVHVm8+UHq0o84KPNjGRfu36HNHib8RVnrDg90vU1IDK+zuc0BWMlpC0o0
         N4fBYugXp9G4tFxAu9Gmuf424bZDYYm4NBUv4rnhYULfgNLXyRykOXoh/NiH/yJ2g1xb
         jCKMjgCWV+yeXgXwFhM5oxRq/ndQh+3fib4r60RH0gJsIguYhqDcpd6Ngvk9BTHSY+04
         6ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LiMu6XI46qPa9SZ7+wsiWaIWn7XFJ9DwIVI01+5mJog=;
        b=bcDgzEvLNZ8Fx23Z21p581UL70slpTz8NVUAWozwzg9wSMXXrerWdT1OVO7Lfj21bE
         ldLFeHyB0vLRdzv/bTvgFiYJEuSM+hOJv7zVJNvr4s5wj5e49UsvNXVKcBmq+mp0NGQo
         rvRn13vaUqlI4DAb1abauQv5z9+BVnixHVRAlSjlbAVEYI5/GWwKXiUVxLY3Kwu004R3
         t2rnRA+RCI5A9n6+Tgb/YzWOmJPwLMmJBteRl8rguzoMcwZ4HcIrVijMwRm8hRrw9n7b
         D3ELpNZd9pYu0Z+PRsH7yxWJfwdPJ8frYFrf33kWUFm0gZqryrwzrP+2c5UfGU7QFXJN
         w0nQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318aWSG1NcCDNaL9YhJrD17XaywDa+F23onXTN6NT1sAzDRLRL6
	pCS+e7snh6bg0Opp+vOOZQk=
X-Google-Smtp-Source: ABdhPJxhvr7VhCpv0/ZA9cwHgKLz2RKktUdXUdt2dcZE2su0ZnxtC5zHMAioweL3pjQS6zmJ5PhDXQ==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr533239wrq.179.1611576118750;
        Mon, 25 Jan 2021 04:01:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e608:: with SMTP id p8ls98115wrm.2.gmail; Mon, 25 Jan
 2021 04:01:58 -0800 (PST)
X-Received: by 2002:adf:ecc1:: with SMTP id s1mr618861wro.146.1611576118140;
        Mon, 25 Jan 2021 04:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576118; cv=none;
        d=google.com; s=arc-20160816;
        b=zqwv7isuMEFNuAXcGYlfL3PZlexI7erJyJ5jL5P7EiDzf/LfO2qpgQ9YidpsS1Sj1M
         P+84fwHCpjwbO0LyOO+YVI+wmKgDsZh55AMppErAjBpQKNq7rIfoxVY5CD/q6rdEcgNA
         +ILyK2dJCCuCEB+t0Qklw7FIHL+v2yhXzpdmrZwGIqbufaihcOmQAWMvh99uJjNrnpNs
         XKLKKHiXp6nszzkwdwOhp9YBk5lcBQa6dVsEtAtZdMSG5FA7bciTO1pB0fz85d4hPO31
         MI6o8JfWQ31MW/GxhHZDuUdY0WsCy4G0/b/1GvS68ig43UesnlF1EMhda4gNl8T9Qo+R
         6q4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AwZ3e7qjBVPQqSG7o5Iq+ub+I4LR3aNvSDjDG3lXpdA=;
        b=zlmmmOJRMoQ3fBvvjE3uqcQzfzS0iWejxbXN17DTjMl81sJLEW61jZnor9jvXcdZ+o
         Jyz/NVXn/qYO7my3+HHgo5FJpoR6ZT30NwcU6fEPDaNnoS8B3qOSKoNPbg44vqFr/QDK
         SbG9nFIcm2MACVAxlbKigsy6K1eKYKatBWpjkQWb7nfuP04uZ/gonynYZmkWwfFPMkhR
         7hw5hNP2N8KLbmTAtFB7I/z4vmNBxsq2aRGEeg1AE2WH9YO8OKdSBBnriUmYfGG8Jakq
         kV7dwPXVWcHKvWpHwSSa1yd+tfDWOEr59XgZNHTtggSPxgdQEd0Y39XcM/WC8YzEUwhG
         KzSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=xSbbOWJX;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id o203si714378wma.0.2021.01.25.04.01.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:58 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT4P6pmrzyfP;
	Mon, 25 Jan 2021 13:01:57 +0100 (CET)
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
	with LMTP id pXm1R5CL6PvG; Mon, 25 Jan 2021 13:01:57 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4P1lkvzydb;
	Mon, 25 Jan 2021 13:01:57 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 22/23] driver: coloring: add colored version of ioremapping
Date: Mon, 25 Jan 2021 13:00:43 +0100
Message-Id: <20210125120044.56794-23-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=xSbbOWJX;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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

The colored ioremapping uses the same logic as main hypervisor coloring.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 driver/cell.c | 22 ++++++++-------
 driver/main.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 driver/main.h |  4 +++
 3 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/driver/cell.c b/driver/cell.c
index 8a9fccb4..af78f564 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -333,18 +333,18 @@ static int load_image(struct cell *cell,
 	if (regions == 0)
 		return -EINVAL;
 
+	phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
+	page_offs = offset_in_page(image_offset);
 	if (mem->flags & JAILHOUSE_MEM_COLORED) {
-		/* Tweak the base address to request remapping of
-		 * a reserved, high memory region.
-		 */
-		phys_start = (mem->virt_start + image_offset +
-			      root_cell->color_root_map_offset) & PAGE_MASK;
+		image_mem = jailhouse_ioremap_col(mem->phys_start,
+				PAGE_ALIGN(image.size + image_offset +
+					page_offs),
+				mem->colors);
 	} else {
-		phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
+		image_mem = jailhouse_ioremap(phys_start, 0,
+				PAGE_ALIGN(image.size + page_offs));
 	}
-	page_offs = offset_in_page(image_offset);
-	image_mem = jailhouse_ioremap(phys_start, 0,
-				      PAGE_ALIGN(image.size + page_offs));
+
 	if (!image_mem) {
 		pr_err("jailhouse: Unable to map cell RAM at %08llx "
 		       "for image loading\n",
@@ -352,6 +352,10 @@ static int load_image(struct cell *cell,
 		return -EBUSY;
 	}
 
+	if (mem->flags & JAILHOUSE_MEM_COLORED) {
+		image_mem += image_offset;
+	}
+
 	if (copy_from_user(image_mem + page_offs,
 			   (void __user *)(unsigned long)image.source_address,
 			   image.size))
diff --git a/driver/main.c b/driver/main.c
index 56955e73..5351dd2c 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -33,6 +33,7 @@
 #include <linux/vmalloc.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
+#include <linux/bitops.h>
 #include <asm/barrier.h>
 #include <asm/smp.h>
 #include <asm/cacheflush.h>
@@ -53,6 +54,7 @@
 
 #include <jailhouse/header.h>
 #include <jailhouse/hypercall.h>
+#include <jailhouse/coloring.h>
 #include <generated/version.h>
 
 #ifdef CONFIG_X86_32
@@ -104,6 +106,7 @@ static int error_code;
 static struct jailhouse_virt_console* volatile console_page;
 static bool console_available;
 static struct resource *hypervisor_mem_res;
+static u64 coloring_way_size;
 
 static typeof(ioremap_page_range) *ioremap_page_range_sym;
 #ifdef CONFIG_X86
@@ -232,6 +235,74 @@ void *jailhouse_ioremap(phys_addr_t phys, unsigned long virt,
 	return vma->addr;
 }
 
+void *jailhouse_ioremap_col(phys_addr_t phys_start,
+			    unsigned long tot_size,
+			    u64 color_mask)
+{
+	struct vm_struct *vma;
+	unsigned long virt;
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
+	vma->phys_addr = phys_start;
+	virt = (unsigned long) vma->addr;
+
+	pr_err("IOREMAP PHYS 0x%08llx -> VIRT 0x%08lx "
+			"(size = 0x%lx, C: 0x%08llx)\n",
+			phys_start, virt, tot_size, color_mask);
+
+	bphys = bvirt = bsize = 0;
+	/* ioremap the VAs to colored PAs blocks according to the color mask */
+	n = 0;
+	while (virt < (unsigned long)vma->addr + tot_size) {
+		bs = bl = bw = 0;
+		colors = color_mask;
+
+		while (colors != 0) {
+			/* update colors with next color-range */
+			get_bit_range(&colors, &bl, &bw);
+			bs += bl;
+			bsize = bw * PAGE_SIZE;
+			bphys = phys_start + (bs * PAGE_SIZE) +
+				(n * coloring_way_size);
+			bvirt = virt;
+			/* update next round */
+			virt += bsize;
+#if 0
+			pr_err("V: 0x%08lx -> P: 0x%08lx (size = 0x%08lx, end = 0x%lx)\n",
+					bvirt, bphys, bsize, (unsigned long)vma->addr + tot_size);
+#endif
+			if (ioremap_page_range_sym(bvirt, bvirt + bsize, bphys,
+						   PAGE_KERNEL_EXEC)) {
+				vunmap(vma->addr);
+				return NULL;
+			}
+		}
+		n++;
+	}
+	pr_err("V: 0x%08lx -> P: 0x%08lx (size = 0x%08lx, end = 0x%lx)\n",
+			bvirt, bphys, bsize, (unsigned long)vma->addr + tot_size);
+
+	return vma->addr;
+}
+
 /*
  * Called for each cpu by the JAILHOUSE_ENABLE ioctl.
  * It jumps to the entry point set in the header, reports the result and
@@ -579,7 +650,9 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	if (err)
 		goto error_unmap;
 
-	jailhouse_init_color_params(config, root_cell);
+	/* If present, initialize coloring parameter */
+	coloring_way_size = config->platform_info.color.way_size;
+	pr_err("coloring_size %llu", coloring_way_size);
 
 	error_code = 0;
 
diff --git a/driver/main.h b/driver/main.h
index 7c9f661c..4df22e11 100644
--- a/driver/main.h
+++ b/driver/main.h
@@ -23,6 +23,10 @@ extern void *hypervisor_mem;
 
 void *jailhouse_ioremap(phys_addr_t phys, unsigned long virt,
 			unsigned long size);
+/** ioremap an address range considering colors as specified in color_mask */
+void *jailhouse_ioremap_col(phys_addr_t phys_start,
+			    unsigned long tot_size,
+			    u64 color_mask);
 int jailhouse_console_dump_delta(char *dst, unsigned int head,
 				 unsigned int *miss);
 
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-23-andrea.bastoni%40tum.de.
