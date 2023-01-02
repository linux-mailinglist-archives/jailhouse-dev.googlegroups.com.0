Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUHZKOQMGQEALWZAVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B22F65AD96
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:11:07 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id q10-20020a056402518a00b0048e5bc8cb74sf913338edd.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:11:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672643466; cv=pass;
        d=google.com; s=arc-20160816;
        b=fQTNLtnNff602cx8A4jkr0QZfkgHPpT/hWa0ReWdfb6xZPK99DfaxpvNCU9MW7yfpP
         V86227QwbFZiqKiZFHSVXXNmsy65gUf5CMgSEPqlbAbhdZz/ZGug78CJYEeuvkhSSlhr
         q7cfxJPauFF5UUHyX875LH0lEM3jAvczc97j4C0bO2wn8qRLD1DGZ4bfSMPavq81C19o
         o+b68Ilks+fYmofeFNW0sXHadRQaHQh/trYNsY5256X1WMQHZwVukexxXqAu9waiCuxS
         I92gDIAa1prNgHi08Ohqf9AmI/15B3LWBa7eliZkLPqANpYcnvnqhPb8sQMHgQ4F+7LV
         tmqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=bWwgNTh3dg8D7VlXoFqXh0UEA8iztSVfEVEw90pB4hg=;
        b=yMvTxLPbthgSsiEmfrFSdbSLdmaDmLzAS2iQux+PpowghsSEh9oZLIt5kT/4/b+exx
         v44L689fGfoHDhoZvHyTspOOwnJm0PXZszsqlugWAVl9wCLyrQiPTfr29n82jMjkTsF+
         DAcQON87MhRxqPr/95Z8SikLYLWjVicREF5pfl4Qh2egH+ezPX2rUkRE+7HAY8rcD8or
         Wdxh7iJOVrye9igrSm+dRhKLHKQxDmSTM0PUH7WpkQf1jzomSQiOYTK8OSreLDA8itOr
         S8/ywUZdXZscnWoYwnt5aAVtyfNn2wppZ7sUO4p5IKqeYbbODr/vC+rwhfsYleIm70Zp
         b5zg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=kpj8C3n1;
       spf=pass (google.com: domain of fm-294854-202301020711045eec9ddd1003c6c38b-1ykf4l@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-202301020711045eec9ddd1003c6c38b-1YKF4l@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWwgNTh3dg8D7VlXoFqXh0UEA8iztSVfEVEw90pB4hg=;
        b=rrKyjhrHTF7uWmCCYqxP5j+FFV5jHmgxI7GRCuyZk+jAJkFLVjk9UhZdXunPxWuc69
         e/2NXiwtSpYc9b/I09bAcsKL1RSpNMYbNKMngO8/7wnm//nABu2XetMdQjFxCnk6oB3c
         jXGb9NM/pYEg7MR76R7Q+zxrH5nUHQostkuAl4ED++pu5jxxAHqSHuM1fVDLCnYwP4j9
         M0M7UfYKLQBT/c2ES68Qrfbr3cfEpApZwkIwbyCClDGg1tYg0Lr6m3u5q1kmT9vCbKzK
         O3/NZouG2o4IL3/HtlFn9vzYh1g4Q+qp1Bsp5zkPS7qRay9rZTF+NM+JH2ijH0uHwv9H
         Zjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWwgNTh3dg8D7VlXoFqXh0UEA8iztSVfEVEw90pB4hg=;
        b=YghQ4BXcN8ts9wPxr55p8uaAsJh1B4xXCQ01A6xmePw8AP6BD4Ig9xVq5lLlNqt4hL
         POCVV4E227A1fRKUIjAYfTo/mdhE0/VwsF2/BR0394jI5Ox6womEvwNZ+R5F/Lw/41A/
         q0caX1yCpxjA9979K6ERduBWK4sLoayctarA7TVaFAvnfKIyDKpW+imFaerKP6L53Dmk
         E1UD7wM3nHLY2PP4m6UW14bDgQHq5XTYfVFhDHiuDd4v1+3NEGYX3ruKRr/zxm+33fBt
         DtAvuoi7opysY6dRu3ODSk3Yk4F+bKdMSigXFUZUDOib47trc9UYNoYdFY5JIb/bizpJ
         6N4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koiNAeQ1l5LagMsk22Nbt5k8DK4c7j0sWZZQYmE/3tr3Vu+lgRE
	g2SI2cqFFRU+B3MknNRSpeQ=
X-Google-Smtp-Source: AMrXdXtJRrDhS0+YLsUyzJo+ElvnUXJ/QvTUKuLeCVyxI7hA0JjBkNXHZ+sdj4f4xWaTsT1pA63AlA==
X-Received: by 2002:a17:906:f6d7:b0:7c4:efa5:b1ea with SMTP id jo23-20020a170906f6d700b007c4efa5b1eamr4323015ejb.335.1672643466692;
        Sun, 01 Jan 2023 23:11:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:4413:b0:43d:b3c4:cd21 with SMTP id
 y19-20020a056402441300b0043db3c4cd21ls3787743eda.2.-pod-prod-gmail; Sun, 01
 Jan 2023 23:11:05 -0800 (PST)
X-Received: by 2002:a05:6402:450c:b0:47c:445b:b4f with SMTP id ez12-20020a056402450c00b0047c445b0b4fmr35118021edb.32.1672643465260;
        Sun, 01 Jan 2023 23:11:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672643465; cv=none;
        d=google.com; s=arc-20160816;
        b=EUzC+o1Hhuw+mbAsGxaLtsYznFbfbquRciU2IlXfL06LAUNUiP/X1E5Zd+5DkmnFEU
         YvqSzjx3e3wTD1jG/ZJ1F8Tyt63usgiuv/is68LWhOZ1f+u0kvFdsoq8d3xn9BHApEQw
         Mc+TWdhO6y0vC0J5C5sDUBZTnY9LpFlqAC1mIeQ1mz1YK1iL8JzHw/dsbj+zz8wc5XeG
         +q8ZxhIoMi7LuZsiG0EtAzVJksmTRL1ueaD7Z572LvHOrAkwrJEjCvDaaQjL3GDJ19OJ
         8OWeDyIMWXkAR8JsPFLs4ewFDIWODe7Zh9+Q784NonXmbySeTl1KPYlbXNdsu9f4+dDJ
         1omA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=GZs8/1NDkzCrahkXQVyNyCaB4KTOzx6PwUvS3e+hR6A=;
        b=PS+ZTuvZRONbu+LEfkzlt6N0ZS8W7MfRBQNzgCwGJsaijEXo3LFN0F84iaoOrn/kf+
         KXokIcXazSBfdFHiIGDvvQiHnGUXZ1gAQcPTu31AZyFqRmFcXKLu99RRIhqBpDsTyZG3
         OpQGqTSlh/v71p43KCLpDkHmznZphAsv5AG5p6eZcu6TF6Hy8N3hLIkhmK7BdKDe/1XB
         M6xeQQQ8vdmws/vAfOb/DmEyZBl/UUiA8aJNXE1/Tkr9DawyF7hIu1XRgvEsBaOsh8gC
         W0DwOeGc2PHIA5BOCGZqM1qicqbBCZbxZ4mlpssh91wI+kS6Q0XNcg94IUHmU5o0ircX
         o2Yg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=kpj8C3n1;
       spf=pass (google.com: domain of fm-294854-202301020711045eec9ddd1003c6c38b-1ykf4l@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-202301020711045eec9ddd1003c6c38b-1YKF4l@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net. [185.136.64.228])
        by gmr-mx.google.com with ESMTPS id x15-20020aa7dacf000000b0046920d68fe2si995826eds.4.2023.01.01.23.11.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:11:05 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-202301020711045eec9ddd1003c6c38b-1ykf4l@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) client-ip=185.136.64.228;
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202301020711045eec9ddd1003c6c38b
        for <jailhouse-dev@googlegroups.com>;
        Mon, 02 Jan 2023 08:11:05 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/4] configs: x86: qemu: Move ivshmem devices behind hotplug-capable bridge
