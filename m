Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIHGXKAAMGQEPZA57BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D0630248F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:37 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id v25sf524590lfp.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576097; cv=pass;
        d=google.com; s=arc-20160816;
        b=OZ0C6C5i8uZR0KHR4nUL5GEOuiEzrpq84EzqMM7IQW7iwvCbCYoKHFn9Qhc5+QzQx/
         wcwkBjqJrNSdLmWVO+gvdMlvmDqsjP+g/Z/VCK+S52XNkEL5Q7vD69wLfSmPXgK6n5rG
         6Q32htANg6a8hZJr9KXG2RcAE9gXefCJf8OEyyMb9hFDN1gDoyr4zH2KdSAhLGjp/eJd
         BMOvXYgZutStmg7ODOvwicyjOTsF7lT7CEpGJLzIPbe9BzxPLtLjmc7KxlBvG7PZFX9w
         jjGeccy7M4VNSQBkxeCNcaTEzaL1J+s2iM5PpA0ogteISaMSdrbdueHYQv+LfIAVDSV8
         FP+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KFNwJPFTTesIDB33Z+k+8W9EBINHd6ptY/9Sw6dmXhk=;
        b=fHj0uKOVbvZn+OdrXJd0acs3OqY0pv9jbf/H756tR7mSiKyHPp45qsz4KOtRdlIF3g
         98MWLj9vZwZ/REBpmtA1NTPmFYn5UsYXtjldtHWk8uBQAHC1EVrefoZA3dG/CpdEFbbh
         Zk2Tnh/5TMqy6EoxN2uabt3OJfOMXvQVgu9BuVxNbwAFmaHO47eQ7HUzA6ageUt8Axhy
         yu3StMS+LAtPKrewJEBtMDDvmRLgE7XAvN9ENhkrP204FYCU6u2qplhZRth3MnW/fbGI
         XBJx+AQljKslbykqlqZgOPlPtJ1VkB4o2jbKMNoXfxPh5PCUbuf27gRBytEkynssk3zL
         2epA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=A4nJuGxk;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KFNwJPFTTesIDB33Z+k+8W9EBINHd6ptY/9Sw6dmXhk=;
        b=nfRhUIwBNYaduUxtoMYQomR871I8cMFrO4FkLnGPzYpMtJu+wOdkfbuoK4Tjl6MaAY
         OHUPJoEIHySCCBTDqhrITOP18a7CWsLu8aAykqOQHAmzm7eGb5+C0zL4E7i3/zIBLYVU
         I9OesFDJ4S796bkmLoTX1AMWsDfnB53F5+3n3DR7TtWN5OEhKHfwyIMtGbcgkmKnAfSz
         ZIjFRWyHeXlZkIsU8+hyb5azGvVH4B1eY2P9BB9FFmgZ2qJhRYggNCh9P7+neBDQeTHD
         QXJViZCQwBcxGnhokKvHiBCppzbyNgDtonaQXG0bnqL8U9E3RiOFPoVx0iSVia6/GljG
         lndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KFNwJPFTTesIDB33Z+k+8W9EBINHd6ptY/9Sw6dmXhk=;
        b=IHe0j/VoHMoSEhKz1t9fyM3XOclrV8PDOcJXwlVgMGxPkPxt75QTvONgTYTW8jg9bu
         EIUEVjgNR/YfOrHJZR0nb/Sub4ItyrZJkwxu8CWHEHDtEC9hyEgab/2x5EECQgdao7rb
         olWhpDkIOgYYNusaE+x2BN3L0xKIRfOrrpEGcD149xzOKM3xSCU1N47v875mJ/TBoq/R
         iFeUqevW3DYxB93ZW7x3Fmq8I9fEzGqmep+4tbbsVx0dZ9q+E3UebSkn3aLsQelTYYpC
         qf7SJPDfBp0SHZxQbdUAeV8QC86v4vOQCYJmDxbCmiZqBA0v3OMqNhznUEcxxcXC9vDR
         eZwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GTRNsZy6qGEdcAt+dpGfOjMCPP0TMnSm+Ojlw/UdsQiJnRzkN
	tJTjbJSuLZr3Afm4oM6DMLA=
X-Google-Smtp-Source: ABdhPJztzKtsXfVavQSG82xUckT7Z0Mo+35K4aXVZJlbWgHU0FbZUenQ+QsdSdDaP4rxlicFPqypbg==
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr43730ljj.0.1611576097117;
        Mon, 25 Jan 2021 04:01:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b549:: with SMTP id a9ls2365293ljn.1.gmail; Mon, 25 Jan
 2021 04:01:36 -0800 (PST)
