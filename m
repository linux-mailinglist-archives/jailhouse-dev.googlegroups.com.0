Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBFMK7P2AKGQE47QRKNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 152741B238D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:06 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id r17sf7262051wrg.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463445; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZnW2WRlifUedeVxz700DFsIY/HgRD99/kO34nX2B4wVHHb3icJ6DQtEz5/ROJb/r+e
         DX+6WNojPf11paChGcVtp70b7d5D5HbH0j23AfskBrVR5qZUunwgM41NIeVAYqC0OL6C
         Y4+L9c8+KvVAW/tjveYf8QBD64sAjalXCtyFBIqJ5wnObjeX8sCXLZOeDXAk4rZb72JD
         iJec5+N2xK7HD4ZpbtbL1FOWufpmEMTiTeG94FHBn85eEXRURf+yWroJpLA/ycDVuE1+
         17nLj3/mtlMi+MPAGSuWiFM2BGTe/3PyivFB3J1hVT8BPomcHlKa6wjzvI/QtVEvrTKK
         +bTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pLCvhchMZ6NaY+W6V97cYHD4zoTRbsh3ZQ5eYG46/yI=;
        b=FLV7en+1lCT7i+n7uBfar7rq3DbcWAgF+QZEgYzAJb9MJNzGDedMUu77ALVC5zyIuf
         muh5J71WS9fQk9orhfpL/qpa6IY0fqE9IHniigGcrAAzO5fqom3HVW4vsk0AYYDky8mj
         ghO0rWMjvOmziD1KfvH/o60VVMgNH9ix2MLvFF+svl6PI+AWPaEFLLhWLdPancNhD92i
         UBoroGBvap4Sr0hgfpmg3ugKQ2HDQP30J+lVhu5raekM7qw0iOeXk6jAHclD6XqbPXxE
         g2ujoMYr/EeTLJnubDmRvjF2uPX8SUo8drTIe5QwaD8T6KNTqVt/vJ4yjgvmfcrx2uIL
         lrvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=nTNWpVZX;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pLCvhchMZ6NaY+W6V97cYHD4zoTRbsh3ZQ5eYG46/yI=;
        b=D3zYri9JVaJhgkLo8/csPVD8oOKeIvJNlVgLB2mV/AInnIZAnAxzQxxrJumsFcJuDI
         fzaRCIT3pqv3H+DlFU/C0XO7phlT0kOxrNaxYL2BQizyW02ZCQ0EefbMraZgloFOB682
         OMW2fVeIGKbPRoRM9b/I1ZzXu3IVp+tYu5gesRbrM+ccVI8AHNtyagmw8xlW1pEAJ8/h
         TS5pl7bGK9NpB4kC4+KIR1jLm4u9hrVPaqQQoruOPbzbV+Xa5wjZmgMUBYQMT5JNpMLK
         0KzDrhs2BqT0VVKXPtwdqPGG6gbYQGdUlpal6sCWg6xpVi4bT7a7x+SNWvL8SUCtaBb4
         uCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pLCvhchMZ6NaY+W6V97cYHD4zoTRbsh3ZQ5eYG46/yI=;
        b=DthNzNJba64QU7Bes4dZ1jydJ9vvmmCTN6yQxEIw2YQQnNr7DEw2aYHXlRi3jgnpZt
         VoZVXp+3MTuvGrkvxaxUPRT5QyD1rW80qj0TGq1eaJT9sWlfVsSIDo4kHafu6orkSzvy
         YasjdxPiKFGo1DrevBQrYRzETE7WO5jnHUyaYXOIIhjYsjR2Sd6w7tZompuw2eIoR6Gq
         n/TTTlG7e/v5y2cvE5i50aVJXH4OES9mnvScu1lPXX7/dRz2Wb9K9m8v348FvvzVco3H
         GVDxGqPEUmFAzPNRQfvyj4g+ufsbG4rFyZyLX6TNAzWO9/JKnxDeb5sCvGZeMNNXdEno
         D1FA==
