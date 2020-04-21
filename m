Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBF4K7P2AKGQEZPOYQRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF31B238F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:08 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id b16sf5585652lfb.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463448; cv=pass;
        d=google.com; s=arc-20160816;
        b=c4nOvAvYmfxO2AchZWGskjTH9oegKVGL4VU4BUEbpU8x8sZfm07E1jMfGiiYEIZ5T6
         62SiqbxGPM6EN9dzp8H5zYLyOSeDCWSVKiQAB0gP64dg0g/tYhVlQCXAlSMskBmHZ2DK
         I8mpUs6VJW9ucBjcE7mWg66fVwlZRUHQ4re62Ek1t7lqNgm3lf7y3TNayjZpV0aG0aPR
         4+rPWLfADApD4DhkwflhlvmxJ4s86RWv7wnDsUbQk0HVFakEnqln2kR3vAq/d6AjBcIY
         95bfXyv0XwtWcCmZ64EJbft7riAuuRwj6zMfFlbONgLaxQoP/P5MurdLZ0iA2LVPjMnO
         mQpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=wToWc3U+2qI+JbDaWtz0EqDtshO3uTNOm2YYMbCHlAk=;
        b=NXQn79jbDOnOk7r80bPB8gnZyIFu59lCFqWRULrUCsOgugr0LrJtl5RsfM/Zr4R6hR
         K1oor1on29dgsGe9EJeMkGDYi9Vv7CFy3FN0Z2daiS64t88gsrEnPrgRMEE3ih0H8pWs
         Nuo4tZqzh2Tt1V8ooyv0V89Og+3FBzmaLNhpa60NxdczrAsKbf1tFCxAYI2qXdsGT4DO
         RNGCqOp65IMNrI/q/p5qYsC1Gkym2qcUvJ5NVoPnset+rUKA7lYxq9EacQPbEK+UMBBV
         5QaZ8lFZcSAMqq4FgibygSsEbLkdKs53omkyEXqMffw0pP3k2Hqqlv15twd3ijCmLJqh
         qdPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=TMt9MuR2;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wToWc3U+2qI+JbDaWtz0EqDtshO3uTNOm2YYMbCHlAk=;
        b=L9f+2u5+Sv5qrxmrZxdcVlWyrFRcFF6Eqmge+rDhFjBMR4idHUy2V4RNfFZrd+lrpJ
         2mjaS6mp8oqask+0PRAnP06xjwLhx3LNr9itIwrH0X4ro9EhlK3ud2E5hhC8Mp3/O8OG
         Kb/P3/D1/TN9K/S++7MXoqwXEOLS1tXy3gASOh+12xuV8Vu0cphN6YW/Ze3uaQHKuf6E
         YvYfySkbum/eGtDAcT8RMY/FNUcSro7S2EdR+t8ixEls3SlFX0R+/Z8v2VXlneg2bsEz
         W1HE8j9WGyAbPpXPaM0WT+XtAbYo5hakm0DE4ANOLn/4Mom1G6rhbOWOjXd+GUM3PxfB
         D5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wToWc3U+2qI+JbDaWtz0EqDtshO3uTNOm2YYMbCHlAk=;
        b=dinRczeUc4mCDx8fLf75NTEzfRuaT3tMj5N+dgGO0/naO5sMpsRxEwgNf2vDvDb6Le
         2Tv+IUEbSGlxTPDLNeYNtXFGaaMGovU2oIc6JXI5EYflsQueppGmR76cKi1sL1Dj47LL
         iYiV6qtZytdd7mqMJpl8AseZyT+S/WVlPCsv/m8ZmB0hthw9chHK/SzFTRSPqdrVi0VB
         kmiZO4VN37ELElcBZrrmZkSQ/kXFAQy+c2ZLlPGuO8/EOPchgM4zcBctkmDCKqW8VIrH
         K1gB89AlUp1e44wmXb29HDzp0/gemeqEcDfvElDP5Y6glxnCZNJew74QilHwg1svvOJ7
         nsIQ==
X-Gm-Message-State: AGi0PuarSRH6dBLDvJnbDj7xZzpqCwlSM2w1/hiZH8/tsA+vX5668Vd5
	9NENJ2zbSdasjPSDrwPm8to=
