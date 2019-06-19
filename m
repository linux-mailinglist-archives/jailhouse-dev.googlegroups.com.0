Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUWQVHUAKGQEOBNNB7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC6F4BF04
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 18:52:35 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id c4sf12434lfh.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 09:52:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560963154; cv=pass;
        d=google.com; s=arc-20160816;
        b=vvLnaS1MkTCIuz/PULE2JP77JIiUYlSttggpFNayIYwEYWgtlDYz4skKdW1LHzvpw1
         ljxcCkbDHpbKhMHhLwu5nhVf1JRLvfnFScEoozttEFwPE3scAA8hLFbuW+AzrJ+GWlBk
         BiLXLoorLoMXq2D1EjW6qkutjpdKMLA9xgSbHWYlsqkoidSFmOZPRDIQ3w0pfVY7g4gv
         MyqZ8hny8Ylvyg9yjk/zrGl+JSHYgDp56ziQnWFnFwAdQAHfZH7OE5wg6p61DmplfhtB
         ahTrxb5BSylNOU/GCcT7PArAWFoSbZ2TwuBaTtplcvfoTL7FlemVjnFJc2x8H0/q24Gq
         2f9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=52XAAZ764cEE/TkEv7aIg68fFiqiZufpXnW5pfs1cfE=;
        b=AzfbE3mroSzX5qG2chlEz2R75L/TphB3YEWyq2YOqnJPNmbFBNWRzTsM5I5+mco9RP
         3/z4Re6aHTHRps/NnhtEd1qUxW6Zmbzsg7rihMfq8D2SwtszQW5OeauuSWR0epqTevDA
         3JnIQZzpVtKG/Uv1Xd5VuPrGYPFVriSd8wyW5jktVX4NIr++t0yMkRl3X8yZ/YJM8RXP
         RXxDyFer2NHcaZi73QIBQR9k1UrMBdLuxzeI3HP52rpVtUn0qSFpZQrQ4QmxO1C2xxyq
         JXJB/MFiXWqF7LIz3bz3MQyO0wSDZpf6eNJ1Ob0rXQVsF03mjEsgWP5dHQ8XRyb+bLTg
         4b6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=52XAAZ764cEE/TkEv7aIg68fFiqiZufpXnW5pfs1cfE=;
        b=Sr/nCx51rhu4Kq9cPlTnIjqIa4D9FERaLIOcLLy1FyEIfZCcBUsACs3O8sd48ARXvW
         dx7N10HiJr/vsMMGvtSCK2aKLTLJhAJyVvcdJAfVXaFuOrCBN5UtzMmopiy8xa2Rs6uG
         Nq+qnZMd/SKggXYBjklHvqHZfuRFPN5/hKtY9ay4t97JIka2IH56GCHfYiMurRanxovm
         VadfCL5GSbci4JADk+I0+PGkCHKvXM/CloTVs6hKJbVsvQj5XOZK+QUSjHJjNeGM5Hmm
         ZoqFkBcw5b/uItDaUC1cKCI2cmutt80H+wMoxvquNBUnTfBQUjEFNNCvQsYxXv1UBiwr
         WV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=52XAAZ764cEE/TkEv7aIg68fFiqiZufpXnW5pfs1cfE=;
        b=ZtHqSgbe+MNcYGLTeE/MM9FxD+icLbbfS8oSlFGBDUMVqM6QRLZhcTEuH8wDm9p1yX
         uhKjmi+FhvweFhbGUYWV65yurGPAQwqzY9VINBVdOV33kfOfISQx1WhgR/xq/os0Y7FE
         hVPm38QXsd7RGaBBC6/JUvjbJ80099P7JApXDbUppzy564uvme6bgdnA4ehWaFWOY19D
         JMPknzTn/81POjGHMs5zgaLq67aEsSNq3vU5NhHI65YyNESVl8wZPFqKbXdbIQhvTqBK
         j8vQybdWKXhlAdlqwN7HlLsCiRry+/zv8x35tQzXp/AeCRR1EQ+zyKTHj3KQv+vgCzUo
         j7Yw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVGhc6LcOsnBFETOVtzKBqJ49sqedVVEOY80bKUodWkfWS1I26F
	GD8SJGUGAy2SzyNj+C7h7pY=
X-Google-Smtp-Source: APXvYqzzbfJd745rZceRBMIewL5VMk8bnpMAQg6xH5BHvPTcagFxYEF7Aiq8ioWD6ss562/thw1ArQ==
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr27787553ljg.65.1560963154239;
        Wed, 19 Jun 2019 09:52:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:92c8:: with SMTP id k8ls355466ljh.7.gmail; Wed, 19 Jun
 2019 09:52:33 -0700 (PDT)
