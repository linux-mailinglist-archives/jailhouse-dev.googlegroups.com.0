Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBN7VU7YAKGQELLY5EIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd40.google.com (mail-io1-xd40.google.com [IPv6:2607:f8b0:4864:20::d40])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DB12D042
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 14:25:13 +0100 (CET)
Received: by mail-io1-xd40.google.com with SMTP id e13sf9587253iob.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 05:25:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577712312; cv=pass;
        d=google.com; s=arc-20160816;
        b=cwKZOTdHF0sb6s6wiVuIhsHiyaFeK+IwEMJOC5JPP6BPlm331wqwuORGnHqYpU6QBS
         p806phRuhH/XOBdy1XIxmAQ5a+kKDqad0QkWrNWm0hz9DMGeII3l2SLaWs6KyqbjCUhQ
         DfXsxapffmOOIKzZXi9ZPHe8mJGItf4p0CaSSCkkWFhahBTQkseLgRxXCfLOL9ODPoRJ
         pdBmhB69g6I/ElRZ6iZrYqj9XAmc1L/GX9IPH77DUwgL9/sQLWUuhKFDP+yupdxZdivl
         9gRuXEprACPA6GHgN4mTqmOWTuQeRrCWjzQVQIphUp4VrYRfSEnc3L7Afx82TLFVI8HO
         dvbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=m0DVsNw+34eIknWaOFGPs9BWr3RRMGcDmzhTa9Czghk=;
        b=Vowr2AkpLw/Xo/FJLF+Osi4ERlPCz7f5b5Sqce5BoAoVcu1Blqp3s/VJSufL/XTG/A
         7Y1OVf7gRIWszFXzyGY0stwYBlOL1rsSCHEDSxymx+7L0YCb67CMIhVEkfCEna9KWca9
         nsTHLj70DN5YsO4hLY637k7785oJxYjaLdr1prHiF7DaSGK9HlibJ/oyOKsKD482vMe4
         DdwPOch/JwmmXdLHV4OdQbewC+Mu1sFUY+bSBOHX4Uy5qvvm1uzeFCzYZR4S8J7pyE/d
         UGvC0gdUMmJjHz7tglPzFvTZ9sbI4F4w3K6tPOjzbPz+LEfypxVPqkkUHwmHNy3X/5qw
         vHwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OWlOAIb8;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=m0DVsNw+34eIknWaOFGPs9BWr3RRMGcDmzhTa9Czghk=;
        b=sfyRFLBNyWyl0LYL4hSE93cLApXZ1u94yVd/Zb8TntvyCTxtJxIkPnGXHipJFaKZ6n
         g02sWLd2VWnfPpedmHlvfnI/4miwXCxAtxaPl1+Jc8i7LzmeGr2hjZBeUGFKL5WTmXEa
         9qaJWq9fpNYR/k6/q0pGkX6GDEaGxHR+lUPQa1xnM+HkQy5KaRREgk5zruT7K9luvGu5
         gUAnWfbg00WGRHY6WP1PIV1Q8wOfEw8yAejBOLsVhxRTqvzPJ1fRfjGP5zQ+Zh9nwTcZ
         2fV6mAm0rOpd/+84xcs9dMBlWo0qYyRhnRgM61MIwPy6bYFGXsQEWkPPW4WYPizMNdrX
         XxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m0DVsNw+34eIknWaOFGPs9BWr3RRMGcDmzhTa9Czghk=;
        b=clAIVjE8BEY6UvgeVm6hdL0e8gy4pfGmbqlR9QkWmoaDxULWTCvuMY43Z1drngOC0N
         yc/1tj7C9zGln0mZ2ARJhCiTgk2OgqZ7st/gEwHhzCn5pMqdv6dvAuj/o8sBaoOVkM4X
         d/0wVrLJeSUrun+o5mXUBUuakrli+wJLT0OBNi9GUFN/gAjTAabhnfxZCYf/+X+PVd4J
         yGXtqm55QpkFW96GWMeo4j7eNKOML9N+AJohYZ+6vppO4uRy6sYD1r1HxcTa37PBynvs
         G6TTnpzVP76dBgLwp4LW3e4+hv11Ly0HQnIXyStlJUEIhr/jiV/IPd85KV8/2dZPmbrY
         oMfA==
X-Gm-Message-State: APjAAAUXv0rPhsIEPH4X+YmW8LJ5RroOMwuXxXBPtVe0zwvI9dUFPyb9
	KfLxQmdHUwH+zRXCN3cW5Fo=