X-Google-Smtp-Source: APiQypJbFO8JSManX70LLuKNJvkHDMvYcbG4L9WwT0HC/v9izO1v6JUHdgX4EmeMQM5KHTo5ozqZFQ==
X-Received: by 2002:ac2:4573:: with SMTP id k19mr12953496lfm.144.1587463447882;
        Tue, 21 Apr 2020 03:04:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c88a:: with SMTP id y132ls2152278lff.4.gmail; Tue, 21
 Apr 2020 03:04:07 -0700 (PDT)
X-Received: by 2002:a19:2d1d:: with SMTP id k29mr13316770lfj.46.1587463447092;
        Tue, 21 Apr 2020 03:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463447; cv=none;
        d=google.com; s=arc-20160816;
        b=Noxsy48wCpsiHxWkt3BzBpMAT4KpZhh/Ol4EWI15zT5nRYNQjputW/6SkoN9Kkev19
         D292+sT7NeubL0E5JLTiItxjA9lgg5+1dOM/y9/Q8dKbTQEgJDE1GOutgemUFO/VnH+X
         g/Z1S4U5YZpxgcKQo9/HLA5D4iJFjowwdYrIJ4HCVFKp59A5Mrz++1Lt3i2lQN4oIBDs
         qEKModuulI6CkFSrWYVm3dJBBlS0MKzZQFJQL0+k9a63xHrRDiiFs3vRzBcL6cD2i47j
         i3YbYlI2GxblwICDSpGYdX/x7MYvZwJtTLuAmxDpVz1+aPbWWzSN3whedPEweLb252Xr
         5gqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=26mfta19/pVQ53Stjv2alxBd0Mk1xsPKutgFuPEx5RE=;
        b=TXNQuSUQ3BOU4ZZ9zCHJxBamULsWZrKtQjCPot5p3vvoSUK0N54xLe9ufTaRzFGUbw
         PMHMtlmxfLA0wOwxv3Q48+RD5crFPwS0Hln65DBnR7lKMggslLIJc5pF/qIachR+NIUa
         kZ/ySrtyVjDFM1Ufb/8S89Bgsg9fpdQzlgQC91/CGVVkI0FaC+s8ynMWuj9nPXHY81qU
         BonqOto8hDe7bZc7RkRkZXMMnZ6nhdQmZT/7tkcMR/m/7Dg7rcLmkKUVFysWavx7vJyf
         O7TiF9GwWicsSythtyNWXwon3cBD8NnOgJDLDNeeNqFspzJi/IkuE52kxYdy6kKk1mQa
         TLLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=TMt9MuR2;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id q24si140012ljg.4.2020.04.21.03.04.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl7-0005CA-TX; Tue, 21 Apr 2020 12:04:06 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>,
	Angelo Ruocco <angelo.ruocco.90@gmail.com>
Subject: [PATCH v2 7/9] hypervisor, arm64: add cache coloring support
Date: Tue, 21 Apr 2020 12:03:49 +0200
Message-Id: <20200421100351.292395-8-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=TMt9MuR2;       spf=pass
 (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted
 sender) smtp.mailfrom=ms@xt3.it;       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
X-Original-From: Marco Solieri <ms@xt3.it>
Reply-To: Marco Solieri <ms@xt3.it>
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

From: Luca Miccio <lucmiccio@gmail.com>

Implement all the functions needed by the coloring interface for the
arm64 architecture.
Coloring selection is retrieved by the jailhouse_cache structure(s) in
cell's configuration. Each structure defines a color range that will be
mapped to the corresponding color bitmask. The configuration is
cell-wide and will be used with all the memory regions flagged with
JAILHOUSE_MEM_COLORED.
If no color selection is provided by the user and coloring is enabled,
use all the available colors on the platform.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
Acked-by: Angelo Ruocco <angelo.ruocco.90@gmail.com>
---
 hypervisor/arch/arm64/Kbuild     |   1 +
 hypervisor/arch/arm64/coloring.c | 232 +++++++++++++++++++++++++++++++
 2 files changed, 233 insertions(+)
 create mode 100644 hypervisor/arch/arm64/coloring.c

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index c34b0f32..6c566e4d 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -22,3 +22,4 @@ always := lib.a
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
 lib-y += iommu.o smmu-v3.o ti-pvu.o