Date: Mon,  2 Jan 2023 08:11:02 +0100
Message-Id: <11d89ccbe98ae77baaa18dbb68faaef04278ef83.1672643463.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1672643463.git.jan.kiszka@siemens.com>
References: <cover.1672643463.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=kpj8C3n1;       spf=pass
 (google.com: domain of fm-294854-202301020711045eec9ddd1003c6c38b-1ykf4l@rts-flowmailer.siemens.com
 designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-202301020711045eec9ddd1003c6c38b-1YKF4l@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Recent QEMU disabled hotplugging support for the root bus. Linux will
still find the ivshmem devices we inject there so far, but it will fail
to allocate IRQs for it because the related irq domain was frozen in
size, given that hotplug is not possible.

Work around this issue by moving the virtual devices behind a PCIe-PCI
bridge that is hotplug-capable. Adding that bridge shuffles some memory
regions around, so adjust the configs accordingly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/ivshmem-demo.c   |   2 +-
 configs/x86/linux-x86-demo.c |  34 +++++-----
 configs/x86/qemu-x86.c       | 118 +++++++++++++++++++++++++----------
 3 files changed, 102 insertions(+), 52 deletions(-)

diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index ce05b6b5..4c24193f 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -107,7 +107,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
-			.bdf = 0x0e << 3,
+			.bdf = 0x100 | (0x0e << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 16,
 			.shmem_regions_start = 0,
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 47cb6517..0703c5b9 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -144,31 +144,31 @@ struct {
 				JAILHOUSE_MEM_LOADABLE,
 		},
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
+		/* MemRegion: fea00000-fea3ffff : 0000:00:02.0 */
 		{
-			.phys_start = 0xfeb40000,
-			.virt_start = 0xfeb40000,
+			.phys_start = 0xfea00000,
+			.virt_start = 0xfea00000,
 			.size = 0x40000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: feb80000-feb9ffff : e1000e */
+		/* MemRegion: fea40000-fea5ffff : e1000e */
 		{
-			.phys_start = 0xfeb80000,
-			.virt_start = 0xfeb80000,
+			.phys_start = 0xfea40000,
+			.virt_start = 0xfea40000,
 			.size = 0x20000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: feba0000-febbffff : e1000e */
+		/* MemRegion: fea60000-fea7ffff : e1000e */
 		{
-			.phys_start = 0xfeba0000,
-			.virt_start = 0xfeba0000,
+			.phys_start = 0xfea60000,
+			.virt_start = 0xfea60000,
 			.size = 0x20000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: febd1000-febd3fff : e1000e */
+		/* MemRegion: fea91000-fea93fff : e1000e */
 		{
-			.phys_start = 0xfebd1000,
-			.virt_start = 0xfebd1000,
+			.phys_start = 0xfea91000,
+			.virt_start = 0xfea91000,
 			.size = 0x3000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
@@ -203,7 +203,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
-			.bdf = 0x0c << 3,
+			.bdf = 0x100 | (0x0c << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
 			.shmem_regions_start = 0,
@@ -215,7 +215,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
-			.bdf = 0x0d << 3,
+			.bdf = 0x100 | (0x0d << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 3,
 			.shmem_regions_start = 4,
@@ -227,7 +227,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
-			.bdf = 0x0e << 3,
+			.bdf = 0x100 | (0x0e << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 16,
 			.shmem_regions_start = 8,
@@ -238,7 +238,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
-			.bdf = 0x0f << 3,
+			.bdf = 0x100 | (0x0f << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
 			.shmem_regions_start = 13,
@@ -261,7 +261,7 @@ struct {
 			.msi_64bits = 1,
 			.num_msix_vectors = 5,
 			.msix_region_size = 0x1000,
-			.msix_address = 0xfebd0000,
+			.msix_address = 0xfea90000,
 		},
 #endif
 	},
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 9ca5c528..c4d7ecfc 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -24,9 +24,9 @@ struct {
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[31];
 	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pio pio_regions[12];
-	struct jailhouse_pci_device pci_devices[11];
-	struct jailhouse_pci_capability pci_caps[11];
+	struct jailhouse_pio pio_regions[13];
+	struct jailhouse_pci_device pci_devices[12];
+	struct jailhouse_pci_capability pci_caps[16];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -171,59 +171,59 @@ struct {
 			.size = 0x1000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: fe000000-fe003fff : 0000:00:1f.7 (virtio-9p) */
+		/* MemRegion: fe200000-fe203fff : 0000:00:1f.7 (virtio-9p) */
 		{
-			.phys_start = 0xfe000000,
-			.virt_start = 0xfe000000,
+			.phys_start = 0xfe200000,
+			.virt_start = 0xfe200000,
 			.size = 0x4000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
+		/* MemRegion: fea00000-fea3ffff : 0000:00:02.0 */
 		{
-			.phys_start = 0xfeb40000,
-			.virt_start = 0xfeb40000,
+			.phys_start = 0xfea00000,
+			.virt_start = 0xfea00000,
 			.size = 0x40000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: feb80000-feb9ffff : e1000e */
+		/* MemRegion: fea40000-fea5ffff : e1000e */
 		{
-			.phys_start = 0xfeb80000,
-			.virt_start = 0xfeb80000,
+			.phys_start = 0xfea40000,
+			.virt_start = 0xfea40000,
 			.size = 0x20000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: feba0000-febbffff : e1000e */
+		/* MemRegion: fea60000-fea7ffff : e1000e */
 		{
-			.phys_start = 0xfeba0000,
-			.virt_start = 0xfeba0000,
+			.phys_start = 0xfea60000,
+			.virt_start = 0xfea60000,
 			.size = 0x20000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: febd1000-febd3fff : e1000e */
+		/* MemRegion: fea91000-fea93fff : e1000e */
 		{
-			.phys_start = 0xfebd1000,
-			.virt_start = 0xfebd1000,
+			.phys_start = 0xfea91000,
+			.virt_start = 0xfea91000,
 			.size = 0x3000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: febd4000-febd7fff : 0000:00:1b.0 (ICH HD audio) */
+		/* MemRegion: fea94000-fea97fff : 0000:00:1b.0 (ICH HD audio) */
 		{
-			.phys_start = 0xfebd4000,
-			.virt_start = 0xfebd4000,
+			.phys_start = 0xfea94000,
+			.virt_start = 0xfea94000,
 			.size = 0x4000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 (vesafd) */
+		/* MemRegion: fea98000-fea98fff : 0000:00:01.0 (vesafd) */
 		{
-			.phys_start = 0xfebd8000,
-			.virt_start = 0xfebd8000,
+			.phys_start = 0xfea98000,
+			.virt_start = 0xfea98000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: febd9000-febd9fff : 0000:00:1f.2 (ahci) */
+		/* MemRegion: fea9a000-fea9afff : 0000:00:1f.2 (ahci) */
 		{
-			.phys_start = 0xfebd9000,
-			.virt_start = 0xfebd9000,
+			.phys_start = 0xfea9a000,
+			.virt_start = 0xfea9a000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
@@ -257,8 +257,9 @@ struct {
 		PIO_RANGE(0x3b0, 0x30), /* VGA */
 		PIO_RANGE(0x3f0, 0x8), /* floppy */
 		PIO_RANGE(0x402, 0x1), /* invalid but accessed by X */
+		PIO_RANGE(0xcd0, 0x8), /* QEMU ACPI hotplug */
 		PIO_RANGE(0x5658, 0x4), /* vmport */
-		PIO_RANGE(0xc000, 0xff), /* PCI devices */
+		PIO_RANGE(0xd000, 0xff), /* PCI devices */
 	},
 
 	.pci_devices = {
@@ -281,7 +282,25 @@ struct {
 			.msi_64bits = 1,
 			.num_msix_vectors = 5,
 			.msix_region_size = 0x1000,
-			.msix_address = 0xfebd0000,
+			.msix_address = 0xfea90000,
+		},
+		/* PCI bridge */
+		{
+			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
+			.domain = 0x0000,
+			.bdf = 0x0018,
+			.bar_mask = {
+				0xffffff00, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 11,
+			.num_caps = 5,
+			.num_msi_vectors = 1,
+			.msi_64bits = 1,
+			.msi_maskable = 1,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
 		},
 		{ /* ICH HD audio */
 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
@@ -323,12 +342,12 @@ struct {
 			.num_caps = 1,
 			.num_msix_vectors = 2,
 			.msix_region_size = 0x1000,
-			.msix_address = 0xfebda000,
+			.msix_address = 0xfea9b000,
 		},
 		{ /* IVSHMEM (virtio-blk back-end) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
-			.bdf = 0x0c << 3,
+			.bdf = 0x100 | (0x0c << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
 			.shmem_regions_start = 0,
@@ -340,7 +359,7 @@ struct {
 		{ /* IVSHMEM (virtio-con back-end) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
-			.bdf = 0x0d << 3,
+			.bdf = 0x100 | (0x0d << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 3,
 			.shmem_regions_start = 4,
@@ -352,7 +371,7 @@ struct {
 		{ /* IVSHMEM (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
-			.bdf = 0x0e << 3,
+			.bdf = 0x100 | (0x0e << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 16,
 			.shmem_regions_start = 8,
@@ -363,7 +382,7 @@ struct {
 		{ /* IVSHMEM (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
-			.bdf = 0x0f << 3,
+			.bdf = 0x100 | (0x0f << 3),
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
 			.shmem_regions_start = 13,
@@ -439,5 +458,36 @@ struct {
 			.len = 4,
 			.flags = 0,
 		},
+		/* PCI bridge */
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0x8c,
+			.len = 0x18,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_PM,
+			.start = 0x84,
+			.len = 0x8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_EXP,
+			.start = 0x48,
+			.len = 0x3c,
+			.flags = 0,
+		},
+		{
+			.id = 0xc,
+			.start = 0x40,
+			.len = 0x02,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x100,
+			.len = 0x40,
+			.flags = 0,
+		},
 	},
 };
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/11d89ccbe98ae77baaa18dbb68faaef04278ef83.1672643463.git.jan.kiszka%40siemens.com.
