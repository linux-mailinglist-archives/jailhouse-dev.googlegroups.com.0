Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB26LZTYAKGQEJK53MMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id D01401311E4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:55 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id t3sf26259475wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313195; cv=pass;
        d=google.com; s=arc-20160816;
        b=P5CV4ejJ959IdR5Fd7OL6wafcPB73pJronKoxpduU/FMnX++7tGVBFbc8+/q6P5o+n
         3bp28SlF9StlbxEjIxnDI+cmQP13wykWztRnn7tCLh2ORsigiOIlrwNVNJ40yqgACuwV
         DOgzuBqyuh1o/TYJbdFhOeng329NLqm+7UulOIuse0wUMPREr8jcly5tzE4jhXxKhvIM
         +xWTIyRBgjgw4qosD6+JipBBUnTe3DLspWMt0duWX2qnnzuCCYBeOSTvefaOtzt2g+og
         5+zhPSKByct9BDqf2Xd7iymjZ3BUv9fjusmufDv2p824/6C/6b3vm0M+v5F1KrrO/uyf
         vWLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=uF+sOyphRpRRiOpondqOf+8OCXvUT2bSmxqHvGozuUc=;
        b=GhbfuyThvfF+5XWex01GwVkk/fWp9L0P2tTVTfXrpDJS3zH6kvIroP4CWPqJ27IfHa
         Xpk6prfuqGYvEqo28YBPKfwRUSoigaJ3Y09aPL4OAQUuW7iCVzkd7PASEDae/jpASXMd
         rr+4ATOJFVGmYKZ9k7jkw9zTVB4zGl2+aaC9dVJC0OaZIqh4W5QC5Rng67kevBaIneBE
         GNpAuWA8iwZZFSkt1ZKRMGeUuOUCFckqejfC9h1/j/RANIUY+464u46Uw5+F1rOQMVcq
         M67Ys+v9jz37PJC9h2Jj1UbBf00Bsz77c085Hotg4tEgTx0rXKW0uQMAoh0CgacSrCbq
         wi+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uF+sOyphRpRRiOpondqOf+8OCXvUT2bSmxqHvGozuUc=;
        b=h2jbjToGKpABOr5yhotS9GJMtL/LGnoDeF/Y5X9ONORhwA/w+YyHhiNViNQtOr6k9C
         Ng7pzUA7K1fH8D5DHMTLdBO0TWAQuT7pB80F68xNCZG9XEE6a1CDkcLhLy+eH7N8umEF
         44c/AddFsxqwCDS3WnekdwaAJqVpB1MG/MmEuBE5ld3hiJx/K+6qraWQflQ4Z1SglxYq
         W3p3EVnJN/uMfK65nwG5msyDPDzpigE+J/P55QTimXosf6URRCtvDrgIHaGBVXHBP0+a
         0gpHJQBg6kTQkHvZh+0aN0rz6Cdb9NwH4w3KFyWdL5BFMLB53Afd6a/YUngu5p86CeMi
         pt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uF+sOyphRpRRiOpondqOf+8OCXvUT2bSmxqHvGozuUc=;
        b=QI+sIp4WaVVTv3jrqwb9+FVYDF/iQkVvXaNBszTOqrPwm8N1JmOUqmom42JxU4TI4O
         HM7rAWRRrX086LFoNpDFuhgL5zq+tr/gyYkyj2nKqRGC3NBOlH1dXrFgSq/GN5V8wakq
         7K/NnxX5O9eAVm1aLhVBc2hLqaCxOIlXQhzPQo8Z/YN37Sx8gy9PCrzou8+jmEpQHPRo
         uPMdVDNjgz6Q+jVpC2Le94zryWtS/WRzZd7eGPWaX6iKzg1kpj6kW2vSmp/127u8eDvs
         yOkjqXl0cw827fG8JbnOA0M1b7SCnsYL/lq3OS0jmOx/R63Y4RveVfZd5R3Yg+5yGGD5
         EAjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVdvPsyve2f+I6BnqhYUFy+GxlKGpRiBtRxFnIwzDlQTYiQnWCZ
	V1xdHIie/cCgaUmvA+a+Wa0=