+lib-$(CONFIG_COLORING) += coloring.o
diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/coloring.c
new file mode 100644
index 00000000..cb2d80e9
--- /dev/null
+++ b/hypervisor/arch/arm64/coloring.c
@@ -0,0 +1,232 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Universita' di Modena e Reggio Emilia, 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Marco Solieri <ms@xt3.it>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+#include <jailhouse/coloring.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/entry.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/control.h>
+
+#define for_each_cache_region(cache, config, counter)			\
+	for ((cache) = jailhouse_cell_cache_regions(config), (counter) = 0;\
+	     (counter) < (config)->num_cache_regions;			\
+	     (cache)++, (counter)++)
+
+/** Default color bitmask uses all available colors */
+unsigned long color_bitmask_default[COLOR_BITMASK_SIZE];
+
+/** Do care bits for coloring */
+unsigned long addr_col_mask;
+
+/** Max number of colors available on the platform */
+#define COLORING_MAX_NUM ((addr_col_mask >> PAGE_SHIFT) + 1)
+
+#define MSB_LONG_IDX(word) (word ? (BITS_PER_LONG - clz(word) - 1) : 0)
+static inline unsigned long msb_color_bitmask(unsigned long *color_bitmask)
+{
+	unsigned long ret = 0;
+	unsigned int layer = COLOR_BITMASK_SIZE - 1;
+
+	if (!color_bitmask)
+		return 0;
+
+	while (!ret) {
+		ret = MSB_LONG_IDX(color_bitmask[layer]);
+		layer--;
+	}
+
+	return ret;
+}
+
+#define CTR_LINESIZE_MASK	0x7
+#define CTR_SIZE_SHIFT		13
+#define CTR_SIZE_MASK		0x3FFF
+#define CTR_SELECT_L2		(1 << 1)
+#define CTR_SELECT_L3		(1 << 2)
+#define CTR_CTYPEn_MASK		0x7
+#define CTR_CTYPE2_SHIFT	3
+#define CTR_LLC_ON		(1 << 2)
+#define CTR_LOC_SHIFT		24
+#define CTR_LOC_MASK		0x7
+#define CTR_LOC_NOT_IMPLEMENTED	(1 << 0)
+
+unsigned long get_llc_way_size(void)
+{
+	unsigned int cache_sel;
+	unsigned int cache_global_info;
+	unsigned int cache_info;
+	unsigned int cache_line_size;
+	unsigned int cache_set_num;
+	unsigned int cache_sel_tmp;
+
+	arm_read_sysreg(CLIDR_EL1, cache_global_info);
+
+	/* Check if at least L2 is implemented */
+	if (((cache_global_info >> CTR_LOC_SHIFT) & CTR_LOC_MASK)
+		== CTR_LOC_NOT_IMPLEMENTED) {
+		printk("ERROR: L2 Cache not implemented\n");
+		return trace_error(-ENODEV);
+	}
+
+	/* Save old value of CSSELR_EL1 */
+	arm_read_sysreg(CSSELR_EL1, cache_sel_tmp);
+
+	/* Get LLC index */
+	if (((cache_global_info >> CTR_CTYPE2_SHIFT) & CTR_CTYPEn_MASK)
+		== CTR_LLC_ON)
+		cache_sel = CTR_SELECT_L2;
+	else
+		cache_sel = CTR_SELECT_L3;
+
+	/* Select the correct LLC in CSSELR_EL1 */
+	arm_write_sysreg(CSSELR_EL1, cache_sel);
+
+	/* Ensure write */
+	isb();
+
+	/* Get info about the LLC */
+	arm_read_sysreg(CCSIDR_EL1, cache_info);
+
+	/* ARM TRM: (Log2(Number of bytes in cache line)) - 4. */
+	cache_line_size = 1 << ((cache_info & CTR_LINESIZE_MASK) + 4);
+	/* ARM TRM: (Number of sets in cache) - 1 */
+	cache_set_num = ((cache_info >> CTR_SIZE_SHIFT) & CTR_SIZE_MASK) + 1;
+
+	/* Restore value in CSSELR_EL1 */
+	arm_write_sysreg(CSSELR_EL1, cache_sel_tmp);
+
+	/* Ensure write */
+	isb();
+
+	return (cache_line_size * cache_set_num);
+}
+
+int coloring_paging_init(unsigned int llc_way_size)
+{
+	unsigned int i;
+
+	if (!llc_way_size) {
+		llc_way_size = get_llc_way_size();
+		if (!llc_way_size)
+			return -ENODEV;
+	}
+
+	/**
+	 * Setup addr_col_mask
+	 * This mask represents the bits in the address that can be used
+	 * for defining available colors
+	 */
+	for (i = PAGE_SHIFT; i < MSB_LONG_IDX(llc_way_size); i++)
+		set_bit(i, &addr_col_mask);
+
+	if (COLORING_MAX_NUM > MAX_COLOR_SUPPORTED)
+		return -ENOMEM;
+
+	/* Setup default color bitmask */
+	for (i = 0; i < COLORING_MAX_NUM; i++)
+		set_bit(i, color_bitmask_default);
+
+	printk("Coloring information:\n");
+	printk("LLC way size: %uKiB\n", llc_way_size >> 10);
+	printk("Address color mask: 0x%lx\n", addr_col_mask);
+	printk("Max number of avail. colors: %ld\n", COLORING_MAX_NUM);
+	return 0;
+}
+
+int coloring_cell_init(struct cell *cell)
+{
+	const struct jailhouse_cache *cache;
+	int counter = 0;
+	int i;
+
+	memset(cell->arch.color_bitmask, 0,
+		sizeof(unsigned long) * COLOR_BITMASK_SIZE);
+
+	/* Root cell is currently not supported */
+	if (cell == &root_cell)
+		return 0;
+
+	for_each_cache_region(cache, cell->config, counter) {
+		if ((cache->start + cache->size) > COLORING_MAX_NUM ||
+			!cache->size) {
+			printk("Wrong color config. Max value is %ld\n",
+				COLORING_MAX_NUM);
+			return -ERANGE;
+		}
+
+		for (i = cache->start; i < (cache->start + cache->size); i++)
+			set_bit(i, cell->arch.color_bitmask);
+	}
+
+	/* If no coloring configuration is provided, use all colors available */
+	if (!counter)
+		memcpy(cell->arch.color_bitmask, color_bitmask_default,
+			sizeof(unsigned long) * COLOR_BITMASK_SIZE);
+
+	printk("Cell [%s] color config: 0x%lx%lx%lx%lx\n",
+		cell->config->name,
+		cell->arch.color_bitmask[3], cell->arch.color_bitmask[2],
+		cell->arch.color_bitmask[1], cell->arch.color_bitmask[0]);
+
+	return 0;
+}
+
+unsigned long next_colored(unsigned long phys, unsigned long *color_bitmask)
+{
+	unsigned int high_idx;
+	unsigned int phys_col_id;
+	unsigned long retval = phys;
+
+	if (!color_bitmask)
+		return phys;
+
+	high_idx = MSB_LONG_IDX(addr_col_mask);
+
+	phys_col_id = (phys & addr_col_mask) >> PAGE_SHIFT;
+	/**
+	 * Loop over all possible colors starting from `phys_col_id` and find
+	 * the next color id that belongs to `color_bitmask`.
+	 */
+	while (!test_bit(phys_col_id, color_bitmask)) {
+		/**
+		 * If we go out of bounds, restart from 0 and carry 1
+		 * outside addr_col_mask MSB.
+		 */
+		if (phys_col_id > msb_color_bitmask(color_bitmask)) {
+			phys_col_id = 0;
+			retval += 1UL << (high_idx + 1);
+		} else
+			phys_col_id++;
+	}
+
+	/* Reset old color configuration */
+	retval &= ~(addr_col_mask);
+	retval |= (phys_col_id << PAGE_SHIFT);
+
+	return retval;
+}
+
+unsigned long get_end_addr(unsigned long start, unsigned long size,
+	unsigned long *color_bitmask)
+{
+	unsigned color_num = 0;
+
+	/* Get number of colors from mask */
+	for (int i = 0; i < MAX_COLOR_SUPPORTED; i++)
+		if (test_bit(i, color_bitmask))
+			color_num++;
+
+	/* Check if start address is compliant to color selection */
+	start = next_colored(start, color_bitmask);
+
+	return start + PAGE_ALIGN((size*COLORING_MAX_NUM)/color_num);
+}
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-8-ms%40xt3.it.