X-Gm-Message-State: AGi0PuYDk4DCW23xfuHmOHg6HDN90nfMihvgx8V1r1A9naTcxVvrDyz6
	pLWMAz4sSwxHWOe7VSaIIG4=
X-Google-Smtp-Source: APiQypJvsN/WrnOSRGoa3DvccxYu9TplzJbCzMzj8n/uyaFMmpDgeqqZ+cbQszeplYTu5lXvmD2Abg==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr25374635wrn.0.1587463445721;
        Tue, 21 Apr 2020 03:04:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7ec2:: with SMTP id z185ls4076459wmc.1.canary-gmail;
 Tue, 21 Apr 2020 03:04:05 -0700 (PDT)
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr4377210wmg.114.1587463445055;
        Tue, 21 Apr 2020 03:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463445; cv=none;
        d=google.com; s=arc-20160816;
        b=sLvTNg7Mc5Y9HbBV8A/auo4xuoJpi3ShEW8JoWYfC+jgwfA/YiQ3YxzYg0p7NKdBc0
         OZmOyjouL62c8oxyvTRlNTZRUIcws82ZfAi9ggIMUCW73dAD21x+lYH2+lvEf4YPtxWm
         2yOUeTc3iCtleODlwzHkl6HcABlGXGCScSOLxf4riVQlqXD1+rvLOO02EsOLG3zW4LjI
         DiVW4cMrhlCVB2vqDGwi9tInVGANxv1O1g33+nTS/TY7KrpmJBp9nY8Y7HXoz33kxOpI
         Z5CoS9CBV1mTkv5baiCt+29bYShfYscCUGQBiBZTauskpYQFDzGe/m8HKLtJI+wfmDH2
         9k4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vfljTh0aMbtGKC5v6RMp/y6kHYyRPygSBJubn+w7SSI=;
        b=J7SPw2a/VDcWK7XhwKwcv9HuPuJBSJ7Gr2hCXEqmoWFdL9KE1MBOzPkOQa2UHtKeNE
         LUe+ZhGPGrpY9m37VwlPn1UuY3/uaN2iVMQl78gCyOs9BKrLouN/dG/5jE6jVNqw1/S8
         w3KlpsE+nsYv5+IcpMVGDVQKMaqLx3qrFwN5q71tp8tW05ZpshRvEz8r6vKlfMIHcZfH
         teVMUiM2EbWEnoiEuK/NxXS++OinxYm2RIxpblw6pfc4HR/5d+9W+TJQQt21D+/ddcyP
         CLR6DazNkV0DSNaYs31XZNikwcLGgQrmWYEpvoDIrI3LUD4C9yc3CNzK9+tEvjsyM7so
         UCeA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=nTNWpVZX;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id s22si127830wme.0.2020.04.21.03.04.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl6-0005Br-5e; Tue, 21 Apr 2020 12:04:04 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>
Subject: [PATCH v2 5/9] hypervisor: introduce color_root_cell_management
Date: Tue, 21 Apr 2020 12:03:47 +0200
Message-Id: <20200421100351.292395-6-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=nTNWpVZX;       spf=pass
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

The usual life cycle of an inmate is divided in 4 phases: creation,
loading, starting and destruction. The most crucial phase for coloring
is the loading one because Jailhouse relies on Linux and its driver
module for loading binaries. In order to avoid exposing the coloring
logic outside the hypervisor, use a separate memory for loading binaries
to colored regions.
During creation and destruction phases there is no functional change:
the memory is mapped and unmapped using coloring functions as they
should since we are handling colored regions.
During loading phase a special colored mapping is created. The latter
has the same physical start and coloring logic as the cell's memory but
virtually starts at col_load_address.
This will expose a virtually contiguous memory region that will be used
by the driver to load binaries. During starting phase this special
memory is destroyed.

