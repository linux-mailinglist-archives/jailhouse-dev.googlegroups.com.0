Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFWD4SBAMGQEHSVNBLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 396CD3452AF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 00:00:39 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id i5sf152242wrp.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 16:00:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616454039; cv=pass;
        d=google.com; s=arc-20160816;
        b=b4P0/7G88dI+HrPE6dNpBR5/BhTjyiRz01uuxIq0Ugje/5GlgZEpyeM//LZx+w7cyW
         YBfNcssIfH0iWtn0vrKfQL8bNDhXGti8ULtE2t0SLlahJy78G4+RDzd05IgW7hRG3EZX
         0m0Cku0Ge2NgZDXRQs5rSnMIp9CU3Xsuxj0BaMOC7ePuDOsSNgsFrEjskngE/xTpqrvH
         Z40cZcBOJnvPQQqKeNU98vmIuuGN9bXL9IHosBKs4ly1BjpUqjpRuA0t4uOqrVCktHjb
         hU6DbpSfCL4zXQecLp4XSc3/61GlAB3DEb28WP/JV8t2gs4NMDhw8/b5SkutFT0eR15W
         hHQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=29LSqfoFlg4CrollnZGvYHnmvF34B8aX4tPVPHpkpXM=;
        b=ftNhD7ZrOcyhBlVsLSuDo1aNTYxOhX5fPfkFSoyfOK43fZ5ujs58v1L9zTXLhO3ytY
         4HQSII/Dbh1BBcCvSOPsqu/1LnJ8+dWDIAeovvY6yvIXFOFpqT50rZZjYzIhyw5Ijua0
         bVn4BKtNWB+AaqY5S8YOPku901GHDsxzG3vXATy52BfkKWe45RqkxzHWH8FjH1w6KbzW
         8rm6AMgJJ6SZ08yeUzAdJbzMYnWFzwa2HG6wt8hcOlZAlaKxDq3oTPhH0HeU81uT2E50
         GnbvX1ZKf+3VmfOiZpjU5xqYvgwmgZcyzdxr0uv5kgLXu7l8sB8u0EFEnerlrR4OLAM9
         PfXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=29LSqfoFlg4CrollnZGvYHnmvF34B8aX4tPVPHpkpXM=;
        b=pfYQ366Lzbh18e2wN8MQkMCvNTt0F8vR8+giBF2Z4eRX4bVPWrJIyL7oTVqohF3XOb
         Al9Yb8Wtlck+t7h6QFfOj1m2FDxvfIGnBcIkmuP5I09gvp/eF0qZIKyjqeIefY4aRWF8
         Lfuy33Gyxgbw/7Ej7m+ycPBCi3nsNhQA/B8ApJ32Nu2laDiWMCo1iFcQYWZmTpEiPXFO
         dkAP0edn7M9Jd8NiVzsWY8s8ZkdtSf4ulMJ5HzwfgKRJknj5LtTXmrGcPDN+7EmTXWgx
         m4DdAt3QV9PEvOSoozmOdh0uXPjTA9alCM3ETOD1xfsO8+RSkMKPPjDAOH2+1HaD94bK
         Mi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=29LSqfoFlg4CrollnZGvYHnmvF34B8aX4tPVPHpkpXM=;
        b=qZpFxYEbPMGA2jSAhjypsJlBVBAAp3bz5nV5sCUsaLR3e0QAQ4A/Ujv/g+dtZU2LFA
         wZYnXiE4EKai1AKZfmv2w0FR84IMLnOJV6ART0xvnjf11cMXDOtocqtWT5U6YfD4eh2I
         yqrXMKbxtLq937EafT+TanhijrIHsX4ZshHAk2Syl+v4zT93htqLDWhqqxc31J1wYC31
         3FJAdcixSPnJIHzMSc3PT6phdLvw81nxKUqyYZL5ydKE4rljFarNj3GXM3aULwghW1EE
         7agyj4SWlcb+h0ZizckGsNmcbxumOB0JJ6lyotVs+sExwnx76qrRy+HSE+sW2v22Tyyb
         u7FA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533zs/9BBGXfKC5aIaRYJLJTV+o5CU+/2UK4Qc1VChE+9rbhl2NA
	nVIVdZ0FAOmAYXDp26ftfQM=
X-Google-Smtp-Source: ABdhPJzZp6PmNvgICvvTQ9ncoE+ywcBQtgEeln9yBN3utjm8E5N8AJYEVet2B+O7o+7gROcr++9ZLw==
X-Received: by 2002:adf:e482:: with SMTP id i2mr810190wrm.392.1616454038904;
        Mon, 22 Mar 2021 16:00:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:162d:: with SMTP id v13ls349760wrb.1.gmail; Mon, 22
 Mar 2021 16:00:38 -0700 (PDT)
