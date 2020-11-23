Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUN76D6QKGQEHHZU35A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8F2C16B3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:14 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id y11sf7051547edv.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164434; cv=pass;
        d=google.com; s=arc-20160816;
        b=QRW84WWRYT21dpPbiGktxiAuto+iR3qHgxBpB4vDf7TfpgY5jt3WHwqkpwvmK3ePC7
         Kq9OKY/IbEsIVv/ezdilzowtMos34lHueDishcR7DXj6YSgIHpU1bdsolvQswVn2qsd9
         hMXWDflriJnn+SeQlVvTBk+BzK7Fve2lLqi9yNfVJh9p/e1iPK5kDp6CWDY63Nx0wCkB
         UF+s2cQUnCAlmcjYzQ+xM9gsa0xRmQu95ow0tnr/oxs0BUedQaKuCJvRJjFXON9uY1p2
         QJvLXKrmybEuTi3IyhKAlxyMihLPlD9P7RkTkfxpJToOjsrbFzUTg2kfwiCOhz4YudR+
         /jOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=eBHh9Tsg3sZkJvU3Wsx+qOmTfGDU/awJdzBAGFjS038=;
        b=B9bbLGdwIoTu2iJkxT0tedLWgI3OWMwsBGqgi1Pd7i6cJwciWwDMYxKx6HTNUJM+x8
         dkd7egUVzb8hwLF6Tsryn7UammMfhWL7z/mf1OiexXp9kXLMYrVlwtfpVS6NYNmjbExA
         ENjQ3PJ8S06FLT6jxE3plBusSX1NtNtlvMzvtVs8Ix1BvylzbKnh7NaggG4EJhcF9RYX
         o7oJAEsH42D/kAIMxMORmgg264xZbTbPBriTefgTuoXB+t+9x2iG+KflxTbx8HQwgDxI
         RT2Rd7zZakx+WdhrtUA1uMPE5RNkYDpS2+5EvpY5ooz/NXgfKKSfmckJL4Tt6Ci5dt7z
         5Y+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=sN3n+gNs;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eBHh9Tsg3sZkJvU3Wsx+qOmTfGDU/awJdzBAGFjS038=;
        b=dmlUZ3ZHozawdbRHEtbZED0rnKmPTqjrYpIS6BnnREJhUBXzbyNUuGmeVi8gtBIxoC
         GiXY2M7LHmJmskDkGwoLVu0qg4uz+p1xjgLmde7rftNAX2zwfSnsl8be79ENWY8//VYO
         +JN8TyXkYKr0jIdVSMrAyUcgrZQD1m8ohkyUKhQ2cbqXcy8asYc9eduU/eHrj8BNyvfA
         iBs+5dRP4F4ULj6uMaNHCvD9xuVbLKFbC44+NFv6c8Cn4E00i0NHb/8ZcdczGVZ+XXBo
         sb+5zCxuNBjYxju57m283mfDDVOwNH3LpvoK2BoaKNSz66PCSyySfcCIqhGxdAHLVari
         T5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eBHh9Tsg3sZkJvU3Wsx+qOmTfGDU/awJdzBAGFjS038=;
        b=ZDamx/XbMweC2Jjqcq8MeRq1GwJVTNdExepYoqKSBKTpJrKlggWPcSy9ZisoacEcbT
         C5Sl2Z8sZs7HR+pzC9A8GoBDv/3vCEEUtNkiSeKZmJJ8NIF9HiX8mbQVRNnCKXh+F99W
         /+bq7GswitLlsDAWtzqCD+rP5/4hgIsIRhvSSAssCmfZ6UMPfrRXXZi4MQ7UHIhHu4Hg
         DrFsQEr5majCeLsdh46r70Df0fFk4xz2stfnH6A++7RUN2j1s5o6YlarosY8H4zX/mGW
         FbPQfLXH0Ab9wHd3UI2bKhfwf17sbOuGmd193KRwolmWXj2jTxsZPyvqP1UWZFzhr2Dc
         pCLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532zET/dCLMz3KtsNmwULP6wuSRhajXHktH3n6Xv3BMEwrognE4w
	uYXkWBYIwTglvcpb6ZFlqmw=
X-Google-Smtp-Source: ABdhPJzVpxqbrJVkEKWdlrtqVlpUjzdEh/IzCYoSx9dlWtRgwTBi1TW1ZE/UhYFt0SJ/PyMa1ioxxQ==
X-Received: by 2002:aa7:c45a:: with SMTP id n26mr1036195edr.112.1606164433906;
        Mon, 23 Nov 2020 12:47:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9f27:: with SMTP id b36ls9121346edf.1.gmail; Mon, 23 Nov
 2020 12:47:12 -0800 (PST)
