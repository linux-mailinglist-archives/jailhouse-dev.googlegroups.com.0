Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVV76D6QKGQEJSBQDDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA52C16B7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:18 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id f16sf6555200lfk.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164438; cv=pass;
        d=google.com; s=arc-20160816;
        b=d3Kl0or1jF96WJX6AJ5pGow0x/gfheqxI2IWlBmPG135p3ObiSqABAm+z3xLM/ILfa
         6juw/B3yNCUfwrXErjUjmF4l+w9/rfKGN70E55fjgZ2+9+2hFQtsgBGS98aX8kQbWK0H
         8/ffLBsx7Za6/GLh2nGPLZRJQekOXc6dUiydsVcb9U9EEZHcVavjblak8GYgffLTx1hq
         bwNGs7HmBGn+q82LZHA1YqJYWIZQNq997Q7fsDyMZPBYou116xs67PUZ7frQjXVbFEUb
         5LSFADQ9BuXkJVvhXRxwwM7Vi60EgKg9QxBsxUccvNXcuzoXMMRvT31zBZxkv01NEh99
         nnRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=+QU8Z5hw4QM1VJRQ5DM3yS4GM5YC11jvQg4aBjbw9lc=;
        b=MV76BHl0y6jARqWwstIKreYKdCXxHjk90gHB2kJqmxoKrD9pk8vY+zMTKZTr3Kfpad
         8Fs7d9jTnOHtGqRpf/Zt8cGwikuwXdKsGwhkWclhxQIt9HU1qE9GhINT4JEP7EHnS95E
         aVJn+iUsa5WrBDFVYVGvO+py+MhhiaUVQvwAfqk2nVSVhCWITyD99i4Q60fiAUC9bkwL
         xc/kcUfa5q76VLVzislP/ggjqZCWsUA4jNfp6JPwm9boqLw6MJw2Cxp1QZWuYD85x31i
         tMZeeuIF/DF9o47tiE0RP6hmc6Cyv/pjAjpgBcNh7CrJRHsXc5RITR91e4XLti0SQr3s
         ExoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=QHdOqR6e;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+QU8Z5hw4QM1VJRQ5DM3yS4GM5YC11jvQg4aBjbw9lc=;
        b=onG0fvKyjZ/lbU6t55oaln+VElmZ5dn3HLw0ZN8/OMDGBLQnaHw2bwX4X3PMnz/OHl
         aIo9gFudZdIW48WRQm4LzR0b55wt9GdYnBjuXYsIJ1963TeCq6vMrO0hTb9wikCKOsS8
         mH98lo3PKwLCigH5kS9oTMcQEgZ+tihe12WWPefrH9pK0yEpQ4Ey0jqS/xPy+ofleFZn
         /vcUvBjcNTecZ1knhjybEfrOsSYPiGUen168IagTM0NQdYyxfb7CRgkqSnX5yVOLl5So
         NKGyv8BekVYpaWQCaVw68q6deij6AsYddr2ccxXUiUxq38kqUAc5G7ysqri1uaPLQHWH
         2ITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+QU8Z5hw4QM1VJRQ5DM3yS4GM5YC11jvQg4aBjbw9lc=;
        b=WtZKhJM9n5CQ34d3aC6YUkxFf2DMquEFwNRelArrjieqAUVJifEJ+Kz6p1e+UtCSVD
         WgvgFWoq+VuMmCEr0bBY9Vne4+v+XqxQGUqeyL1aDyDqvPxfFl2WIqk5/tJL25b+MkGh
         tRLSWPOIvJVrz8ivNIogzJK/O1cQjRbODAgPrpclVK6D9llXSrWVMSwi6zVTSCjLKaJg
         k0BuiWcyZCCMZofgTeeo7d8El2disbYBljy/Y3sc2oSXqgc+n4bswyfpx8BF7yyyv31y
         iQYpgWk633WP7wlFSEnUDN906M/IAMfauzOQB46E5EoRYFYb4M8xpapcbhQpmcLb9pJk
         oY7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530jY4yzryt/92apmXron0DN5RU1NM2NUUl5un20dUzQJJ/rShyQ
	Pp/wn9oJkoI8rPDv82z0rUg=
X-Google-Smtp-Source: ABdhPJyrFoHd8h/11ufTsizIXTWsbv8IpBi3wZLO/7RbMB5Yb0sEujPOAytr/oJlelEXCpZXIHcsfw==
X-Received: by 2002:a2e:b54b:: with SMTP id a11mr515947ljn.40.1606164438513;
        Mon, 23 Nov 2020 12:47:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6b0b:: with SMTP id d11ls5231491lfa.1.gmail; Mon, 23 Nov
 2020 12:47:17 -0800 (PST)
X-Received: by 2002:ac2:4349:: with SMTP id o9mr372456lfl.194.1606164437410;
        Mon, 23 Nov 2020 12:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164437; cv=none;
        d=google.com; s=arc-20160816;
        b=MR8U5eV+NZUGD1Dd1vOdGrt3q7wlBlArqYTg8PUaQW7ff9pABd57oNJWCHVwqyJuNy
         ByTDmfxQq3IibUN+MxbFdmK4zERoC41jJOiiD4cK2hTh5NxuovfebdNBKIgKmdLpAIe6
         4cG70DTM7Q4l+KAa6YTZDucgaf24nZVi0i5nQpGoyMrhGR5kD9s8VECruyJALN75JlcY
         OJgdt4N2+c43YhBuXSw4N1b7Bkxr0GDQkAxtLjy9R4mEvMG7UDdnCdunckj25+7nwQyi
         m7nH2Sjv34rKJh6BC3MUBXmSyXVO6xo3DHe5qVK/Kxo2J4fvCpgRJAPPsI4AplyiReC0
         3Hgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qzp2Ne85rs5XxpoyK9t0fRGMSQwAQMjT3jKkus6grrQ=;
        b=GYxVFx2MfcsUI67biHAqgLPJjz0NsYPbuDdPeT41ZeuEMjCO3PdaGA0IE/FsPR3dJa
         161ZDZJgjp5poWfjRt3akaoFToZ7KSR9yDW5sMALScEg0fTHoLzizFFLltOZJGRUtS/z
         1dxCArArEB+DSwHOUbGWdogSt7bEqHBWXa2zKP9QnMvd1QRPvavnP8fy9zpnBmHJIdrD
         CutBf1MaOrtEuHmM1gK7uzjgJWezKsbEPip9i7dF5+G1rBOcsGzA36XiBBZ/ioXwdbfl
         OIbmkfwkrQ3N1Zhafod2IwqzPLDJd5MI8GWp3GyAuKPWce5vnKmL9tM2KL78lfL3mxRa
         FOUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=QHdOqR6e;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id f17si53246lfq.9.2020.11.23.12.47.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:17 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Cfzjc6VR0zyTf;
	Mon, 23 Nov 2020 21:47:16 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 3Xev56qFSEPk; Mon, 23 Nov 2020 21:47:16 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Cfzjc1L6JzyTl;
	Mon, 23 Nov 2020 21:47:16 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 07/14] hypervisor, driver: add platform information to configure coloring params
Date: Mon, 23 Nov 2020 21:46:06 +0100
Message-Id: <20201123204613.252563-8-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=QHdOqR6e;       spf=pass
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
index 78af8e97..9c819281 100644
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
index e62e692b..5f786d57 100644
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
@@ -331,6 +335,7 @@ struct jailhouse_system {
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-8-andrea.bastoni%40tum.de.