Add the missing CELL_CREATE state and introduce a management function
that handles the colored scenario for all the above phases.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
---
 hypervisor/control.c | 128 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 119 insertions(+), 9 deletions(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index b38ac2e9..af9dca73 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -19,12 +19,13 @@
 #include <jailhouse/string.h>
 #include <jailhouse/unit.h>
 #include <jailhouse/utils.h>
+#include <jailhouse/coloring.h>
 #include <asm/control.h>
 #include <asm/spinlock.h>
 
 enum msg_type {MSG_REQUEST, MSG_INFORMATION};
 enum failure_mode {ABORT_ON_ERROR, WARN_ON_ERROR};
-enum management_task {CELL_START, CELL_SET_LOADABLE, CELL_DESTROY};
+enum management_task {CELL_CREATE, CELL_START, CELL_SET_LOADABLE, CELL_DESTROY};
 
 /** System configuration as used while activating the hypervisor. */
 struct jailhouse_system *system_config;
@@ -318,6 +319,97 @@ static int unmap_from_root_cell(const struct jailhouse_memory *mem)
 	return arch_unmap_memory_region(&root_cell, &tmp);
 }
 
+#ifdef CONFIG_COLORING
+static bool color_mem_exceed_mem(const struct jailhouse_memory *col_mem,
+	const struct jailhouse_memory *mem, unsigned long *color_bitmask)
+{
+	unsigned long col_mem_phys_end = get_end_addr(col_mem->phys_start,
+		col_mem->size, color_bitmask);
+
+	return address_in_region(col_mem->phys_start, mem) &&
+		(col_mem_phys_end > (mem->phys_start + mem->size));
+}
+
+static int color_root_cell_management(const struct jailhouse_memory *mem,
+			      struct cell *cell, enum management_task op)
+{
+	struct jailhouse_memory mem_to_map;
+	const struct jailhouse_memory *rootm;
+	int err = 0;
+	int counter;
+
+	/** Check if memory exceeds the one available from the root cell */
+	if (op == CELL_CREATE || op == CELL_DESTROY) {
+		for_each_mem_region(rootm, root_cell.config, counter)
+			if (color_mem_exceed_mem(mem, rootm,
+				cell->arch.color_bitmask))
+				printk("WARNING: colored memory exceed root cell size\n");
+	}
+
+	/** Setup common parameter of the memory to map */
+	mem_to_map.phys_start = mem->phys_start;
+	mem_to_map.size = mem->size;
+	mem_to_map.flags = mem->flags;
+
+	/** Color configuration must be equal between cell and root cell */
+	memcpy(root_cell.arch.color_bitmask, cell->arch.color_bitmask,
+		sizeof(u64)*COLOR_BITMASK_SIZE);
+
+	/**
+	 * Colored memory region must be handled carefully when managing
+	 * root-cell memory regions w.r.t cell management operations:
+	 * - CELL_CREATE: the memory has to be unmapped from the root cell using
+	 * the coloring logic so only the correct memory is removed from it.
+	 * - CELL_SET_LOADABLE: in order to load binaries into the colored
+	 * region we do not remap to the root cell the same region but we create
+	 * a convenient memory space that virtually starts from col_load_address
+	 * The latter is mapped using the same coloring configuration and size
+	 * of the cell's one. This allows us to expose a virtually contiguous
+	 * memory to the root cell that can be used without implementing
+	 * coloring logic in the Linux driver.
+	 * - CELL_START: since the loading operation is performed on a specific
+	 * memory region, when the cell has to be started we have to
+	 * remove from the root cell only the mapping starting at
+	 * col_load_address.
+	 * - CELL_DESTROY: when the cell is destroyed we need to remap to the
+	 * root-cell the memory region using the same coloring configuration of
+	 * the cell.
+	 */
+	switch (op) {
+	case CELL_CREATE:
+		mem_to_map.virt_start = mem_to_map.phys_start;
+		err = arch_unmap_memory_region(&root_cell, &mem_to_map);
+		break;
+	case CELL_SET_LOADABLE:
+		mem_to_map.virt_start =
+			system_config->platform_info.col_load_address;
+		err = arch_map_memory_region(&root_cell, &mem_to_map);
+		break;
+	case CELL_START:
+		mem_to_map.virt_start =
+			system_config->platform_info.col_load_address;
+		mem_to_map.flags &= ~JAILHOUSE_MEM_COLORED;
+		err = arch_unmap_memory_region(&root_cell, &mem_to_map);
+		break;
+	case CELL_DESTROY:
+		mem_to_map.virt_start = mem_to_map.phys_start;
+		err = arch_map_memory_region(&root_cell, &mem_to_map);
+		break;
+	default:
+		err = -ENOMEM;
+		break;
+	}
+
+	return err;
+}
+#else
+static int color_root_cell_management(const struct jailhouse_memory *mem,
+		struct cell *cell, enum management_task op)
+{
+	panic_printk("Coloring is not enabled but colored memory used.\n");
+	return -ENOMEM;
+}
+#endif
 static int remap_to_root_cell(const struct jailhouse_memory *mem,
 			      enum failure_mode mode)
 {
@@ -388,8 +480,13 @@ static void cell_destroy_internal(struct cell *cell)
 			arch_unmap_memory_region(cell, mem);
 
 		if (!(mem->flags & (JAILHOUSE_MEM_COMM_REGION |
-				    JAILHOUSE_MEM_ROOTSHARED)))
-			remap_to_root_cell(mem, WARN_ON_ERROR);
+				    JAILHOUSE_MEM_ROOTSHARED))) {
+			if (mem->flags & JAILHOUSE_MEM_COLORED)
+				color_root_cell_management(mem, cell,
+					CELL_DESTROY);
+			else
+				remap_to_root_cell(mem, WARN_ON_ERROR);
+		}
 	}
 
 	for_each_unit_reverse(unit)