X-Received: by 2002:a50:d49e:: with SMTP id s30mr1011939edi.320.1606164432821;
        Mon, 23 Nov 2020 12:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164432; cv=none;
        d=google.com; s=arc-20160816;
        b=I9WQmJVv2qy2IzOp4O4PCWfmP9eQlEpeY4rnOsIGxh8hQ+Cd1l3p4yxLYFExshHjwt
         EyLk7NOLn2xcAyDCJWFsJQsuDbeua8gumqalpq6aNGPBKzM58hI6uKanIIGnlNWzAb1u
         8G11asPrgipOhNueaFy+6ObX+D4q3kkUn5YSQhZ5P+pgGE6EgFM6UMNlh/Ghf+ZCgNrw
         WKhbLmBYqczoSigWrKcWyQmQF/VRu2XoEOmMaHOeTK1zvwvacYhfOhTPXq1MotXhYkUL
         IJOidUZEOUQHFhlsyj7PPekP5uKQTfKO7hRBTaTtQawkOxZSnFpZgAvL+4/cpYrEyHUM
         KTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WNLlzUnufxLzz2qJW1jl0Vl7vYNRK7wqSNw4UQ/6MEk=;
        b=Y6oTDzTufLghqivwpr4TTXm0sAIZEGNj7LZuBwj90js7rq7L38Uzfz4B4kbJRE/4r9
         4RtCNKWTR6IvW69VFQaPwnAyjSsfb3rYuIQViNh3S8lCyaEvYy05YgfFCe4n+9+vn4Iu
         rtpvkUsmKuos5HBR4hNbvwjFZJyo+69h8sZiPqEhIWUPUrbhmK4T+OQ66mSg1mLpGtgS
         L+hl9VYwKnsfxvprGe3rNUnl1A9RoJ89lFZMbWzxOKVOhuv6j0bng4guqcqQrWUAETVA
         pppWlxTuL2nIyK9BjxdfGCZcy/2J/mcCevyc0iq/atJcR+J8XKfvE71UabZsl5F4x5v4
         4m7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=sN3n+gNs;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id h5si422493ejl.1.2020.11.23.12.47.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:12 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CfzjX3wWPzyTf;
	Mon, 23 Nov 2020 21:47:12 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id FTV8oBgcOUKg; Mon, 23 Nov 2020 21:47:12 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CfzjW5fn8zyTj;
	Mon, 23 Nov 2020 21:47:11 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 03/14] hypervisor: arm64: add cache coloring implementation
Date: Mon, 23 Nov 2020 21:46:02 +0100
Message-Id: <20201123204613.252563-4-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=sN3n+gNs;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Each colored operation has to identify the correct physically colored
address where to map successive virtual addresses according to
contiguous coloring regions (expressed as contiguous bits in the color
bitmask).

Coloring is still disabled since coloring_way_size is not yet
determined.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/Kbuild                 |   1 +
 hypervisor/arch/arm64/coloring.c             | 186 +++++++++++++++++++
 hypervisor/arch/arm64/include/asm/coloring.h |  85 +++++++--
 3 files changed, 258 insertions(+), 14 deletions(-)
 create mode 100644 hypervisor/arch/arm64/coloring.c

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 4d328021..a5525811 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -23,3 +23,4 @@ lib-y :=3D $(common-objs-y)
 lib-y +=3D entry.o setup.o control.o mmio.o paging.o caches.o traps.o
 lib-y +=3D iommu.o smmu-v3.o ti-pvu.o
 lib-y +=3D smmu.o
