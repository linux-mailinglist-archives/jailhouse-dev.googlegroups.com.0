Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBFEK7P2AKGQECT4JS6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC41B238C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:05 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id e2sf1973596ljp.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463445; cv=pass;
        d=google.com; s=arc-20160816;
        b=v7j3cd5o6iKRDo4nHUnMzopKstvZ820oOt6CjbAbxCrE6zCPgpqFnJdIzhySmsW/m/
         4/wnt7yPbMKpSOJK/EdYo/QBiRtwSDye2K4Gk/WZVuzgXXmw+qnFX/35FNQxQgl4+a7v
         WORIaQVm8nluqImvkSbT4TTQTTTdfW8yWy2qfWE/eWNcguep+oGIUEqWslPiO/Xb2FAV
         EoKuX/9XOpXwDDFERLoaPNhWzTfKaiTo0tmJDri+Dkfng1QfD8fzEo7DEEi54x2kV+Si
         pMYu0Ql56GuS03GoZ0WvZXnV2Vs1LxNqcWiTr4r0OniGiC3Oe3zRWDJEvVf1sqYUE0b8
         I2aA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cNTQN8+qX5xRzUf9sUQKHJ/zvDWV+Y/wVMiURomfFpE=;
        b=G6SM90rjmsi8I0ngf/Vy3rWHqDSZwpmFIuANWNgZivN0aV8ZYq+PIHb4g69/JzRilh
         reFVB9EAT0+Ri2uqyO9Q5Jz1kLiWVoIKIv3kCL62kmnTgUVztA2duEGbkVkSksge8/nP
         56YOksiNkWpJk0ttLDFdWe4SwPDAGWeRM6IR7iheef/LpGsH9uyip1aws3YUZPmBxJVJ
         4UpEWuUrZnKa0WRBVEq+bjDjhpI569TZVcIVXdPWJoErJcvezirvqtGMI6tk/lyAvNKR
         +UqpmwuX9o/hiR9Cq76jXxf7h79laKkhhCuORRzxAB54AVyLfo2MEUmgOXntcl/kxL7t
         Lcqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=PuO9DCdu;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cNTQN8+qX5xRzUf9sUQKHJ/zvDWV+Y/wVMiURomfFpE=;
        b=GVgYf0fo7ulXmhTtoe53/2bVuQfFqecoFNEwBHsHS7o1i+YcTZ2kOFmdu7N+HAYpor
         5Bvf2TEE1WrLjAkpshkgTRvk7/OToFYWQsVVc035UoUN/qkHKXYXgZxKHUVaGOi341zT
         fCskdRfRYu/dpgzVXvnd/KY0+WKMsvEN4xuaFqGdhKqwqxsHi4JYjYu3lkhDsSfmb6AY
         2bPK8HdRtc+1qLSLm3sEqhCVvHGKcyU7onWa4XHcsIdqPQQVoC2XqpZNkxF11W/oUCTB
         zLyy52nHMelVrTelEQbEn+fbpWuxCqtfwip2cZA8H70+htsxtRfuC74av208oQLpkhXc
         DRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cNTQN8+qX5xRzUf9sUQKHJ/zvDWV+Y/wVMiURomfFpE=;
        b=ER1xIerdSzE2QpC10ry6ReSsVwQUlv24t2L+89cuvwZFYgLUKm2L/v8ppt6PVLy2w3
         1tl/ItCjt1MuiHqex9IQ/gL1lfbhcl1L3zO2/Lone4/vCkXr2D8OXjV3ERao6dPDHiND
         T1rBjXzQie/rYJzwovOK69k/Y7hiyQhyciqwmAwsLr1nBVsAUCWU/d2jYHR/Nckf1+Ug
         lgFlpOmnOoXQNu534XD4l1s8k4yuYeqQbCooG4iCfnPvETwppgdSq9YllWe88RcihLaK
         Y2h1/ze/2tHL3UY+oecVnxJkicTndMvVNLWIxlfXu/9jcyLuww+8gtJ02vJ5gw7WUEz9
         PDSw==
X-Gm-Message-State: AGi0Puaw0BZ5CWXgpTXs/JuGFO4YCU8H6vZ28zhU69H7cWX7FkkjpADD
	F+vaRvaiJytb0lYUQ3tk0lA=
X-Google-Smtp-Source: APiQypK/HA+ZkuxOBH4TNAanzJCdwKDxxciXAQeZg2RALyZp6c2f5/jwAbdthKr5WV669NGt59Nozw==
X-Received: by 2002:a05:6512:318a:: with SMTP id i10mr13399017lfe.96.1587463445196;
        Tue, 21 Apr 2020 03:04:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9ad6:: with SMTP id p22ls2747093ljj.9.gmail; Tue, 21 Apr
 2020 03:04:04 -0700 (PDT)
