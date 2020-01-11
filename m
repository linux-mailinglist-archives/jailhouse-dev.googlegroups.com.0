Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBPH247YAKGQEQGOGVSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3c.google.com (mail-yw1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5351913828C
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 17:52:13 +0100 (CET)
Received: by mail-yw1-xc3c.google.com with SMTP id e128sf5001716ywc.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 08:52:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578761532; cv=pass;
        d=google.com; s=arc-20160816;
        b=GaVizSKHiRXIgcY5w2xygtrhw9tmY3cfp8+vJ+CPmA/DLKL9XHBR0aUNEE9zJCcBcy
         dA0iULscZk3BxL5LqK4wyM6RrYlHFAFvoDSLUzpEdllrU66s9PBCRilJfdIDNKHemzOO
         Xf39F+nNd7SH6aIGSe/F90YXc16oLjNjWkkFUqIclF4IPmXWEC5/1u6X9yi04OPOLsk9
         e0G8u3qy6PmyVGPLrgTqaGub46EpKkx7dMjqkyPZtO09QJbe2xif9QiDO+LCzE3lx5ka
         cwDrhpTz/i+e13mPkZF66yaspj5EDtVgixFthIrmbX1UEHMOuIcDCnGEAdyUcedeN5A8
         3ywQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=1Fw49hpaxpDnw9eEylbeIiwdg+pns3EiAunPPGYvwvM=;
        b=KywHtuHIrhWmloO+6E3BSPpQ2LxeujNmio4Z34hXMnBl9t/kqkmmgWS8LoFGxFkJs9
         9CSvpLMzfooUMFGo9228Rg77KspYL/vJEIEtiez2dV/b1GbFm5fq5mM21TxOGq1MMZeG
         fXoA/i4YAfQJQ/Vl34HgFY8apPbE/iElAXtfbgtJw5l+hxqcAelXl1R1xEQa4eHxtNrQ
         E7W3Ns4RX5l9Djeb24qvBijpA9XhtRN/EqB0EL5vX8g2WQCovYPLIoPajEskiISnhMuA
         syZwvZbLQcPI6MEOiHfiOvltmnAyWYYjRzNUSKrtWRxugXOlbNen/zYLAeJljAk6aNja
         cICw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EoPBCaIK;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1Fw49hpaxpDnw9eEylbeIiwdg+pns3EiAunPPGYvwvM=;
        b=gZ9YAtiDL6cVHyAdau+tvbJbYpES1RqLyhcxdUbKkoD10mKxDoBtiRYLQ8LZc9V5PO
         qDDl+wTxNYHfran1c0KJ+acdYdGP4eS2T7EIrD05MYx8dakFG0YfUXG2aGMoG9mPgwN9
         oh2WL4wrZXzP9bv8NBge+VB7lYRJ7aEwC9rX9hjtz0c04eJp5a5RkbEiguEvJo1Hs3F9
         oD0caKLq+xnPGcJVtWLS5sVw8msWv8//dd7ScRI8aac1xc90BywcT+QuaKUSziELVXdu
         wvmVd4AcI0PQ7WwhKtJ3tjpgTnDKa3vamK235WInvwi5+ujp196V/8Wu1X01IGujyYMY
         YAFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1Fw49hpaxpDnw9eEylbeIiwdg+pns3EiAunPPGYvwvM=;
        b=QAEK6vUFSyBjff3IK1iy7zMOWlFi22+Bz+7b1kmG06RozF9mbeXLWv3d1fiEaEuEg9
         t86p6ZXgjGWiLp6VKbl3ck1G/4EUnobZ6JCPyPtl0YbjOU1Wzx+aWCJGtFI/lMcySkXd
         3AgPzOox5uvmT57b9nsO5i1EwM30/2zvTVE4/9HtciDExU90Q6vakykdc8i4rBaTV49n
         f58lTGXdzJ4GEZFOMqqJ/FXe0c+FEBvK9CWLM9d2QdcEvTUBM1x38X0zaj8awBT1+TRk
         ww3pgF4jbfwax8/IRykaNo4shETarV9JTRnKAMd9Sum4tOxiD2n+Za9ZEbw5BFQ81Px+
         jz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1Fw49hpaxpDnw9eEylbeIiwdg+pns3EiAunPPGYvwvM=;
        b=FQZbuKMNLe6CNZkKdw5E8suEPM4WI6L8/Sgk8pqbOco8AcHREDGdxlGVYgjsYLwKaJ
         WvzWgpZpwqLDgfJkug7Yton6B1DlNtxCN5YzmulCulECk34WaNFpWcsKFcRLE5ACdmib
         Z3KWS/9X1FPREQ0Yb6udXSP/LAPvGR7MUOPMxC4YAujF0xNET+5UBlb7BCRrYnDyhr2Y
         HgqXdF0vLrki2nnha6PJEUWnGv2eikWlYxLoea9n7678xmKBm9C5Wdtiksnc0dcvIIK5
         LQSF9md15r8LwqUBXI50Q4UUQH85Lx27QsvL+hq0a/ZSNMq1v+WF5/RBb8Nz0HQ4d5o3
         Nb7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWk38Msb9eNkuCK/q2a4daSbHNa5zmj0TIrc0u0vhufKBTa75EN
	Kax2a52qf3/eUSYB3duXiwY=
X-Google-Smtp-Source: APXvYqyNEj/jNiyIMDdJuCweZBj2SdKe8vJGmWc3GDvTrobg3nMIzglXQz0RlTmbskdtC3QNneNjIw==
X-Received: by 2002:a25:9a82:: with SMTP id s2mr3384329ybo.210.1578761532358;
        Sat, 11 Jan 2020 08:52:12 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:86cb:: with SMTP id y11ls636104ybm.15.gmail; Sat, 11 Jan
 2020 08:52:11 -0800 (PST)
X-Received: by 2002:a25:5945:: with SMTP id n66mr3637645ybb.337.1578761531854;
        Sat, 11 Jan 2020 08:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578761531; cv=none;
        d=google.com; s=arc-20160816;
        b=ba+DdZexALfU3Zhwj4bebC5Gu7uVcAz5ZseIgRfLxv0nVZPmjzBws0p4OSGut8xMCb
         meMFd3lCH4K73+lcqSSuIxhV3+qPkjLIDxU1eE6Ke1xktbha1Lu91v2yKyECNn/x0wMJ
         hW18UKWYRQRdtl8jJ9T+1CCJLzrZTrR83XJo7J85T0Fw1QgkQCGMFE6Ah9xrDw0A12Vf
         Nfe+eOrWSUj8P69zJisofoC5veLHf+tJviEkfcfZZqOnCiQXctuFbUQVw1UY4e+9wSWT
         AQH/R//dYnd6VksARs2eGkCK9jVdyInkMedwczGDBymSCnzFcAyYxSuGUetoJezM8Xt2
         ypEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=6UoQX6ckgFuc1wMygseYlaCElNKgqvMtqcafOr6XgR0=;
        b=EZ6Dgr7vAhTF7ue89bHuZyVuXTTOIe7sEaYPjIEddlltMJ0NJbqtKPArSi05m5dH5m
         frvjwgfxx15qEe2V7STB7H5d37+tDd31rxfMF1SKdblwBTixvCO03qImgaT4BLx0vgA6
         1bOiCg3QDW0AQgLje64yRMbUizAaJ18idrsh/lW550LR+5u1lOt/IBcuHrcZPQPMvVxD
         51BEaoXx0mlCebZDLt/JqOBzg3Utu1fFCQV4Gf4aKUhhstyrazR9pxpJcPxwEqyhVPVo
         pC9eojSI2PUBXEgdMb2boE95t9TIOLmccLIVaLJ4eu+0yakZiBpaRqMYNxO3LG2WWGRp
         3UBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EoPBCaIK;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com. [2607:f8b0:4864:20::643])
        by gmr-mx.google.com with ESMTPS id z5si321340ywg.5.2020.01.11.08.52.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2020 08:52:11 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) client-ip=2607:f8b0:4864:20::643;