X-Received: by 2002:adf:e84f:: with SMTP id d15mr819262wrn.394.1616454037969;
        Mon, 22 Mar 2021 16:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616454037; cv=none;
        d=google.com; s=arc-20160816;
        b=h6PvbHFQohrHVow+mUDQ5TlKjsil0eL2OCcNAV2mtGueHPwEzkXRKtHHtmFAiFMskY
         Mia17lN0vqhvWerGbax/esINwWwHsHPJA/PMi9ydasroSXGZNmYy6KuJCdz5OKIxpEIr
         Kw9xGBrBnT1Fl8gPHX97hl1ON5lSXb7AinR/r5bFPh9EVZJkmT2171+HVo1aT1WWbyiG
         D0WTofG1ibeN+fO93MqE96XHHfQ9yzfJpkEjTlF/xS59l9VVu1x7lQcChAaU7I7PN6+y
         3tcvEyQzwgj9IHkLUjfPL/pAO4GdHRrt02/FxW2fWLqrpEHSjpHbpoRT4xFggEnKqPtA
         BbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=tmf+oZL+1uRYZ8i9JUkD3bJEMKTB1UHKymbXK0Q3eF8=;
        b=Miz9OgvSzJTp+S+pLGNYZFY49Z2PlLdtFd1x/tbyppMq3MTRNAo8iJ+WLrsU9siGZ8
         fJ53lpjAcsxmeH6wHpOq3/jqFLVnnEYO6A04CxdojbTXv44JKlTMsaTU5DfpOlJv418P
         2kr/4GsYz/7I5IJmHGdjpeiYYyCJ3nxhAAbGe/Su7yHZ8PXuHJxo0TLYttdCSw8VfYzP
         rXFDOZmJdrDaD39ULzaOFs7mBa/rjTOGbn3inGkVCuDKWLEAt7kKoU2SLRk/DuS4byGG
         xzZKsheiC34lOo5CB9a0VnyRG2EpgHipx0VyY7+6DgwVVUPOmU9YRidcWQUuVLWREQD/
         HLkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q145si59857wme.1.2021.03.22.16.00.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 16:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12MN0b0n005356
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 00:00:37 +0100
Received: from [167.87.240.35] ([167.87.240.35])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12MMobN2030288
	for <jailhouse-dev@googlegroups.com>; Mon, 22 Mar 2021 23:50:37 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: arm64: rpi4: Move RAM reservation down by 256 MB
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <cf2f5319-592b-f0cc-76bd-be5e20282e52@siemens.com>
Date: Mon, 22 Mar 2021 23:50:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This is needed in order to switch to upstream 5.10 kernel. It refuses to
reserve the formerly used region, apparently due to conflicts with
pre-existing reservations.

Beside adjusting the cell configs, we also need to update the inmate DT
because it now has an overlap with the physical inmate RAM.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/dts/inmate-rpi4.dts |  2 +-
 configs/arm64/rpi4-inmate-demo.c  | 22 +++++++++----------
 configs/arm64/rpi4-linux-demo.c   | 28 ++++++++++++------------
 configs/arm64/rpi4.c              | 36 +++++++++++++++----------------
 4 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
index ac6d4f58..305ac22f 100644
--- a/configs/arm64/dts/inmate-rpi4.dts
+++ b/configs/arm64/dts/inmate-rpi4.dts
@@ -98,6 +98,6 @@
 				<0 0 0 4 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
 		reg = <0x0 0xff900000 0x0 0x100000>;
 		ranges =
-			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+			<0x02000000 0x00 0x20000000 0x0 0x20000000 0x00 0x10000>;
 	};
 };
diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
index 09dfc1f0..1bc244f5 100644
--- a/configs/arm64/rpi4-inmate-demo.c
+++ b/configs/arm64/rpi4-inmate-demo.c
@@ -51,34 +51,34 @@ struct {
 	.mem_regions = {
 		/* IVSHMEM shared memory regions (demo) */
 		{
-			.phys_start = 0x2faf0000,
-			.virt_start = 0x2faf0000,
+			.phys_start = 0x1faf0000,
+			.virt_start = 0x1faf0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x2faf1000,
-			.virt_start = 0x2faf1000,
+			.phys_start = 0x1faf1000,
+			.virt_start = 0x1faf1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x2fafa000,
-			.virt_start = 0x2fafa000,
+			.phys_start = 0x1fafa000,
+			.virt_start = 0x1fafa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x2fafc000,
-			.virt_start = 0x2fafc000,
+			.phys_start = 0x1fafc000,
+			.virt_start = 0x1fafc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x2fafe000,
-			.virt_start = 0x2fafe000,
+			.phys_start = 0x1fafe000,
+			.virt_start = 0x1fafe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
@@ -91,7 +91,7 @@ struct {
 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM */ {
-			.phys_start = 0x2fa00000,
+			.phys_start = 0x1fa00000,
 			.virt_start = 0,
 			.size = 0x00010000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
index cf36fa22..f93c564a 100644
--- a/configs/arm64/rpi4-linux-demo.c
+++ b/configs/arm64/rpi4-linux-demo.c
@@ -52,39 +52,39 @@ struct {
 	.mem_regions = {
 		/* IVSHMEM shared memory regions (demo) */
 		{
-			.phys_start = 0x2faf0000,
-			.virt_start = 0x2faf0000,
+			.phys_start = 0x1faf0000,
+			.virt_start = 0x1faf0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x2faf1000,
-			.virt_start = 0x2faf1000,
+			.phys_start = 0x1faf1000,
+			.virt_start = 0x1faf1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x2fafa000,
-			.virt_start = 0x2fafa000,
+			.phys_start = 0x1fafa000,
+			.virt_start = 0x1fafa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x2fafc000,
-			.virt_start = 0x2fafc000,
+			.phys_start = 0x1fafc000,
+			.virt_start = 0x1fafc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x2fafe000,
-			.virt_start = 0x2fafe000,
+			.phys_start = 0x1fafe000,
+			.virt_start = 0x1fafe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 1),
+		JAILHOUSE_SHMEM_NET_REGIONS(0x1fb00000, 1),
 		/* UART */ {
 			.phys_start = 0xfe215040,
 			.virt_start = 0xfe215040,
@@ -94,15 +94,15 @@ struct {
 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM */ {
-			.phys_start = 0x2f900000,
+			.phys_start = 0x1f900000,
 			.virt_start = 0,
 			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},
 		/* RAM */ {
-			.phys_start = 0x20000000,
-			.virt_start = 0x20000000,
+			.phys_start = 0x10000000,
+			.virt_start = 0x10000000,
 			.size = 0x8000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
index 7b6a7a02..68bb1a24 100644
--- a/configs/arm64/rpi4.c
+++ b/configs/arm64/rpi4.c
@@ -29,7 +29,7 @@ struct {
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
-			.phys_start = 0x2fc00000,
+			.phys_start = 0x1fc00000,
 			.size       = 0x00400000,
 		},
 		.debug_console = {
@@ -72,37 +72,37 @@ struct {
 	.mem_regions = {
 		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
 		{
-			.phys_start = 0x2faf0000,
-			.virt_start = 0x2faf0000,
+			.phys_start = 0x1faf0000,
+			.virt_start = 0x1faf0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		{
-			.phys_start = 0x2faf1000,
-			.virt_start = 0x2faf1000,
+			.phys_start = 0x1faf1000,
+			.virt_start = 0x1faf1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 		{
-			.phys_start = 0x2fafa000,
-			.virt_start = 0x2fafa000,
+			.phys_start = 0x1fafa000,
+			.virt_start = 0x1fafa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 		{
-			.phys_start = 0x2fafc000,
-			.virt_start = 0x2fafc000,
+			.phys_start = 0x1fafc000,
+			.virt_start = 0x1fafc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		{
-			.phys_start = 0x2fafe000,
-			.virt_start = 0x2fafe000,
+			.phys_start = 0x1fafe000,
+			.virt_start = 0x1fafe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 0),
+		JAILHOUSE_SHMEM_NET_REGIONS(0x1fb00000, 0),
 		/* MMIO 1 (permissive) */ {
 			.phys_start = 0xfd500000,
 			.virt_start = 0xfd500000,
@@ -117,10 +117,10 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* RAM (0M-~762M) */ {
+		/* RAM (0M-~506M) */ {
 			.phys_start = 0x0,
 			.virt_start = 0x0,
-			.size = 0x2fa10000,
+			.size = 0x1fa10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
@@ -129,10 +129,10 @@ struct {
 
 		/* 4M reserved for the hypervisor */
 
-		/* RAM (768M-4032M) */ {
-			.phys_start = 0x30000000,
-			.virt_start = 0x30000000,
-			.size = 0xcc000000,
+		/* RAM (512M-4032M) */ {
+			.phys_start = 0x20000000,
+			.virt_start = 0x20000000,
+			.size = 0xdc000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cf2f5319-592b-f0cc-76bd-be5e20282e52%40siemens.com.
