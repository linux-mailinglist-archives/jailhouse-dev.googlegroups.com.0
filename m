Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBUGYXPYQKGQE73HHDAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3a.google.com (mail-vk1-xa3a.google.com [IPv6:2607:f8b0:4864:20::a3a])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB014A58A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:57:37 +0100 (CET)
Received: by mail-vk1-xa3a.google.com with SMTP id s205sf4451378vka.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:57:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133457; cv=pass;
        d=google.com; s=arc-20160816;
        b=P7QRO4pULBwcvtTYAAcpq6dea4sb3J8S1YBjoJbB8LTYITR1xR5wUnD2jzgMDCLj/M
         SU61Ex145LHnwbqJmU0xJ/C1GzLYV3vMZrPD58ZBx6uwnYeEFqKq6XzcfrLORCcNK8ra
         UnkU5gKqLDPJAIrOPnQOegQhZ0pBwn9sOfOk8dQNjoVIa/VSXWtFUHzpttm3DXkKcTl6
         S0mwIUQqE3A3eTAVIwI+QF4tKokW5fNlOR13FNTO3RnTRCgYZrWtXjCjMVrIb8ymejdg
         OlWf3RLrAuB4uGwP7fx9ZmjjuRSmMpvjXIVHaN5TTjgcHKx0LzguRUSw/hvEfHtyF1I8
         DGsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bN6/WLyYnYww5DHp34eXZUIhAtrFGUgFDLr1ijq6EIY=;
        b=ukPPExIJrmF5c60Or8wSQe0xb1+xPTM5yUEb+w2WeOShqglLK4/pgd0aS3ewnjxK3c
         04MQvoGtdPMad3yCLje8VxlislDpPiV0R8tw3FwIirBT3Z8mh1Xtpsg5RnYUsZHj5yEK
         8RMhB1+8ddvnHtm7cYdBjyOKvBfBoGHTfqJ1y0j/S34Gy96scdgAJwGhupJO3S2/oSSU
         rK0smyaQO7Z7uEFZThTxAgRjqVvDZDSDFHvSnQmSHmU53CcNaGHdQPeucbMSbuSlNFxa
         8GePi0nQxdaiO+WP3FJNXzO5yrZSPsybuy2NHWxJL9BPdyTxo6w2B0BqTiyjJf00VYuW
         +eWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sjIZIp69;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bN6/WLyYnYww5DHp34eXZUIhAtrFGUgFDLr1ijq6EIY=;
        b=sA6bsFQLl9UU5O+k/1N+HiiPiF+Q/dZ6uPFLXwnxwtO4vSBCPUtNKXkNCPLdORo/jV
         ikrwtwt2+zHCQ0Wsgjs/cZDs1r2Yl/fUNAmi/tWQeoSP4wKDA/4N/Y7etDdGTOLoNHdx
         m/Ur8ZgWwimmdKraL69ALFjJnPHgKYOqUt/K9NhC8Khh4CrP4ncGqX4EaHIdtkOzkFD4
         R6CaFLSdlsp+WBt/7A3sN2imLUjgutGdextoxT2UGoQlKcPWCC3V81rEnK9lIlZMSFWs
         llxw5IVKqq7kwTlXKjF2LLA3+qbPtPpUB/a1wi3fukiowsSdKRK+CMeZWTeSxdZygjx2
         R/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bN6/WLyYnYww5DHp34eXZUIhAtrFGUgFDLr1ijq6EIY=;
        b=FM62Ok37MtxO2rX9JP3/1IxffjwLWHwJmr5xz+256ipijJnYfWRfsn3UIeJyp0D374
         G96AbLIqqFd2UbkbFTj6ZQiGbBAURT33K8VKiKP62cQi3KY9jeLnZm4bCouKuu5gTQbS
         z5GUt3KbbHsNiFgjEHTyXBv1hwCH0Xo66zzhY6xRdt+KHhBt33FQmAWWPjNTuq/Fqv7F
         OcPIGEa0cwi3Y+caHIHoohLaAkRKLUo9OB6K6JRnJcKs6sFtA140/NQv5Wacr6R/k4iA
         ZLVm51FAp7VGwVte4Y0WF7X6sNNSvZUScG7fPa2zu5vZ1GN2hFwG4EMb7RPxsGbSY/qq
         swCg==
X-Gm-Message-State: APjAAAUtB8fm6U21DLgbGobyP1bwZlXc+53K3HGw+4AwiNXEY602kcEI
	QXWtDEmO81Uz6D0dN9lfvd4=
X-Google-Smtp-Source: APXvYqwlPC/YmhQJ14jFbZNbbUQU8M0y1CddFfhgt9A65ZbTUnyHUAXpKDLfIPGsEOQj450N/405pg==
X-Received: by 2002:a67:f144:: with SMTP id t4mr10070712vsm.36.1580133456795;
        Mon, 27 Jan 2020 05:57:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:f288:: with SMTP id q130ls449687vkh.11.gmail; Mon, 27
 Jan 2020 05:57:36 -0800 (PST)