X-Received: by 2002:a2e:b8d5:: with SMTP id s21mr30619ljp.408.1611576096152;
        Mon, 25 Jan 2021 04:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576096; cv=none;
        d=google.com; s=arc-20160816;
        b=jxvAu3omzHgmO8n+1x9TXwPnloP5yAZK7lk52pYy+p9vluCt6ZoIl1i8bFcisAdILg
         DjrIUhSddVf2gJtJLJRO4iDCoMvoPF6FioG+Ko8JjIXs0GmcTw4E4P27fs8ohiejAWln
         dwLixoffC4f5ZaSPg2cj64zs4TnzN+8Eo/2I4kwGOvSqFPI2iRUuF8rHpLnuGw3l15Tb
         3J2Fw/es5iZRxA/DQ6r59bXt7BuzxnrD7aPj8eSs5eGISzxwUzGI6xR/Tw+LDA5PBx8u
         Zj8xyQr2/Dnjj47a22Vv7OBAI8+chK5kpOqfHllIBXkyN4eXVG+1C1r5sWOPXlZ0sT6Q
         +f2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6BFdXs635XBf1om+WteA4yb9vmZLzR1XrnJJ3nHPegM=;
        b=TinODSKw0E5t8joLR70LZf/LK39f2Y4kHCV62PYHFxRe88ZEWEOLay6rIKJ+3OsBAC
         o5kjcIsx7horPoBnFmMNdy5MfFfk2XcArm16m6YDLipS8thhEciLeQF/QD46+2qNMLyj
         avAhX3sM4cxO3vZbmNjdCEHoyMzFHbXqilpAbmBPZ2Tr48s5N0L9MBRYIjeGfOZ+jY37
         txE3TpfVTzbVBWVZDI5JuTKNrTKWVpI61sF6fb+C7fDLTXRCpxPiIsSC//5MQtcb2NJz
         xcBfTetTeOjdNHDhGaSCaXQlfUa5yMjunOXMyA/zaLFjPG4fjbm35muJvBCRPf72Y7MI
         S6eA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=A4nJuGxk;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id a136si643198lfd.5.2021.01.25.04.01.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT3z4bxczydj;
	Mon, 25 Jan 2021 13:01:35 +0100 (CET)
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
	with LMTP id KRjYufFXaGpe; Mon, 25 Jan 2021 13:01:35 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT3y6Bfrzyd8;
	Mon, 25 Jan 2021 13:01:34 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 07/23] hypervisor, driver: add platform information to configure coloring params
Date: Mon, 25 Jan 2021 13:00:28 +0100
Message-Id: <20210125120044.56794-8-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=A4nJuGxk;       spf=pass
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

Allow configurators to specify the size of a way and the temporary
loading address for remapping.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 driver/cell.c                                |  4 ++--
 driver/cell.h                                |  1 +
 driver/main.c                                | 12 ++++++++++++
 hypervisor/arch/arm64/coloring.c             |  7 +++++--
 hypervisor/arch/arm64/include/asm/coloring.h | 18 ++++++++++++++++--
 include/jailhouse/cell-config.h              |  9 +++++++--
 6 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/driver/cell.c b/driver/cell.c
index 30a4c501..8a9fccb4 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -337,8 +337,8 @@ static int load_image(struct cell *cell,
 		/* Tweak the base address to request remapping of
 		 * a reserved, high memory region.
 		 */
-		phys_start = (mem->virt_start + ROOT_MAP_OFFSET + image_offset)
-			      & PAGE_MASK;
+		phys_start = (mem->virt_start + image_offset +
+			      root_cell->color_root_map_offset) & PAGE_MASK;
 	} else {
 		phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
 	}
diff --git a/driver/cell.h b/driver/cell.h
index 92afbff8..51afe6d8 100644
--- a/driver/cell.h
+++ b/driver/cell.h
@@ -32,6 +32,7 @@ struct cell {
 	cpumask_t cpus_assigned;
 	u32 num_memory_regions;
 	struct jailhouse_memory *memory_regions;
+	u64 color_root_map_offset;
 #ifdef CONFIG_PCI
 	u32 num_pci_devices;
 	struct jailhouse_pci_device *pci_devices;
diff --git a/driver/main.c b/driver/main.c
index 64e2b9a4..50f7c25c 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -362,6 +362,16 @@ console_free_out:
 	return ret;
 }
 
