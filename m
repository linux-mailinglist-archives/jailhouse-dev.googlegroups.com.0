Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBEUK7P2AKGQERICO6FI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB61B2389
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:02 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id q5sf1238501wmc.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463442; cv=pass;
        d=google.com; s=arc-20160816;
        b=GxMS7o3fOXwOg0e9I21MJnfDIhchMYWLDasOX5oUFiSjOEgYbrSJQsp5oNbG8LX4HJ
         WX/eVL70893XypPFPw7tTgdyziiuGVWcc7RZcYYIjP8BUK5Ir/ogOcdcgS28oaVzl2sC
         8h21Xki/05QG1qU9G9whgh80NLhFz8eKTMDjNiiY9q85Wcw49TawFxgz5vD1wwUhWvB6
         iCe7QGSVZgRiYdruRJ2uRX7Brkxot/ny1IOzfZKYRaeA/KHMaJbumzRsbj635f+aBOTo
         uVxscp3Ftx8UCw3RTOdo2wh8EP0igCIvk7zwBJ0HxdW+A8iX93ZLu/8KRTCvsx4EaeKV
         XTQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ynfPxY+Q4YwlBnWFHXxss3prf5nz2cVcnjXqHGZFvEo=;
        b=VF4oBYqtId1GegFgkM82jpVKvBMtencHOMZFn/ZPkJXhnr3gXnp1CpBTUCc0AeErIF
         SXRolcB85banXKPeJ3Q4CAbSbOkpo16GZWFUMxWJqJch7ieczoUVaq7bPjx/GTvP1Z42
         CAngiwpLsRuCy1bfb8x9B26IN0fsb4vLaW7UDuStOidd6GoO/jWgkI+s1IJFelDyHKJY
         04cfTAbzJnYwbPtq9EuZ1qO3T3XeQkpHbPCIiZosMCMcb6vnftQQvWXkvdAaFAPo9Iqq
         ntRr3d2BrAK2UJUuQ8oXnlUtOcEw9dStEhu8oH6BpKVefUSbTpDyXAyPUebmZoXG78kH
         Zx6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=Xb37Asa3;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ynfPxY+Q4YwlBnWFHXxss3prf5nz2cVcnjXqHGZFvEo=;
        b=f8y6XnSBvvUmH2tSrabNrnI5hZ0CMryAUdu8U7dWE6L7MtFd8uOFhCkeJBjjKTPFIR
         5+Yz2r8YMAeeBjsRhIKjtbXnNMfeXwn1YqVn6NeuGjyPK8z3ZI7ABD3faGQ2DMrGppJY
         2sw4KGXB0mmdvoRrjtk/Pt0Rh7J61KeGraCrhEoNYEjvBhva5W5OS+luTq5M0DjRvOxC
         Hf9xLycMJY6QEYqyZDKtYeFmhRB+QY8oo76Gx2i8a7mjqVY6IpGaEv+H2ffU4YsimYZy
         rSf3LQA0UikO+gZgd8cYoL7PrCUpBCrgBKdZh0lFUnZFuCRkC5goTI2eVmq16fy8Xzdm
         u5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ynfPxY+Q4YwlBnWFHXxss3prf5nz2cVcnjXqHGZFvEo=;
        b=WpS7LT478rnA3hIUxTOYL4h2wZjWmW7Fq+JALuICfqYiGVMplrA0jSp0+2mnW9zR9m
         qNuD4vRIeZ3LcUJJIz3+DdwE2QlgqELKcNnVMEgBB2c5gzMgLFmy9pqaUF9xWf9GuPHk
         av+fbPS8f2D16IklrvA9mbiExFC1OuBr/BVYJpgslmDMz/YthIsJ9QKlVmKYjwM+TpYW
         tj2GsKYmnHZBm/9oHWCytz7PViQ6mZSb02t6qw+v5z49Bbntetweg31osxsUy7HHHx0K
         8DMjS8NvV1hjShDV3TmmQktD75hnzI3zo3ssFLw9c12hMK+u/m3xtyZcyUZlPzgMLEGy
         8evw==
