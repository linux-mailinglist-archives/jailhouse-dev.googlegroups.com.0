Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBTEH4XYQKGQEXI6F6BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x137.google.com (mail-il1-x137.google.com [IPv6:2607:f8b0:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D51518A1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 11:13:33 +0100 (CET)
Received: by mail-il1-x137.google.com with SMTP id x69sf14487487ill.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 02:13:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580811212; cv=pass;
        d=google.com; s=arc-20160816;
        b=QZoR3ZO6wS4BpnYgY4IZshAeMFbACJxgoKVKojnYMOfpUbEZeB8mpF3MTHmVmpKnxW
         BTWSGc5M72DysQdYfle4FXwWVkY8L1pCkg4MpTIAFSFcBpQ6eWsay0YxUuUj59TCpDw7
         pDKThoi32z1zW2t3cOL1mjzRqweazWvaYjh7EijtyaF1mTmMV/sTIw91GudGGX3mbsN4
         X4Ax9tsXLrM1w1cU3nRFqSzaADsz7IhwjwJt477nAG5baFNu3aThzd6Phu1rffAiyrLj
         JhQ1gW8s/W/B4ge9UbYl1BCUDbzHEWJUKCUTUvX4n2+hzeyt4Joy4kvWTYeV/2u2PFHk
         syBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=09qa+cKNv5y8epcJ3qVpsgnpo1i5sfaLxRiU3aMez3s=;
        b=UbIUVTfNUzDMHssA1mKAJl8jx31voqnJ0dcsmtc7vcp0/gX+X7pEzbj2qWL9Opcjlu
         ojF9J+JvE525Hf44AOmUblTFZt64ugZAChdm3rw5hWE0w3Np8gIgpwFVFeM0IIYvKM4O
         kKmagf6S6PoVj2spQnLVJ1Pl4skQYULhenimYxRd4p/gYpTR7fR2AAF+FwGsrmKnqbpK
         /wQ8Obtp4hcBsuQlbW1SUfocmRvsmOaA4qNeb5P4IwB/Bnq1+fu9MUpXws2EEuORxH7w
         hO5m/NPor9YFXiHx5ad4gXWXL27ywRkXYWVYlFtR0K8gq+9thN/jbR/p7rU9SDpImAXF
         povw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AUe0igL+;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::641 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=09qa+cKNv5y8epcJ3qVpsgnpo1i5sfaLxRiU3aMez3s=;
        b=SZ21sw9EH1Xy1GSnoJHKrW3j96G4+lvfGAKVoCRsSfNiYN5YnERgVvZiEoAls6xtig
         fRU8EXRtL50CY+uo8CrTH6W8KOATbW03eF6dv5YZ3o9X69CA4+Cv2/u6GkzLCR9Cqgvx
         XUpGJiyCnXPntbsOYqpPHnH40lCPdCGOTUMlyqbFo7q8hkMS2Uf2XuIHumxMxyPhzDiP
         SX1UTQHkWB9ejummGD7S+00YchIaFai5fAKzeqTKAv2P+ZRWr1sq08exkcCLBLxK/FGy
         7gbVbhqm8ovkbq7egH4F6EHcmoUs8cKYNQp034QVyQeQJFtfaBP3OOZKPz03K1FmSNke
         5LCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=09qa+cKNv5y8epcJ3qVpsgnpo1i5sfaLxRiU3aMez3s=;
        b=KjFDHwNclGBAVMZa6KXp/LjL7H5COQTTPZ1HCM7Nsb40KhueamYg9yb5cvcYyrRCmq
         F7oQfdmajSEvzFZv6btUT39NCSEpth9dNzR0FXJDqpkle4DuBc9C+xFkSuHQY8Ld/Mrd
         s2L82sudgsRlAxuuhd2bBysyx9dZpOZy4DDV1ndCW4xjeWDK5sIy7JaACYNNaWHSonLn
         J3HC+NpP3qv9Ce/O3TVsfsHR3URsbNziRMNbA3TO1VVOL/aKbLJTSc8xeoD9gQ5kTgMd
         3I56IyX1YGVXbzfihOKrcPqhuH9Y1yeA0d1qJyoQttiuyRNWIGrZqsuWpFpL2ZOY2k+k
         Q03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=09qa+cKNv5y8epcJ3qVpsgnpo1i5sfaLxRiU3aMez3s=;
        b=nj0vRYw1fX1YKqKTSJl9+r2uWITVRLE6uBjsBwtDpAU0PTFtn1CAOrHvYGNBCJlXry
         5uG7JtJmKVlrQKpinUr92j+yYoyuMYq/SdHGvOaYw5uct0sZrvqRR7Tz3SZFffhX/cCY
         m/afTfPC36rLr4VUi39MbSQ4PLxHCN2vH/5tyoNra/VPI3SiAF51oRvkRPhMY5bdOWdL
         R2z7W+rl+WBI0EK+fnmjUMNQOxT2qai9Xi2AJSVoDQODhCGViaJN8E8e5Y7W1VIcvly/
         L6tncex4chNA12dXcL1dNSwXEN4Dsyrw7BkMTGZEBkyfCyjHrueyoQOVhfJqlRq9tC5v
         wAFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXnJ0oSAFCvCCsA2QHnWcogQZ0WWY7IaRXlSCxUEOXwamqaS+yI
	N7I4KLVnmzkSyJEYa8eq/qo=
X-Google-Smtp-Source: APXvYqzr31ezlEYqLS0GBm1XoZpz/MC5P6BpeIPv4HX0n+68x/ptrvH7FU5roKAz5hIHNk+QHe4+9w==
X-Received: by 2002:a6b:6e18:: with SMTP id d24mr23501223ioh.301.1580811212329;
        Tue, 04 Feb 2020 02:13:32 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:7802:: with SMTP id p2ls257442jac.11.gmail; Tue, 04 Feb
 2020 02:13:31 -0800 (PST)
X-Received: by 2002:a02:cd3b:: with SMTP id h27mr23499884jaq.18.1580811211732;
        Tue, 04 Feb 2020 02:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580811211; cv=none;
        d=google.com; s=arc-20160816;
        b=weEnoNKWwLQuopVQWS7Wuzzcicn6zJOphm60zqrLAcHXzUOrSNnDeIsWYEEqzh9v1X
         76ntb679QjYvesNWRdcqL4dQp7IHEkAYGkWnpu7euIoewO7P1ajyIwc4es15tweRn02z
         7WiZqaMmkKmwy+9cIOEoEdz7dAQriarS3SBUZ3oeqK2AoCVqbibJG8PwvbXI9naQTdMa
         JuL93Z2ZQI5YRwBCGjKkkkmMPnduwvYdi5zba+HFDRE+Kt8PiIvHC23hEJ8BOfqKPulX
         rb8AXyT2JF/9xdnZ8Vy9Qr3FYzdTiFGp0uGUDiTrPegK0bu8tQgyymED5av7trikShEZ
         lMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=UMaAoIg5D3je++Ra+ucmqSs5UD5Rrq+wIpJaVkpQkTw=;
        b=lOFlb1pEGWTMkAg4WKLEAZiN6A1vMQ12kOnmjf2qJc5rMPorSA0i6KjJ+MCvbgcfZB
         moB/xLGv8ia6yS0e9+k6O+QR1WAONCtXO1NLKTM0HhuWUpSAxn6RmTe505o3W1gHcvEC
         AHfo+y230ys2DdY/ew8mc91F9bEuvXOxhRRQS2QqIjdl3CaL5DlOFEyDUBuzHmhxYIr0
         nhPlqQNbJFzMfUkbeJ+QpaWu1zV0SZDitk3mhPNUBrEOYquO0gikrah5UYDHNHxpx3q+
         F92ySsH3xeOoRJEvE1HvTMQ6CK5Sd9cxXWpt+JHE2UjwZPYdez2/ERjkL7S2h+xEB4D1
         tXnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AUe0igL+;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::641 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com. [2607:f8b0:4864:20::641])
        by gmr-mx.google.com with ESMTPS id z7si1129281ilz.1.2020.02.04.02.13.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 02:13:31 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::641 as permitted sender) client-ip=2607:f8b0:4864:20::641;