+static inline void jailhouse_init_color_params(
+		struct jailhouse_system *config,
+		struct cell *root)
+{
+	/* coloring temporary load-mapping address */
+	root->color_root_map_offset =
+		config->platform_info.color.root_map_offset;
+}
+
+
 /* See Documentation/bootstrap-interface.txt */
 static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 {
@@ -579,6 +589,8 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	if (err)
 		goto error_unmap;
 
+	jailhouse_init_color_params(config, root_cell);
+
 	error_code = 0;
 
 	preempt_disable();
diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/coloring.c
index ea19560c..3748c3f0 100644
--- a/hypervisor/arch/arm64/coloring.c
+++ b/hypervisor/arch/arm64/coloring.c
@@ -28,6 +28,9 @@
  */
 u64 coloring_way_size = 0;
 
+/** Temporary load-mapping parameter */
+u64 coloring_root_map_offset = 0;
+
 static inline int coloring_mem_destroy(struct cell *cell,
 				       struct jailhouse_memory *mr)
 {
@@ -57,7 +60,7 @@ static inline int coloring_mem_start(struct jailhouse_memory *mr)
 	}
 
 	/* Match the address specified during load */
-	mr->virt_start += ROOT_MAP_OFFSET;
+	mr->virt_start += coloring_root_map_offset;
 
 	return arch_unmap_memory_region(&root_cell, mr);
 }
@@ -69,7 +72,7 @@ static inline int coloring_mem_load(struct jailhouse_memory *mr)
 	}
 
 	/* Fix addr to match the driver's IPA ioremap */
-	mr->virt_start += ROOT_MAP_OFFSET;
+	mr->virt_start += coloring_root_map_offset;
 
 	/* Create an ad-hoc mapping just to load this image */
 	return arch_map_memory_region(&root_cell, mr);
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch/arm64/include/asm/coloring.h
index 61def877..7d0ebaa9 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -17,6 +17,9 @@
 #define _JAILHOUSE_COLORING_H
 
 #include <jailhouse/cell.h>
+#include <jailhouse/cell-config.h>
+#include <jailhouse/utils.h>
+#include <jailhouse/control.h>
 #include <asm/cache_layout.h>
 
 #define col_print(fmt, ...)			\
@@ -34,6 +37,9 @@
  */
 extern u64 coloring_way_size;
 
+/** Temporary load-mapping parameter */
+extern u64 coloring_root_map_offset;
+
 /**
  * Colored operations on a cell / memory region.
  *
@@ -56,11 +62,19 @@ static inline void arm_color_dcache_flush_memory_region(
 }
 
 /**
- * Autodetection of coloring_way_size.
+ * Detection of coloring way size.
  */
 static inline void arm_color_init(void)
 {
-	coloring_way_size = arm_cache_layout_detect();
+	coloring_way_size = system_config->platform_info.color.way_size;
+	if (coloring_way_size == 0) {
+		coloring_way_size = arm_cache_layout_detect();
+	}
+	coloring_root_map_offset =
+		system_config->platform_info.color.root_map_offset;
+
+	col_print("Way size: 0x%llx, TMP load addr: 0x%llx\n",
+		  coloring_way_size, coloring_root_map_offset);
 }
 
 /* ------------------------- COLORING API ---------------------------------- */
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 8a3a201f..8934a1f2 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -132,8 +132,12 @@ struct jailhouse_memory {
 	size_t colors;
 } __attribute__((packed));
 
-// FIXME: COLORING depending on design discussions, keep / remove / adapt
-#define ROOT_MAP_OFFSET                 0x0C000000000UL
+struct jailhouse_coloring {
+	/* Size of a way to use for coloring, preferred to autoconfig */
+	__u64 way_size;
+	/* Temp offset in the root cell to simplify loading of colored cells */
+	__u64 root_map_offset;
+} __attribute__((packed));
 
 #define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)			\
 	{								\
@@ -339,6 +343,7 @@ struct jailhouse_system {
 		__u8 pci_is_virtual;
 		__u16 pci_domain;
 		struct jailhouse_iommu iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
+		struct jailhouse_coloring color;
 		union {
 			struct {
 				__u16 pm_timer_address;
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-8-andrea.bastoni%40tum.de.