X-Gm-Message-State: AGi0PubusboC3GC5Dc9vuwRfDiMcBrL4pp33E2E3mxLzE/Vq8jbg/tra
	U7V9rKj0bame4v68WvUUf2k=
X-Google-Smtp-Source: APiQypI78TfGT9Z+opBaUEY975keKhNKiozAaq5ByqWy21J8DAv7z7FHwpErF3S11nKHhqb8uqZBkA==
X-Received: by 2002:a1c:c2d4:: with SMTP id s203mr4415336wmf.128.1587463442412;
        Tue, 21 Apr 2020 03:04:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1f0e:: with SMTP id f14ls4192551wmf.0.gmail; Tue, 21 Apr
 2020 03:04:01 -0700 (PDT)
X-Received: by 2002:a7b:c147:: with SMTP id z7mr4408175wmi.52.1587463441631;
        Tue, 21 Apr 2020 03:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463441; cv=none;
        d=google.com; s=arc-20160816;
        b=TAAXR5KzS2feo7kSYdQbmcCYnD8Az+IPp+s1QvCLKkIrfboNdXKWk4pmhp/EmPqf7F
         VQ0lyIaY7LfJ06BLCZyygLdCUftwqhw7UbKKwIGdLibGkcfto07DOrj4pTJLjq4dTl4m
         wG6bl3Qv2AkIGNEvV1APJJveBYebyxEA5YJIVGkuCNCH0999ZHFZJLLEibDJfUtoZEqt
         L65/4kEqzOj82WkH/kRr7ZdX5fRY4k8U+GgIMKRt6PEO7dnL8kFln9KN7dDyQgrRQ5co
         Ibaw9Gj/MrD03ZFguJXqMhE6f5SbKGXDePFkyt7o+mqT3eVq7w1AZBjQN97/s2Br4FwA
         Uhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FUoJaNTCKB+YFOWygeq57Z2d/LXZ2PZWtvMgS0tb3tM=;
        b=xDb8DnV0MU1DZH/XqhFsEbas2cHhtG0Tid/4a6lt6ajRgmWeOGcwbU5RmUInz4/17e
         Gjrr2Xcx9vpOxICl9Bvb2F9i39LYrZ8IdEZ4r76z1HffKBqUKkI3QFpzEjhE2pi8NFHc
         O6yTdeb7KkBk3jrEml4suvfRqWgr1XEPpv702KI3aZOxevg9DjB0Youi0rZLx0DddoqN
         1FiQgGINoTn1IM0YjGt6rLTHAxmHkyFy9gWgqSovrfOWATuIuD8MRqsmb08C1qrpP3q/
         NHpBGRcccuHIN6t+q+fepuMtbIkYWvdA1n7fqgYGOjwRut8szfgezeuyVCT4DokJNQgw
         UXRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=Xb37Asa3;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id f129si103350wmf.2.2020.04.21.03.04.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl2-0005BB-Hx; Tue, 21 Apr 2020 12:04:00 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>
Subject: [PATCH v2 1/9] hypervisor: introduce a common cache coloring interface
Date: Tue, 21 Apr 2020 12:03:43 +0200
Message-Id: <20200421100351.292395-2-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=Xb37Asa3;       spf=pass
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

Add fundamental primitives to implement support for cache coloring.
The latter is performed by exploiting the mapping of memories flagged as
JAILHOUSE_MEM_COLORED and defined in the inmates' configurations (no
root-cell or hypervisor itself supported yet).
The interface defines the basic functions that have to be implemented in
order to support coloring for a specific architecture.

Define three main functions:
- coloring_paging_init: calculate which bit range in the address is useful
  for cache coloring, assuming it limited by the page size and the LLC
  way size as happens on arm;
- next_colored: calculate the next physical page address that conforms
  to a given colors selection and to the bits calculated in the previous
  function;
- coloring_cell_init: initialize cell colors assignement depending on its
  configuration;