X-Received: by 2002:ac5:cd3a:: with SMTP id a26mr10431811vkm.42.1580133456252;
        Mon, 27 Jan 2020 05:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133456; cv=none;
        d=google.com; s=arc-20160816;
        b=0EoNltRkx9v7ZmGQ9CxDKPeYJtHjFbOdplFJr1hIuvjJM2tt48Oen9WZfDwR0Pl6Ln
         /jixCuczrJmhb+8IaWIi6Itqqmiv6XVixqVsV9di7wefjr9wK7ar9h15eNOEGu693JIq
         gXX01QEkS95aNACBybz3KL1n9bYYAoMX41ogP7grcZ0sRO2T+K161+zggUtxxvk5wjv1
         wFSA2W8AlM3+s9Ly2fSHd+iHvel4tTxqJLVBTIMp7UThT6+YdVl40xsgq/4gyuSXO5WG
         Jg+r7h+K+A5CPYBnCeSyE7Knm5CbXBcxV1kVYZpQhBzMDtJhLtC0AOdD94GfGrVBPCdG
         txew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aPRAsNCyd5UkWfy5k6iaUPp085UsCGGO5OyyoT1FRBQ=;
        b=bCa0RIOC9MVt1wqeecpFqRyezMBow7tFH9Plg7scG9cRKl8nT8RYSRLUjpHefvo/zD
         BTFP5idT+yg0cwcX3lbBBgb6awnViw9t8kgnDjogWPirq4TSqZRLCCZN53I7fGLeCauL
         zZrWGOxCd1jb/DWcQL2vJZYaJkdlfIV+QRMZwyU8p5l33zLZSuf8g0m+qVsIasUx3BCF
         glzmxJjIaHTjQ7BVrv5VAJX3WGGZSMqbwvWV890OVPUTov2tTS/yY+sICQxb5tPe05qc
         hyHJTvMtK5yeO5Dlr82XdAp49ChjIWDt9+coTP7JLW960MLHeBkZSktCB/w17sMnvb0r
         JQ9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sjIZIp69;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id i27si749616uat.1.2020.01.27.05.57.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:57:36 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvZZv020443;
	Mon, 27 Jan 2020 07:57:35 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RDvZn7012827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2020 07:57:35 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 07:57:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 07:57:35 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvS1u090460;
	Mon, 27 Jan 2020 07:57:33 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [RFC PATCH v1 3/4] core: Implement regmap unit for partitioning registers
Date: Mon, 27 Jan 2020 19:26:10 +0530
Message-ID: <20200127135611.21302-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127135611.21302-1-nikhil.nd@ti.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=sjIZIp69;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Implement regmap as a unit, Use reg_map_data as book keeping
data structure per cell.

Register a MMIO handler for each regmap region and handle the
mmio access based on the regmap described in the config.

Implement the regmap_modify_root to map and unmap the regmap
access from the root cell while creating inmate cells.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 hypervisor/Makefile                   |   2 +-
 hypervisor/include/jailhouse/cell.h   |   2 +
 hypervisor/include/jailhouse/regmap.h |  47 +++++
 hypervisor/regmap.c                   | 258 ++++++++++++++++++++++++++
 4 files changed, 308 insertions(+), 1 deletion(-)
 create mode 100644 hypervisor/include/jailhouse/regmap.h
 create mode 100644 hypervisor/regmap.c

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 893ead42..62c86a4b 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -36,7 +36,7 @@ ifneq ($(wildcard $(INC_CONFIG_H)),)
 KBUILD_CFLAGS += -include $(INC_CONFIG_H)
 endif
 
-CORE_OBJECTS = setup.o printk.o paging.o control.o lib.o mmio.o pci.o ivshmem.o
+CORE_OBJECTS = setup.o printk.o paging.o control.o lib.o mmio.o pci.o ivshmem.o regmap.o
 CORE_OBJECTS += uart.o uart-8250.o
 
 ifdef CONFIG_JAILHOUSE_GCOV
diff --git a/hypervisor/include/jailhouse/cell.h b/hypervisor/include/jailhouse/cell.h
index c804a5df..90575bb9 100644
--- a/hypervisor/include/jailhouse/cell.h
+++ b/hypervisor/include/jailhouse/cell.h
@@ -69,6 +69,8 @@ struct cell {
 	unsigned int num_mmio_regions;
 	/** Maximum number of MMIO regions. */
 	unsigned int max_mmio_regions;
+	/** List of register maps assigned to this cell. */
+	struct reg_map_data *regmap;
 };
 
 extern struct cell root_cell;