X-Received: by 2002:a2e:91cc:: with SMTP id u12mr13548053ljg.244.1587463444420;
        Tue, 21 Apr 2020 03:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463444; cv=none;
        d=google.com; s=arc-20160816;
        b=R+rd2eEcl1Ph8ViDfRuqRRahx9gBlUDF6weIc9xOwfTr23x0zWEVQ01Kw5NhPxr6EK
         TWMTs6jjNDRPy6R3T8RCA9dckKq0LcMc5RB4bFYfIkcFhHvTG5JevW9qjLHkyA5Lo8jg
         Yshj4eMYybfPW8Sx35UsZl9ncx87C3Kiy6gtckOz5/wxHA9Lam5GSaNsdk3eltcv9y4a
         5W2QxVYT2xn3dS1MMFD5H29Y4Mnt3k1MX+OWXJQ8W/LkyLKuvfUY3d1ma8SZywMoySsZ
         mMZ5XWCirSRZkM4YJHsnPubfI1ADRbaI74/PvjkLTBAwFWicaa7gDv9h5lRNr0Obsubz
         n3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HRJM2g/Ju9lEEUQJ69ljxOFTRBhFgmF1cNZSLOHqS+U=;
        b=fWpLmuuMBh1+mZBHM0TqVurK1j4xDs2VfNIt8JQ9nht5/H+Q6Snc/KB1oIXwTsRDSf
         k8s/lTwl+bYLkotU1gCVeaAwQK9goIazeDd1RHvHZ4hrLIBEKWOhF6AFSXXyIYlv1/DN
         dnHOc+73MbVChl+8xQLNwfDa2a3BcKLjWUkYTctBN69kWjag5tx8aeLBGazsvEnQuymp
         LHLgznkYa2lcMJJpF3KbG9Ne1SoBupuR16HxwMGVdqJKEgOci6VjDvWbEL26ncdvuAUa
         lEruBt4lmbhS4GRGr6yXhiT8sJVsBwNnZjp6q7dKt/kMvWGb0i6oA4kbcFmZpcwbbi/x
         gpvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=PuO9DCdu;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id a12si88419ljm.2.2020.04.21.03.04.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl5-0005Bj-A8; Tue, 21 Apr 2020 12:04:03 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>
Subject: [PATCH v2 4/9] hypervisor, arm-common: add initial support for cache coloring
Date: Tue, 21 Apr 2020 12:03:46 +0200
Message-Id: <20200421100351.292395-5-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=PuO9DCdu;       spf=pass
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

Use a bitmask array with fixed size for the cell's color assignment.
The largest amount of shared last-level segment cache equipping an Arm v8
cluster for the embedded segment (i.e. Cortex A5?, A7?), which contains
up to 8 cores, is 8 MiB with 16-ways associativity.
Now, assuming the coloring algorithm to be the same as we support, i.e.
smallest granularity with 4 KiB pages, we compute that up to 128 colors
available.
For this reason set the amount of colors supported to 128.

Colored regions defined by the flag JAILHOUSE_MEM_COLORED are mapped
using the "colored" version of paging_create when needed.
The colored version of paging_destroy is used only when unmapping from
the root cell since we are assuming a 1:1 mapping for it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
---
 hypervisor/arch/arm-common/include/asm/cell.h |  4 ++
 .../arch/arm-common/include/asm/coloring.h    | 22 +++++++
 hypervisor/arch/arm-common/mmu_cell.c         | 62 ++++++++++++++++---
 3 files changed, 79 insertions(+), 9 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/coloring.h

diff --git a/hypervisor/arch/arm-common/include/asm/cell.h b/hypervisor/arch/arm-common/include/asm/cell.h
index 9c6e8c6f..c5159b46 100644
--- a/hypervisor/arch/arm-common/include/asm/cell.h
+++ b/hypervisor/arch/arm-common/include/asm/cell.h
@@ -14,6 +14,7 @@
 #define _JAILHOUSE_ASM_CELL_H
 
 #include <jailhouse/paging.h>
+#include <asm/coloring.h>
 
 struct pvu_tlb_entry;
 
@@ -26,6 +27,9 @@ struct arch_cell {
 		u8 ent_count;
 		struct pvu_tlb_entry *entries;
 	} iommu_pvu; /**< ARM PVU specific fields. */