LLC way size is required for coloring to work and it can be explicitly
defined in the root cell configuration. Add a helper function that
probes the way size from hardware if the llc_way_size is not set in the
root cell configuration.

Finally, define a function used to calculate the physical end address of
a given memory that is flagged as colored.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
---
 hypervisor/include/jailhouse/coloring.h | 96 +++++++++++++++++++++++++
 include/jailhouse/cell-config.h         |  8 +++
 2 files changed, 104 insertions(+)
 create mode 100644 hypervisor/include/jailhouse/coloring.h

diff --git a/hypervisor/include/jailhouse/coloring.h b/hypervisor/include/jailhouse/coloring.h
new file mode 100644
index 00000000..9dfe516c
--- /dev/null
+++ b/hypervisor/include/jailhouse/coloring.h
@@ -0,0 +1,96 @@
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
+#ifndef _JAILHOUSE_COLORING_H
+#define _JAILHOUSE_COLORING_H
+
+#include <jailhouse/cell.h>
+
+#ifdef CONFIG_COLORING
+/**
+ * Get the way size of last level cache
+ */
+unsigned long get_llc_way_size(void);
+
+/**
+ * Init cache coloring on the platform
+ *
+ * @param llc_way_size	Last level cache way size in bytes
+ *
+ * @return 0 on success, negative error code otherwise.
+ */
+int coloring_paging_init(unsigned int llc_way_size);
+
+/**
+ * Init cache coloring data for the cell
+ *
+ * @param cell		Cell for which the initialization shall be done.
+ *
+ * @return 0 on success, negative error code otherwise.
+ */
+int coloring_cell_init(struct cell *cell);
+
+/**
+ * Return physical page address that conforms to the colors selection
+ * given in color_bitmask
+ *
+ * @param phys		Physical address start
+ * @param color_bitmask	Mask asserting the color indices to be used
+ *
+ * @return The lowest physical page address being greater or equal than
+ * @param phys and belonging to @param color_bitmask
+ */
+unsigned long next_colored(unsigned long phys, unsigned long *color_bitmask);
+
+/**
+ * Return the end address based on color selection
+ *
+ * @param start		Address physical start
+ * @param size		Size in bytes
+ * @param color_bitmask	Mask asserting the color indices to be used
+ *
+ * @return The address after @param size memory space starting at @param start
+ * using coloring selection in @param color_bitmask.
+ */
+unsigned long get_end_addr(unsigned long start, unsigned long size,
+	unsigned long *color_bitmask);
+#else
+static inline unsigned long get_llc_way_size(void)
+{
+	return 0;
+}
+
+static inline int coloring_paging_init(unsigned int llc_way_size)
+{
+	return 0;
+}
+
+static inline int coloring_cell_init(struct cell *cell)
+{
+	return 0;
+}
+
+static inline unsigned long
+next_colored(unsigned long phys, unsigned long *color_bitmask)
+{
+	return phys;
+}
+
+static inline unsigned long
+get_end_addr(unsigned long start, unsigned long size,
+	unsigned long *color_bitmask)
+{
+	return (start + size);
+}
+#endif /* !CONFIG_COLORING */
+
+#endif /* !_JAILHOUSE_COLORING_H */
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 30ec5d06..8985f8a3 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -114,6 +114,7 @@ struct jailhouse_cell_desc {
 #define JAILHOUSE_MEM_LOADABLE		0x0040
 #define JAILHOUSE_MEM_ROOTSHARED	0x0080
 #define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
+#define JAILHOUSE_MEM_COLORED		0x0200
 #define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
 #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
 #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
@@ -306,6 +307,13 @@ struct jailhouse_system {
 		__u8 pci_mmconfig_end_bus;
 		__u8 pci_is_virtual;
 		__u16 pci_domain;
+		/**
+		 * Size (B) of each way of the last-level cache where coloring
+		 * takes place.
+		 * Must be set if get_llc_way_size() fails or does not support
+		 * the platform in use.
+		 */
+		__u64 llc_way_size;
 		union {
 			struct {
 				__u16 pm_timer_address;
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-2-ms%40xt3.it.