diff --git a/hypervisor/include/jailhouse/regmap.h b/hypervisor/include/jailhouse/regmap.h
new file mode 100644
index 00000000..98faf2c8
--- /dev/null
+++ b/hypervisor/include/jailhouse/regmap.h
@@ -0,0 +1,47 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_REGMAP_H
+#define _JAILHOUSE_REGMAP_H
+
+#include <jailhouse/types.h>
+#include <asm/mmio.h>
+#include <jailhouse/cell-config.h>
+
+struct cell;
+
+/**
+ * @defgroup REGMAP Regmap subsystem
+ *
+ * This subsystem provides interpretation and handling of intercepted
+ * register accesses performed by cells.
+ *
+ * @{
+ */
+
+#define JAILHOUSE_REGMAP_WORDS		8
+#define JAILHOUSE_REGMAP_BITS		(JAILHOUSE_REGMAP_WORDS * 32)
+
+/** Register map description */
+struct reg_map_data {
+	/** Reference to regmap defined in config */
+	const struct jailhouse_regmap *info;
+	/** Owning cell */
+	struct cell *cell;
+	/** virt address where this regmap is mapped */
+	void *map_base;
+	/** Ownership details for each register */
+	u32 reg_bitmap[JAILHOUSE_REGMAP_WORDS];
+};
+
+/** @} REGMAP */
+#endif /* !_JAILHOUSE_REGMAP_H */
diff --git a/hypervisor/regmap.c b/hypervisor/regmap.c
new file mode 100644
index 00000000..9f3d32dc
--- /dev/null
+++ b/hypervisor/regmap.c
@@ -0,0 +1,258 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/cell.h>
+#include <jailhouse/control.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/unit.h>
+#include <jailhouse/percpu.h>
+#include <jailhouse/regmap.h>
+
+static inline bool regmap_is_enabled(struct reg_map_data *regmap, int reg)
+{
+	u32 idx, mask;
+
+	idx = reg / 32;
+	mask = 1 << (reg % 32);
+
+	return regmap->reg_bitmap[idx] & mask ? 1 : 0;
+}
+
+static inline void regmap_enable(struct reg_map_data *regmap, int reg)
+{
+	u32 idx, mask;
+
+	idx = reg / 32;
+	mask = 1 << (reg % 32);
+
+	regmap->reg_bitmap[idx] |= mask;
+}
+
+static inline void regmap_disable(struct reg_map_data *regmap, int reg)
+{
+	u32 idx, mask;
+
+	idx = reg / 32;
+	mask = 1 << (reg % 32);
+
+	regmap->reg_bitmap[idx] &= ~mask;
+}
+
+/**
+ * Find the regmap which degines the ownership bitmap for
+ * the register address provided.
+ *
+ * @param cell		Cell in which to search.
+ * @param addr		Register address to match
+ * @param idx		Pointer to index, populated with index of register in
+ *			the matching regmap
+ *
+ * @return Valid reg_map_data or NULL when not found.
+ */
+static struct reg_map_data *cell_get_regmap(struct cell *cell,
+	unsigned long addr, unsigned int *idx)
+{
+	const struct jailhouse_regmap *info;
+	struct reg_map_data *regmap;
+	unsigned long start, end;
+	u32 i;
+
+	for (i = 0; i < cell->config->num_regmaps; i++) {
+		regmap = &cell->regmap[i];
+		info = regmap->info;
+		start = (unsigned long)info->reg_base;
+		end = (unsigned long)start + info->reg_size * info->reg_count;
+
+		if (addr < start || addr >= end)
+			continue;
+
+		*idx = (addr - info->reg_base) / info->reg_size;
+		return regmap;
+	}
+	return NULL;
+}
+
+/**
+ * Handle emulation of regmap access as per permission bitmap
+ * Check regmap access permissions and ownership
+ * Based on that, allow or forbid the MMIOs access to register
+ *
+ * @param arg		Private argument, reg_map_data.
+ * @param mmio		describes the mmio access which caused the fault
+ *
+ * @return		MMIO_HANDLED if the access is as per regmap description,
+ *			MMIO_ERROR if it violates some of the permissions,
+ */
+static enum mmio_result regmap_handler(void *arg, struct mmio_access *mmio)
+{
+	struct reg_map_data *regmap = (struct reg_map_data *)arg;
+	const struct jailhouse_regmap *info;
+	unsigned int idx;
+
+	info = regmap->info;
+	idx = mmio->address / info->reg_size;
+
+	if (mmio->is_write) {
+		if ((info->flags & JAILHOUSE_MEM_WRITE) == 0)
+			return MMIO_ERROR;
+	} else {
+		if ((info->flags & JAILHOUSE_MEM_READ) == 0)
+			return MMIO_ERROR;
+	}
+
+	if (regmap_is_enabled(regmap, idx)) {
+		mmio_perform_access(regmap->map_base, mmio);
+		return MMIO_HANDLED;
+	}  else {
+		printk("MMIO access disabled\n");
+		return MMIO_ERROR;
+	}
+}
+
+/**
+ * Modify root_cell's bitmap to (un)mask the registers defined in inmate cell.
+ * Ignore if the root cell does not describe the regmap used by inmate
+ * Handles the case where root cell describes the registers using
+ * different address range
+ *
+ * @param cell		inmate cell handle.
+ * @param regmap	register (un)map to be removed from root_cell.
+ * @param map		true to map the regmap, false to unmap.
+ *
+ * @return 0 on successfully (un)mapping the regmap.
+ */
+static int regmap_modify_root(struct cell *cell, struct reg_map_data *regmap,
+		bool map)
+{
+	const struct jailhouse_regmap *info = regmap->info;
+	struct reg_map_data *root_regmap = NULL;
+	unsigned long long addr;
+	u32 reg, idx;
+
+	if (cell == &root_cell)
+		return 0;
+	if (info->flags & JAILHOUSE_MEM_ROOTSHARED)
+		return 0;
+
+	for (reg = 0; reg < info->reg_count; reg++) {
+
+		addr = info->reg_base + reg * info->reg_size;
+		if (!root_regmap) {
+			root_regmap = cell_get_regmap(&root_cell, addr, &idx);
+			if (!root_regmap)
+				continue;
+		}
+
+		if (regmap_is_enabled(regmap, reg)) {
+			if (map) {
+				regmap_enable(root_regmap, idx);
+
+			/* For unmapping, ensure that its mapped in root cell regmap */
+			} else if (regmap_is_enabled(root_regmap, idx)) {
+
+				regmap_disable(root_regmap, idx);
+			} else {
+				printk("ERROR: Root cell does not own bitmap for reg %llx\n",
+						addr);
+				return -EINVAL;
+			}
+		}
+
+		/* reuse the same root_regmap for next register if idx is within limit */
+		idx++;
+		if (idx >= root_regmap->info->reg_count)
+			root_regmap = NULL;
+	}
+	return 0;
+}
+
+static int regmap_cell_init(struct cell *cell)
+{
+	const struct jailhouse_regmap *info;
+	struct reg_map_data *regmap;
+	u32 i, num_pages, size;
+	int ret;
+
+	if (cell->config->num_regmaps == 0)
+		return 0;
+
+	num_pages = PAGES(cell->config->num_regmaps * sizeof(struct reg_map_data));
+	cell->regmap = page_alloc(&mem_pool, num_pages);
+	if (!cell->regmap)
+		return -ENOMEM;
+
+	info = jailhouse_cell_regmaps(cell->config);
+	for (i = 0; i < cell->config->num_regmaps; i++, info++) {
+
+		regmap = &cell->regmap[i];
+		regmap->info = info;
+		regmap->cell = cell;
+		size = info->reg_size * info->reg_count;
+
+		if (info->reg_count > JAILHOUSE_REGMAP_BITS ||
+		    (info->flags & (JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE)) == 0)
+			goto invalid;
+
+		regmap->map_base = paging_map_device(info->reg_base, size);
+		if (!regmap->map_base)
+			return -ENOMEM;
+
+		memcpy(regmap->reg_bitmap, info->reg_bitmap,
+			sizeof(regmap->reg_bitmap));
+
+		mmio_region_register(cell, info->reg_base, size,
+			regmap_handler, regmap);
+
+		/* Unmap the memory so that handler can be triggered */
+		ret = paging_destroy(&cell->arch.mm, info->reg_base, size,
+				PAGING_COHERENT);
+		if (ret)
+			goto invalid;
+
+		ret = regmap_modify_root(cell, regmap, false);
+		if (ret)
+			goto invalid;
+	}
+
+	return 0;
+invalid:
+	page_free(&mem_pool, cell->regmap, 1);
+	return -EINVAL;
+}
+
+static void regmap_cell_exit(struct cell *cell)
+{
+	struct reg_map_data *regmap;
+	u32 i, num_pages;
+
+	for (i = 0; i < cell->config->num_regmaps; i++) {
+		regmap = &cell->regmap[i];
+		regmap_modify_root(cell, regmap, true);
+	}
+
+	num_pages = PAGES(cell->config->num_regmaps);
+	page_free(&mem_pool, cell->regmap, num_pages);
+}
+
+static int regmap_init(void)
+{
+	return regmap_cell_init(&root_cell);
+}
+
+static unsigned int regmap_mmio_count_regions(struct cell *cell)
+{
+	return cell->config->num_regmaps;
+}
+
+DEFINE_UNIT_SHUTDOWN_STUB(regmap);
+DEFINE_UNIT(regmap, "regmap");
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200127135611.21302-4-nikhil.nd%40ti.com.