X-Google-Smtp-Source: APXvYqyC8N7MrnQExUtUQnGVS/AscqlMZ9rOI3FXh8dHFNTT7JufShIjYdHwBxdF0hOSZmEYcbUFIQ==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr34989911wmi.46.1578313195556;
        Mon, 06 Jan 2020 04:19:55 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ecc5:: with SMTP id s5ls12868197wro.12.gmail; Mon, 06
 Jan 2020 04:19:54 -0800 (PST)
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr12338410wrr.73.1578313194930;
        Mon, 06 Jan 2020 04:19:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313194; cv=none;
        d=google.com; s=arc-20160816;
        b=sUwJfr9HEZ+jKGY62lvGriivdchWZzbt75MV6VjAqBHa51k3NW6nvjbjz19yU81xgi
         AqQnUm1d3XaMifUOjeZGljqIJ0daaqjVqnYrboioBFQg3vS9zCqZRLETYq3a5UaIQEds
         dqkdgSE//MZ1nQ52I+SyP15psrWJHP1r2zl7im8y6EP6e7eK7VkMnnT0a3S0oZh/i70S
         dy6v+tlHNrjUo6IPtdNdbdgTHNbjgey3qVeAoPySHIe7GJqJ3iDosnBprfqj+sZzAkbm
         Zogheoei8x5eixIKA4GciUw8gZVJ2t40P92kwC6Te8rCtF/Lrf+AsEkBy87XG1E/QL9S
         ybhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=csNLBcJiHWd8pCvoxP9IfFToPZ1BpTbELlQjaAT1s8Y=;
        b=F0XhhGwo+hKcmHGYgg/MJLitiI1QAW8d9YPCzBmoX4T5/p+2eF+3nwyWB/7xmyAiNh
         SLodgUkC72bi7sLeclhbiLRR4w5a1CDP7KCy375T/s4XVE8OUVfYqkB/t4hXit8Z8j5E
         rFnp9YWaOtzYeWmxmKB5Yup9/Li8gnEb05MkSEiVwcaeHWoPrLDYxL/YlnInW52UT0yj
         7CivHYa7Z5Lun0Po25FHNGD1chJbg/pdaeCHO489Yg5bWNFB22hAdfcoDrOuHw0oi5vr
         gGZ2Lkuti7HBO6jGeatY+7hKEIzvRjWghKodKjZHmpKDI+cHHrWSSAilY5MScDIf9KER
         7akA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id j188si756713wma.2.2020.01.06.04.19.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CJsI0020403
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:54 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEZ029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:54 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 01/38] core: ivshmem: Use Siemens-provided device ID
Date: Mon,  6 Jan 2020 13:17:42 +0100
Message-Id: <aff91500baa493a7607e47be3a3f6cdbd8135cae.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

We deviated too much from the original ivshmem, and we will even more.
Therefore, Siemens reserved the device ID 4106h from its pool under the
PCI vendor ID 110Ah. Start using it.

Note though that the device interface is not yet finalized under this
ID. Every driver developing against it must be prepared to see a moving
target, under Jailhouse as well as other implementations, specifically
for QEMU.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 53644deb..358c5b04 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -29,8 +29,8 @@
 #include <jailhouse/processor.h>
 #include <jailhouse/percpu.h>
 
-#define VIRTIO_VENDOR_ID	0x1af4
-#define IVSHMEM_DEVICE_ID	0x1110
+#define PCI_VENDOR_ID_SIEMENS		0x110a
+#define IVSHMEM_DEVICE_ID		0x4106
 
 /* in jailhouse we can not allow dynamic remapping of the actual shared memory
  * the location and the size are stored here. A memory-BAR size of 0 will tell
@@ -62,10 +62,10 @@ struct ivshmem_data {
 static struct ivshmem_data *ivshmem_list;
 
 static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
-	[0x00/4] = (IVSHMEM_DEVICE_ID << 16) | VIRTIO_VENDOR_ID,
+	[0x00/4] = (IVSHMEM_DEVICE_ID << 16) | PCI_VENDOR_ID_SIEMENS,
 	[0x04/4] = (PCI_STS_CAPS << 16),
 	[0x08/4] = PCI_DEV_CLASS_OTHER << 24,
-	[0x2c/4] = (IVSHMEM_DEVICE_ID << 16) | VIRTIO_VENDOR_ID,
+	[0x2c/4] = (IVSHMEM_DEVICE_ID << 16) | PCI_VENDOR_ID_SIEMENS,
 	[0x34/4] = IVSHMEM_CFG_MSIX_CAP,
 	/* MSI-X capability */
 	[IVSHMEM_CFG_MSIX_CAP/4] = (IVSHMEM_MSIX_VECTORS - 1) << 16
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aff91500baa493a7607e47be3a3f6cdbd8135cae.1578313099.git.jan.kiszka%40siemens.com.