+
+	/** Color configuration as a bitmask */
+	unsigned long color_bitmask[COLOR_BITMASK_SIZE];
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/arm-common/include/asm/coloring.h b/hypervisor/arch/arm-common/include/asm/coloring.h
new file mode 100644
index 00000000..9404948f
--- /dev/null
+++ b/hypervisor/arch/arm-common/include/asm/coloring.h
@@ -0,0 +1,22 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Universita'  di Modena e Reggio Emilia, 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Marco Solieri <ms@xt3.it>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_ASM_COLORING_H
+#define _JAILHOUSE_ASM_COLORING_H
+
+#define COLOR_BITMASK_SIZE 4
+
+/* Max. number of colors supported */
+#define MAX_COLOR_SUPPORTED     128
+
+#endif /* !_JAILHOUSE_ASM_COLORING_H */
diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index db618960..912d9399 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -13,6 +13,7 @@
 #include <jailhouse/control.h>
 #include <jailhouse/paging.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/coloring.h>
 #include <asm/sysregs.h>
 #include <asm/control.h>
 #include <asm/iommu.h>
@@ -46,8 +47,29 @@ int arch_map_memory_region(struct cell *cell,
 	if (err)
 		return err;
 
-	err = paging_create(&cell->arch.mm, phys_start, mem->size,
-			    mem->virt_start, access_flags, paging_flags);
+	if (mem->flags & JAILHOUSE_MEM_COLORED)
+		/**
+		 * Identity mapping is necessary only when remapping to the root
+		 * cell during destroy phase. To check if we are in the destroy
+		 * phase the control is made on the memory virtual start and
+		 * col_load_address. We cannot have a scenario where these
+		 * addresses are equal because:
+		 * 1) virt_start == phys_start.
+		 * 2) we assume that col_load_address is configured so that it
+		 * does not interfere with memory layout.
+		 * 3) if col_load_address is equal to phys_start there is a
+		 * wrong root-cell configuration.
+		 * It means that in the previous wrong scenario col_load_address
+		 * overlaps some root-cell memory space.
+		 */
+		err = paging_create_colored(&cell->arch.mm, phys_start,
+			mem->size, mem->virt_start, access_flags, paging_flags,
+			cell->arch.color_bitmask, (cell == &root_cell) &&
+			(mem->virt_start !=
+				system_config->platform_info.col_load_address));
+	else
+		err = paging_create(&cell->arch.mm, phys_start, mem->size,
+			mem->virt_start, access_flags, paging_flags);
 	if (err)
 		iommu_unmap_memory_region(cell, mem);
 
@@ -63,8 +85,19 @@ int arch_unmap_memory_region(struct cell *cell,
 	if (err)
 		return err;
 
-	return paging_destroy(&cell->arch.mm, mem->virt_start, mem->size,
-			      PAGING_COHERENT);
+	/*
+	 * Do not be confused -- since paging_destroy* acts on virtual
+	 * addresses, paging_destroy can be physically colored, too.
+	 * We need to destroy the mapping using coloring only when unmapping
+	 * from the root cell during cell_create so that the correct regions are
+	 * removed and then used from the cells.
+	 */
+	if (mem->flags & JAILHOUSE_MEM_COLORED && (cell == &root_cell))
+		return paging_destroy_colored(&cell->arch.mm, mem->virt_start,
+			mem->size, PAGING_COHERENT, cell->arch.color_bitmask);
+	else
+		return paging_destroy(&cell->arch.mm, mem->virt_start,
+			mem->size, PAGING_COHERENT);
 }
 
 unsigned long arch_paging_gphys2phys(unsigned long gphys, unsigned long flags)
@@ -91,10 +124,20 @@ void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush)
 				   NUM_TEMPORARY_PAGES * PAGE_SIZE);
 
 			/* cannot fail, mapping area is preallocated */
-			paging_create(&this_cpu_data()->pg_structs, region_addr,
-				      size, TEMPORARY_MAPPING_BASE,
-				      PAGE_DEFAULT_FLAGS,
-				      PAGING_NON_COHERENT | PAGING_NO_HUGE);
+			if (mem->flags & JAILHOUSE_MEM_COLORED)
+				paging_create_colored(
+					&this_cpu_data()->pg_structs,
+					region_addr, size,
+					TEMPORARY_MAPPING_BASE,
+					PAGE_DEFAULT_FLAGS,
+					PAGING_NON_COHERENT | PAGING_NO_HUGE,
+					cell->arch.color_bitmask, false);
+			else
+				paging_create(&this_cpu_data()->pg_structs,
+					region_addr,
+					size, TEMPORARY_MAPPING_BASE,
+					PAGE_DEFAULT_FLAGS,
+					PAGING_NON_COHERENT | PAGING_NO_HUGE);
 
 			arm_dcaches_flush((void *)TEMPORARY_MAPPING_BASE, size,
 					  flush);
@@ -120,7 +163,8 @@ int arm_paging_cell_init(struct cell *cell)
 	if (!cell->arch.mm.root_table)
 		return -ENOMEM;
 
-	return 0;
+	/* Init coloring configuration of the cell */
+	return coloring_cell_init(cell);
 }
 
 void arm_paging_cell_destroy(struct cell *cell)
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-5-ms%40xt3.it.