Received: by mail-pl1-x643.google.com with SMTP id s21so2085762plr.7
        for <jailhouse-dev@googlegroups.com>; Sat, 11 Jan 2020 08:52:11 -0800 (PST)
X-Received: by 2002:a17:902:8b89:: with SMTP id ay9mr5544590plb.309.1578761530871;
        Sat, 11 Jan 2020 08:52:10 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id y6sm7221824pgc.10.2020.01.11.08.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2020 08:52:10 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH 2/2] configs/arm64: Add gic demo for pine64-plus board
Date: Sat, 11 Jan 2020 22:21:34 +0530
Message-Id: <20200111165134.1421-2-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200111165134.1421-1-vijaikumar.kanagarajan@gmail.com>
References: <20200111165134.1421-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=EoPBCaIK;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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

Add GIC demo for Pine64+ Board.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 configs/arm64/pine64-plus-gic-demo.c | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 configs/arm64/pine64-plus-gic-demo.c

diff --git a/configs/arm64/pine64-plus-gic-demo.c b/configs/arm64/pine64-plus-gic-demo.c
new file mode 100644
index 00000000..52b6d39a
--- /dev/null
+++ b/configs/arm64/pine64-plus-gic-demo.c
@@ -0,0 +1,69 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for gic-demo inmate on Pine64+ board
+ *
+ * Copyright (c) Vijai Kumar K, 2019
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x1c28000,
+			.type = JAILHOUSE_CON_TYPE_PL011,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x1,
+	},
+
+	.mem_regions = {
+		/* UART */ {
+			.phys_start = 0x1c28000,
+			.virt_start = 0x1c28000,
+			.size = 0x400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32 |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0xbbfe0000,
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
+	}
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200111165134.1421-2-vijaikumar.kanagarajan%40gmail.com.