+lib-y +=3D coloring.o
diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/color=
ing.c
new file mode 100644
index 00000000..ea19560c
--- /dev/null
+++ b/hypervisor/arch/arm64/coloring.c
@@ -0,0 +1,186 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
+ * Copyright (C) Boston University, 2020
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Renato Mancuso (BU) <rmancuso@bu.edu>
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
+ * COPYING file in the top-level directory.
+ */
+#include <jailhouse/control.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/string.h>
+#include <jailhouse/unit.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/mmio.h>
+#include <asm/control.h>
+#include <asm/coloring.h>
+
+/**
+ *  Only parameter needed to determine the coloring.
+ */
+u64 coloring_way_size =3D 0;
+
+static inline int coloring_mem_destroy(struct cell *cell,
+				       struct jailhouse_memory *mr)
+{
+	int err =3D 0;
+
+	/* Coloring was not created for subpages */
+	if (JAILHOUSE_MEMORY_IS_SUBPAGE(mr)) {
+		BUG();
+	}
+
+	err =3D arch_unmap_memory_region(cell, mr);
+	if (err)
+		return err;
+
+	if (!(mr->flags & (JAILHOUSE_MEM_COMM_REGION |
+					JAILHOUSE_MEM_ROOTSHARED))) {
+		err =3D remap_to_root_cell(mr, WARN_ON_ERROR);
+	}
+
+	return err;
+}
+
+static inline int coloring_mem_start(struct jailhouse_memory *mr)
+{
+	if (!(mr->flags & JAILHOUSE_MEM_LOADABLE)) {
+		BUG();
+	}
+
+	/* Match the address specified during load */
+	mr->virt_start +=3D ROOT_MAP_OFFSET;
+
+	return arch_unmap_memory_region(&root_cell, mr);
+}
+
+static inline int coloring_mem_load(struct jailhouse_memory *mr)
+{
+	if (!(mr->flags & JAILHOUSE_MEM_LOADABLE)) {
+		BUG();
+	}
+
+	/* Fix addr to match the driver's IPA ioremap */
+	mr->virt_start +=3D ROOT_MAP_OFFSET;
+
+	/* Create an ad-hoc mapping just to load this image */
+	return arch_map_memory_region(&root_cell, mr);
+}
+
+static int dispatch_op(struct cell *cell, struct jailhouse_memory *mr,
+			      unsigned int op, unsigned int flags)
+{
+	if (op & COL_OP_CREATE) {
+		return arch_map_memory_region(cell, mr);
+	}
+
+	if (op & COL_OP_DESTROY) {
+		return coloring_mem_destroy(cell, mr);
+	}
+
+	if (op & COL_OP_START) {
+		return coloring_mem_start(mr);
+	}
+
+	if (op & COL_OP_LOAD) {
+		return coloring_mem_load(mr);
+	}
+
+	if (op & COL_OP_FLUSH) {
+		arm_dcache_flush_memory_region(mr->phys_start, mr->size, flags);
+		return 0;
+	}
+
+	/* shouldn't get here */
+	BUG();
+
+	/* keep compiler happy */
+	return 0;
+}
+
+/**
+ *  Get range of contiguous bits in a bitmask.
+ *
+ *  The function returns:
+ *  - bitmask without the extracted bit range.
+ *  - low: original bit position of range start.
+ *  - size: size of the range
+ *
+ *  The function assumes bitmask is not 0.
+ */
+static inline void get_bit_range(
+	size_t *bitmask,
+	unsigned int *low,
+	unsigned int *size)
+{
+	unsigned int _range;
+
+	//col_print("mask: 0x%lx ", *bitmask);
+
+	*low =3D ffsl(*bitmask);
+	_range =3D *bitmask >> *low;
+	*bitmask =3D _range & (_range + 1UL);
+
+	_range =3D _range ^ *bitmask;
+	*size =3D msbl(_range) + 1;
+
+	//col_print("range: 0x%x, low: %u, size %u\n", _range, *low, *size);
+}
+
+int color_cell_op(struct cell *cell,
+		  const struct jailhouse_memory *col_mem,
+		  unsigned int op, unsigned int flags)
+{
+	size_t colors;
+	u64 phys_start =3D col_mem->phys_start;
+	u64 virt_start =3D col_mem->virt_start;
+	struct jailhouse_memory mr;
+	unsigned int start, low, size;
+	unsigned int n;
+	int err =3D -EINVAL;
+
+	col_print("OP 0x%x: PHYS 0x%08llx -> VIRT 0x%08llx "
+			"(C: 0x%08lx, F: 0x%x)\n",
+			op, col_mem->phys_start,
+			col_mem->virt_start,
+			col_mem->colors, flags);
+
+	n =3D 0;
+	mr.flags =3D col_mem->flags;
+	while (virt_start < col_mem->virt_start + col_mem->size) {
+		start =3D low =3D size =3D 0;
+		colors =3D col_mem->colors;
+
+		while (colors !=3D 0) {
+			/* update colors with next color-range */
+			get_bit_range(&colors, &low, &size);
+			start +=3D low;
+			mr.size =3D size * PAGE_SIZE;
+			mr.phys_start =3D phys_start + (start * PAGE_SIZE) +
+					(n * coloring_way_size);
+			mr.virt_start =3D virt_start;
+			/* update next round */
+			virt_start +=3D mr.size;
+			n++;
+#if 0
+			col_print("V: 0x%08llx -> P: 0x%08llx (size =3D 0x%08llx)\n",
+					mr.virt_start, mr.phys_start,
+					mr.size);
+#endif
+			err =3D dispatch_op(cell, &mr, op, flags);
+			if (err)
+				return err;
+		}
+	}
+
+	col_print("Result: %d\n", err);
+	return err;
+}
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch=
/arm64/include/asm/coloring.h
index 54bfa9dd..44c1ca38 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -1,9 +1,13 @@
 /*
  * Jailhouse Cache Coloring Support
  *
+ * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
+ * Copyright (C) Boston University, 2020
  * Copyright (C) Technical University of Munich, 2020
  *
  * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Renato Mancuso (BU) <rmancuso@bu.edu>
  *  Andrea Bastoni <andrea.bastoni@tum.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
@@ -12,13 +16,34 @@
 #ifndef _JAILHOUSE_COLORING_H
 #define _JAILHOUSE_COLORING_H
=20
-#include <asm/dcaches.h>
+#include <jailhouse/cell.h>
=20
-/* Initial empty stub for coloring functions. */
-static inline void arm_color_init(void)
-{
-	return;
-}
+#define col_print(fmt, ...)			\
+	printk("[COL] " fmt, ##__VA_ARGS__)
+
+/** Color operations */
+#define COL_OP_CREATE	0x1
+#define COL_OP_DESTROY	0x2
+#define COL_OP_START	0x4
+#define COL_OP_LOAD	0x8
+#define COL_OP_FLUSH	0x10
+
+/**
+ * Only parameter needed to determine the coloring.
+ */
+extern u64 coloring_way_size;
+
+/**
+ * Colored operations on a cell / memory region.
+ *
+ * Encapsulate the loops needed to iterate through a region and identify
+ * the color-compatible phys2virt mappings.
+ */
+extern int color_cell_op(struct cell *cell,
+			 const struct jailhouse_memory *mr,
+			 unsigned int op, unsigned int flags);
+
+/* -------------------- COLORING ARCH API --------------------------------=
-- */
=20
 /* Make sure we catch incorrect calls to these functions for arm */
 static inline void arm_color_dcache_flush_memory_region(
@@ -26,34 +51,66 @@ static inline void arm_color_dcache_flush_memory_region=
(
 		const struct jailhouse_memory *mr,
 		enum dcache_flush flush_type)
 {
-	BUG();
+       (void)color_cell_op(cell, mr, COL_OP_FLUSH, flush_type);
+}
+
+/**
+ * Autodetection of coloring_way_size.
+ */
+static inline void arm_color_init(void)
+{
+	return;
 }
=20
+/* ------------------------- COLORING API --------------------------------=
-- */
+
 static inline void arch_color_unmap_memory_region(
 		struct cell *cell,
 		const struct jailhouse_memory *mr)
 {
-	BUG();
+	int err;
+
+	if (coloring_way_size =3D=3D 0) {
+		/* TODO: add assert() for debugging jailhouse? */
+		/* must have mapped before */
+		BUG();
+	}
+
+	err =3D color_cell_op(cell, mr, COL_OP_DESTROY, 0);
+	if (err) {
+		BUG();
+	}
 }
=20
 static inline int arch_color_map_memory_region(
 		struct cell *cell,
 		const struct jailhouse_memory *mr)
 {
-	BUG();
-	return 0;
+	if (coloring_way_size =3D=3D 0) {
+		return -ENODEV;
+	}
+
+	// assert(!JAILHOUSE_MEMORY_IS_SUBPAGE(mr));
+
+	return color_cell_op(cell, mr, COL_OP_CREATE, 0);
 }
=20
 static inline int arch_color_remap_to_root(const struct jailhouse_memory *=
mr)
 {
-	BUG();
-	return 0;
+	if (coloring_way_size =3D=3D 0) {
+		return -ENODEV;
+	}
+
+	return color_cell_op(&root_cell, mr, COL_OP_LOAD, 0);
 }
=20
 static inline int arch_color_unmap_from_root(const struct jailhouse_memory=
 *mr)
 {
-	BUG();
-	return 0;
+	if (coloring_way_size =3D=3D 0) {
+		return -ENODEV;
+	}
+
+	return color_cell_op(&root_cell, mr, COL_OP_START, 0);
 }
=20
 #endif
--=20
2.29.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20201123204613.252563-4-andrea.bastoni%40tum.de.