X-Google-Smtp-Source: APXvYqxMto/+KSJ+MdJY0E1kxt4/Y6sky8DNKDgJ1WaE19nKk/+i5VpXR7fWKG+Hj6eWFinwaDG5Hw==
X-Received: by 2002:a92:405b:: with SMTP id n88mr23721883ila.95.1577712312089;
        Mon, 30 Dec 2019 05:25:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:7518:: with SMTP id l24ls4005176ioh.0.gmail; Mon, 30 Dec
 2019 05:25:11 -0800 (PST)
X-Received: by 2002:a05:6602:220b:: with SMTP id n11mr46151782ion.6.1577712311580;
        Mon, 30 Dec 2019 05:25:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577712311; cv=none;
        d=google.com; s=arc-20160816;
        b=CF68ZlwyP/AuhVcks1UQKW2M9iocmAhma+27B1cuPw8ffuc8y0jY38OwTmcaWMagBS
         gJI0M/K9lzR61TEEPeFeR8buX8xLiF8eAvvVOfL7Ffo6f4TJHjkpQbSSZYpfnUgNWRjV
         i3ORj5P7AQ3DbgW6W+yZ5R4JlTwRgMwl2gBNh6YPKVXMLATAx1UP/q1sIurIA84hPZfQ
         owKc16giCbfqilTuc6cMW5p9pWjQc+Ac9qmCRAmWzgjHeMsNRDzRldnrutJWvQd7U8UD
         j6tzRNaNOZlw2SyvECcrZPVmurTorABlPPG86FP58vchxUelSr2ODAOxD55vBbX4EgDm
         IfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h1aEPiUlg4Y0/oN4tdPAIqLp+hlA4Dg93rjW8OArEgk=;
        b=OXdsYfaUBCq5xpMVzItX1rl6on7ywl7gKk/fsPYcM94u1wm1qdb7vOP3iGEi6Q8nrW
         H00uXaToL1jnMGrbf2oZodP6K/5VqGV0C4sSwo3HNJz7eVVH6+IUidYwycQOKMy7KU23
         Dhr6Eyf1oQ/jKbdyVhD93M8/vtb0ZTtoiQ+FilphFfkjT8BueX5fQD62xYQd9xSDLyiX
         T/z3hruVR3/KsH0F9GuNND86qx5GQLKDygHZrApjd32q7g4Dva9QE4YFTulJLVQxE4ag
         fEVwCFwvuyIL93wc3ozsExeCU3yT1Ptt6hevMswBWCQx4cEj4c180C7ATJZTqkuGSPel
         HhLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OWlOAIb8;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id z7si1721226ilz.1.2019.12.30.05.25.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Dec 2019 05:25:11 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUDPBsw117056;
	Mon, 30 Dec 2019 07:25:11 -0600
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBUDPBR2085710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Dec 2019 07:25:11 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 07:25:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 07:25:10 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP0od120516;
	Mon, 30 Dec 2019 07:25:08 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v1 4/4] configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU
Date: Mon, 30 Dec 2019 18:54:06 +0530
Message-ID: <20191230132406.19985-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230132406.19985-1-nikhil.nd@ti.com>
References: <20191230132406.19985-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=OWlOAIb8;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

Add stream_ids for peripherals which are behind IOMMU instances.
PVU and SMMU-V3 sets up memory mapping for all of these contexts
for correct 2nd stage translation.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c |  7 +++++++
 configs/arm64/k3-j721e-evm.c            | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 55938b85..e9ef0121 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -27,6 +27,7 @@ struct {
 	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
+	__u32 stream_ids[2];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -38,6 +39,7 @@ struct {
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 		.cpu_reset_address = 0x0,
 		.vpci_irq_base = 195 - 32,
 		.console = {
@@ -273,4 +275,9 @@ struct {
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
+
+	.stream_ids = {
+		/* Non PCIe peripherals */
+		0x0003, 0xf003,
+	},
 };
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 8fb4773b..688d58f4 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -22,6 +22,7 @@ struct {
 	struct jailhouse_memory mem_regions[33];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[1];
+	__u32 stream_ids[30];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -82,6 +83,7 @@ struct {
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 			.vpci_irq_base = 191 - 32,
 		},
 	},
@@ -384,4 +386,16 @@ struct {
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
+
+	.stream_ids = {
+		/* Non PCIe peripherals */
+		0x0002, 0xf002,
+		/* PCI1 */
+		0x0100, 0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107,
+		0x0108, 0x0109, 0x010a, 0x010b, 0x010c, 0x010d, 0x010e, 0x010f,
+		/* PCI2 */
+		0x4100, 0x4101, 0x4102, 0x4103, 0x4104, 0x4105,
+		/* PCI3 */
+		0x8100, 0x8101, 0x8102, 0x8103, 0x8104, 0x8105,
+	},
 };
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191230132406.19985-5-nikhil.nd%40ti.com.