Received: by mail-pl1-x641.google.com with SMTP id a6so7086996plm.3
        for <jailhouse-dev@googlegroups.com>; Tue, 04 Feb 2020 02:13:31 -0800 (PST)
X-Received: by 2002:a17:902:7406:: with SMTP id g6mr29085792pll.103.1580811210909;
        Tue, 04 Feb 2020 02:13:30 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id p24sm22834066pgk.19.2020.02.04.02.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 02:13:30 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v3 2/3] configs/arm64: Add inmate demo for pine64-plus board
Date: Tue,  4 Feb 2020 15:43:12 +0530
Message-Id: <20200204101313.2495-3-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
References: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=AUe0igL+;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::641 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

- GIC demo and ivshmem-demo are validated.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 configs/arm64/pine64-plus-inmate-demo.c | 131 ++++++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 configs/arm64/pine64-plus-inmate-demo.c

diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
new file mode 100644
index 00000000..0564412d
--- /dev/null
+++ b/configs/arm64/pine64-plus-inmate-demo.c
@@ -0,0 +1,131 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for gic-demo inmate on Pine64+ board
+ *
+ * Copyright (c) Vijai Kumar K, 2019-2020
+ *
+ * Authors:
+ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.vpci_irq_base = 125,
+
+		.console = {
+			.address = 0x1c28000,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		/* State Table */ {
+			.phys_start = 0xbbef1000,
+			.virt_start = 0xbbef1000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Read/Write Section */ {
+			.phys_start = 0xbbef2000,
+			.virt_start = 0xbbef2000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Output (peer 0) */ {
+			.phys_start = 0xbbefb000,
+			.virt_start = 0xbbefb000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Output (peer 1) */ {
+			.phys_start = 0xbbefd000,
+			.virt_start = 0xbbefd000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Output (peer 2) */ {
+			.phys_start = 0xbbeff000,
+			.virt_start = 0xbbeff000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART */ {
+			.phys_start = 0x1c28000,
+			.virt_start = 0x1c28000,
+			.size = 0x400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32 |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0xbbee1000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x01c81000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				(1 << (157 - 128))
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 0001:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200204101313.2495-3-vijaikumar.kanagarajan%40gmail.com.