X-Received: by 2002:a2e:995a:: with SMTP id r26mr26754044ljj.107.1560963153663;
        Wed, 19 Jun 2019 09:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560963153; cv=none;
        d=google.com; s=arc-20160816;
        b=mNwKZPuwmTGpjyAZe8xZmhdrfwN7DZf7EHGEd7q9MIm78OS/bDAGfvTgewADml0xOc
         pQogoH415hg3aivYSeVW+a49N+kMQpTk2VtjtK83N8ife9WKp5HLFeqttmHR9EmikcuU
         SE48hdqjixafkngXYP83ggxGtQKx4TulBHAvU8STawWJURtycLzD/VQF9ILzAZkicJ5/
         qJgo4fJsYYdPlhsDqEigg9pCaIUHqtGYQGxruBxK2FpoG3MN3qqCibEuE8jDShw/EWyw
         QfJojGXvsLS1NYChI2AhP+B9UhrQmLY+4mi9sUqV4nh77K/h3x81q08abaKki4P5yooy
         5/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=7eQoCcxNOFd/cD/NDyGvGGDmvGayOciEPRG+YCiHO8I=;
        b=QeYd3SIAXqK+J9tneUDqPAZCxuJMaoyyL1nybKEXqyMqukP6j+3I7e+kuErzmL9PJ2
         eSsTo3tImsJQSsLh4+8kJl9jsGZuA+sXY6eidc76hACXAXTnhFHlLFLanlDPh2DgDeKH
         p5UF7F5xazJLLznhopJiDBSP/0D5psT2y8djXYnOSS4Yl4w3Uk5goM26bVtkNlQq4EyX
         yS+/NWGypOqfzesUP0pqXwuueTUcD6WYRINB1+pNwEO/KYe76kqRooG97iF4i4GDplC2
         oo34gscel1MmSZ5pLhZj6HoBxpMO6qABeRlQdcbaaAAgmqpYYUZ82ADKMGsXplXXskWS
         rGAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id q11si646389ljg.2.2019.06.19.09.52.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 09:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45TWG053wqzy8k;
	Wed, 19 Jun 2019 18:52:24 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	jeanne.romefort@gmail.com,
	Mario Mintel <mario.mintel@st.oth-regensburg.de>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	=?UTF-8?q?Hakk=C4=B1=20Kurumahmut?= <hkurumahmut84@hotmail.com>
Subject: [PATCH] pci: Replace mmio_write64 with mmio_write64_split
Date: Wed, 19 Jun 2019 18:52:24 +0200
Message-Id: <20190619165224.15322-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.19.164217, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

MSI-X vector tables hold 64-bit entries. So far, we used mmio_write64 to
set them.

This conforms the PCI specification: "For all accesses to MSI-X Table and MSI-X
PBA fields, software must use aligned full DWORD or aligned full QWORD
transactions; otherwise the result is undefined" (PCI Local Bus Specification
Rev 3.0, chapter 8.1.2).

Nevertheless, some vendors don't support 64-bit writes, e.g., Broadcom ethernet
cards (BCM5720). mmio_write64 stalls, and the transfer won't happen.

Replace mmio_write64 with a wrapper mmio_write64_split that substitutes the
64-bit write with two 32-bit write operations. This accessor first writes the
upper 32 bits and then the lower 32 bits.

Credits go to Jan, the root cause of this bug was found in a private off-list
discussion.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

Only tested on x86, untested on ARM. I lack PCI devices with MSI-X
suppport.

 hypervisor/arch/arm-common/pci.c    |  4 ++--
 hypervisor/arch/x86/pci.c           |  8 ++++----
 hypervisor/include/jailhouse/mmio.h | 15 +++++++++++++++
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/arm-common/pci.c b/hypervisor/arch/arm-common/pci.c
index 60ffabb8..4f35175f 100644
--- a/hypervisor/arch/arm-common/pci.c
+++ b/hypervisor/arch/arm-common/pci.c
@@ -58,8 +58,8 @@ int arch_pci_update_msi(struct pci_device *device,
 int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
 {
 	/* NOTE: See arch_pci_update_msi. */
-	mmio_write64(&device->msix_table[index].address,
-		     device->msix_vectors[index].address);
+	mmio_write64_split(&device->msix_table[index].address,
+			   device->msix_vectors[index].address);
 	mmio_write32(&device->msix_table[index].data,
 		     device->msix_vectors[index].data);
 	return 0;
diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
index 492e9859..560c5697 100644
--- a/hypervisor/arch/x86/pci.c
+++ b/hypervisor/arch/x86/pci.c
@@ -393,8 +393,8 @@ int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
 				     irq_msg);
 	// HACK for QEMU
 	if (result == -ENOSYS) {
-		mmio_write64(&device->msix_table[index].address,
-			     device->msix_vectors[index].address);
+		mmio_write64_split(&device->msix_table[index].address,
+				   device->msix_vectors[index].address);
 		mmio_write32(&device->msix_table[index].data,
 			     device->msix_vectors[index].data);
 		return 0;
@@ -402,8 +402,8 @@ int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
 	if (result < 0)
 		return result;
 
-	mmio_write64(&device->msix_table[index].address,
-		     pci_get_x86_msi_remap_address(result));
+	mmio_write64_split(&device->msix_table[index].address,
+			   pci_get_x86_msi_remap_address(result));
 	mmio_write32(&device->msix_table[index].data, 0);
 
 	return 0;
diff --git a/hypervisor/include/jailhouse/mmio.h b/hypervisor/include/jailhouse/mmio.h
index 61b4647e..567901d0 100644
--- a/hypervisor/include/jailhouse/mmio.h
+++ b/hypervisor/include/jailhouse/mmio.h
@@ -73,6 +73,21 @@ DEFINE_MMIO_WRITE(32)
 DEFINE_MMIO_WRITE(64)
 /** @} */
 
+/**
+ * Write a 64-bit value to a memory-mapper I/O register. Perform two 32-bit
+ * write operations instead of one 64-bit write operation.
+ *
+ * @param address	Virtual address of the register.
+ * @param value		Value to write.
+ * @{
+ */
+static inline void mmio_write64_split(void *address, u64 value)
+{
+	mmio_write32(address + sizeof(u32), (u32)(value >> (sizeof(u32) * 8)));
+	mmio_write32(address, (u32)value);
+}
+/** @} */
+
 /**
  * Read value from 32 or 64-bit MMIO register field.
  * @param address	Virtual address of the register.
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190619165224.15322-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