@@ -525,7 +622,11 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 		 */
 		if (!(mem->flags & (JAILHOUSE_MEM_COMM_REGION |
 				    JAILHOUSE_MEM_ROOTSHARED))) {
-			err = unmap_from_root_cell(mem);
+			if (mem->flags & JAILHOUSE_MEM_COLORED)
+				err = color_root_cell_management(mem, cell,
+					CELL_CREATE);
+			else
+				err = unmap_from_root_cell(mem);
 			if (err)
 				goto err_destroy_cell;
 		}
@@ -632,7 +733,11 @@ static int cell_start(struct per_cpu *cpu_data, unsigned long id)
 		/* unmap all loadable memory regions from the root cell */
 		for_each_mem_region(mem, cell->config, n)
 			if (mem->flags & JAILHOUSE_MEM_LOADABLE) {
-				err = unmap_from_root_cell(mem);
+				if (mem->flags & JAILHOUSE_MEM_COLORED)
+					err = color_root_cell_management(mem,
+						cell, CELL_START);
+				else
+					err = unmap_from_root_cell(mem);
 				if (err)
 					goto out_resume;
 			}
@@ -708,12 +813,17 @@ static int cell_set_loadable(struct per_cpu *cpu_data, unsigned long id)
 	pci_cell_reset(cell);
 
 	/* map all loadable memory regions into the root cell */
-	for_each_mem_region(mem, cell->config, n)
+	for_each_mem_region(mem, cell->config, n) {
 		if (mem->flags & JAILHOUSE_MEM_LOADABLE) {
-			err = remap_to_root_cell(mem, ABORT_ON_ERROR);
-			if (err)
-				goto out_resume;
+			if (mem->flags & JAILHOUSE_MEM_COLORED)
+				err = color_root_cell_management(mem, cell,
+					CELL_SET_LOADABLE);
+			else
+				err = remap_to_root_cell(mem, ABORT_ON_ERROR);
 		}
+		if (err)
+			goto out_resume;
+	}
 
 	config_commit(NULL);
 
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-6-ms%40xt3.it.
