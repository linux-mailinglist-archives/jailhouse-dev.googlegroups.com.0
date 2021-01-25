Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBNXGXKAAMGQETUL3YSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AD30249D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:58 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id k20sf2393509ljk.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576118; cv=pass;
        d=google.com; s=arc-20160816;
        b=BCgqtvi1hPqqKq3cV/mHtGlW9evRYUJCBKixfMT5JCVo0ptKn8tjhKIIwSG1+lNk8F
         jNLasYeRH7RIfago0zLz+dBmHeXtY5QTGqZWflWPKS2ycwp7LV+hqizJZKim82xEJNps
         ZOG02vAxOhoGp4ePuismCXtHy+iHGG/SQfenUWHVkgSL2ZTlLwDVEy05CsJY3Gl2Q547
         51wgsp7m+k43sIq0y2qmdxFYMN2cT0mZQtAKTvfTL383cUBAcGJLW6jh608D/CsbktnT
         gFwFqo+WBUXoVcU9jy4RVv8GSqtJ+KTwbufoNq/Ah7JJUsQujSwO7Xs/mUJY2lHhA+HX
         72Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=k/UoGYNS5Rbi7y8cBlujaUZ5wIU7nllzJ4h9HSSjVYg=;
        b=hxJCWK0XC13gKIf27MtZumiASw1oC+6zOauzn3XPMTDnXoF895713x/JCBh9FcZ8GW
         Db32lioClbHAB0ZeVPGd5PLcubkEwb0XWl26CwlTiL5GFn7EZImUZGP6ncAxnLXviYgK
         B+5kzIyC9o0upNgQZO6/PtiROvnC1+aMFEMAo4Vyb52xa9PXI06t7iR6budR5KUfVo+5
         9L49QJpVYUfCRxx1cUK3UfhphZY9xScqi1H9dD+RHaaiWGgM0GTQ/z0SLvyDv1qtPR30
         3RWZ2L2BXtXnun1L6yRQRPUfQ2bnsREsf12yV2M/pP+KkzG3NagK8/l2fMLturGO5Efe
         pSdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="c/ACEpUT";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k/UoGYNS5Rbi7y8cBlujaUZ5wIU7nllzJ4h9HSSjVYg=;
        b=gUzLeqslrsM767nmEdstLxNBNpION8qpFU5U6rZMT4EjKs829iznhutzFBOc9QIWdL
         QgQTsKcbi5aATz/15MXEc2qr0z6ft96C5gBL16GpKuBdAjpTQJshvBXVLgkK/Wy7+QZ4
         g4/9VozvEBJmcSAAjEzc21Xjz4tOCgz7u5oD3V7QQLnhOKFC4ZPTQapntOB7EudxKnNH
         Nzqs64TnY+/sNJJHqIZFQ1tNFJPiaOvEYE00BEEjnzLSdMJyqvccwYqpmvfriyRpmEis
         c3xxBQWvsyKRY+D2pZY3xqyUPTcqlAigaUR0XlRmVR6aSjMju4ldTonYDJx8GlXu5dJp
         kCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k/UoGYNS5Rbi7y8cBlujaUZ5wIU7nllzJ4h9HSSjVYg=;
        b=eurRSchAmDGuCFsMtu8E8jhLQYCHYrCh65nVrFQYIih2f+x4Kqaqq1LN8vl4o1F4Dm
         oZNNhoGc9PXybhaqvbM6D/UifA4CC4OWqHKSWICndOeahzSESU4M7kGBJRJObCtueazj
         hXX++Y0xytSdMy3tZ+sxBrs8Nxzf53+sbRvusDFF17C/3j5wHtR2Zwge4Yo1Y3X9ER7E
         josJRNFJMdGzIi6Yh85WtVZhYdsD0qvXVFlTI8iswKdKtRaZtaI3ij1xQWF5yv4SzuHy
         RSW3qk6HHVXHgF6cjsxSQd2H1CFBAzAFG8WVVW+KJHoJuwNRjaj/LTPN3WhPsmljgxon
         Etow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5329ATDIE3D5OWtH8lNZysnkc6u9YSFZxt2pBpKpdY7l/0SiScMP
	IQcmKTEcTTqNe+rJAsAQcJ4=
X-Google-Smtp-Source: ABdhPJzAUWDtSJ2zSC5Z6flygSMxaXqXE1VI6G/bXdql6dsBV+NcviyiSVyK831rbA0+6xQ2UKjuTA==
X-Received: by 2002:a19:341:: with SMTP id 62mr111173lfd.500.1611576118318;
        Mon, 25 Jan 2021 04:01:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8850:: with SMTP id z16ls2043094ljj.4.gmail; Mon, 25 Jan
 2021 04:01:57 -0800 (PST)
X-Received: by 2002:a2e:5803:: with SMTP id m3mr36256ljb.274.1611576117343;
        Mon, 25 Jan 2021 04:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576117; cv=none;
        d=google.com; s=arc-20160816;
        b=UrSYviQ7/yta38vki/n+M/we0eDgo2gaBNqc1nti7e5H4XGAuKVlKqQUo90S98hPMt
         Eoc2ZBEwNTJDzu+HZ4OvrXHBJNldG7Mh6epfFF5eZNLDZoHiGMvmRSx4QPhM4qvQH7ND
         E6FGFu2EcNIaGd83nuE1mmtEYZSWnmPgBvv10US/0nqiEyTodgZ8obtFIdgPZ8kuv4IS
         QPrrIIWwT9wMo7qqRMyBDQQNf2PwwR9W6+XOs8I270IKHHW+hR0NO2K5nuAqzwCUEjrL
         Z6RIGY5DMjeAwwUj230W9nE8khnezjZvNPXJtRKjnr/ESxW9ny3zMzCbgkgRFIxZ7/Nx
         K/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GKjCYIXCFLOLxsksqf9k3NZguF2sTSzGwdoDU+TEzVE=;
        b=0GByu0rbgiNO/6T4OM0JuciCBEYZkVjrhRoMUeCZ7CM6IH4waMQQl1v04lMU4zCnwf
         sR6VNPxGpByzaC4PRo6YH6wwqicauu99hzRw8oLue1QKMPv3+ntzf4afzFy6j7ktxtaj
         J++q/2I89VBRvhB5QnhiEpm6RvhuG0ZPkl76RPzYoHexmO4XxBt8Mfe9tDWUg6/LbzXU
         BwrTStd628xHAQSkngq1fI2mO5gkH0CXdDGy5uuorb5zWRX6jEV0wqN+qdrNZn3YjXH2
         gIH38XCySSn1/624u4y6xFi3DVTSrSHon8f2EN/uKZUAioO22b/09xqufMlIwvVz0GlS
         SGug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="c/ACEpUT";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id m12si572604lfq.6.2021.01.25.04.01.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT4N64Jyzydj;
	Mon, 25 Jan 2021 13:01:56 +0100 (CET)
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
	with LMTP id 9b3kSZKdI9CJ; Mon, 25 Jan 2021 13:01:56 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4N1dqHzydb;
	Mon, 25 Jan 2021 13:01:56 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 21/23] configs: remove color offsets for remapping
Date: Mon, 25 Jan 2021 13:00:42 +0100
Message-Id: <20210125120044.56794-22-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="c/ACEpUT";       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/qemu-arm64.c                   |  1 -
 configs/arm64/zynqmp-zcu102.c                |  1 -
 driver/cell.h                                |  1 -
 driver/main.c                                | 10 ----------
 hypervisor/arch/arm64/coloring.c             |  3 ---
 hypervisor/arch/arm64/include/asm/coloring.h |  6 +-----
 include/jailhouse/cell-config.h              |  2 --
 7 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index ff4bcb25..8e6e46fd 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -46,7 +46,6 @@ struct {
 			.pci_domain = 1,
 			.color = {
 				.way_size = 0x20000,
-				.root_map_offset = 0x0C000000000,
 			},
 			.arm = {
 				.gic_version = 3,
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 0d721e63..2095762a 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -47,7 +47,6 @@ struct {
 			.pci_domain = -1,
 			.color = {
 				.way_size = 0x10000,
-				.root_map_offset = 0x0C000000000,
 			},
 			.iommu_units = {
 				{
diff --git a/driver/cell.h b/driver/cell.h
index 51afe6d8..92afbff8 100644
--- a/driver/cell.h
+++ b/driver/cell.h
@@ -32,7 +32,6 @@ struct cell {
 	cpumask_t cpus_assigned;
 	u32 num_memory_regions;
 	struct jailhouse_memory *memory_regions;
-	u64 color_root_map_offset;
 #ifdef CONFIG_PCI
 	u32 num_pci_devices;
 	struct jailhouse_pci_device *pci_devices;
diff --git a/driver/main.c b/driver/main.c
index 50f7c25c..56955e73 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -362,16 +362,6 @@ console_free_out:
 	return ret;
 }
 
-static inline void jailhouse_init_color_params(
-		struct jailhouse_system *config,
-		struct cell *root)
-{
-	/* coloring temporary load-mapping address */
-	root->color_root_map_offset =
-		config->platform_info.color.root_map_offset;
-}
-
-
 /* See Documentation/bootstrap-interface.txt */
 static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 {
diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/coloring.c
index c066ae24..cc259aee 100644
--- a/hypervisor/arch/arm64/coloring.c
+++ b/hypervisor/arch/arm64/coloring.c
@@ -30,9 +30,6 @@
  */
 u64 coloring_way_size = 0;
 
-/** Temporary load-mapping parameter */
-u64 coloring_root_map_offset = 0;
-
 static inline int coloring_mem_destroy(struct cell *cell,
 				       struct jailhouse_memory *mr)
 {
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch/arm64/include/asm/coloring.h
index 9cb50889..7df19acb 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -42,9 +42,6 @@
  */
 extern u64 coloring_way_size;
 
-/** Temporary load-mapping parameter */
-extern u64 coloring_root_map_offset;
-
 /**
  * Colored operations on a cell / memory region.
  *
@@ -73,8 +70,7 @@ static inline void arm_color_init(void)
 {
 	coloring_way_size = system_config->platform_info.color.way_size;
 
-	printk("Init Coloring: Way size: 0x%llx, TMP load addr: 0x%llx\n",
-	       coloring_way_size, coloring_root_map_offset);
+	printk("Init Coloring: Way size: 0x%llx\n", coloring_way_size);
 }
 
 /* ------------------------- COLORING API ---------------------------------- */
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index af5b5098..6fe2f016 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -135,8 +135,6 @@ struct jailhouse_memory {
 struct jailhouse_coloring {
 	/* Size of a way to use for coloring, preferred to autoconfig */
 	__u64 way_size;
-	/* Temp offset in the root cell to simplify loading of colored cells */
-	__u64 root_map_offset;
 } __attribute__((packed));
 
 #define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)			\
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-22-andrea.bastoni%40tum.de.
