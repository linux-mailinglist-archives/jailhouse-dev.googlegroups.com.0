Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB5MV6HYAKGQENBNEOSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa39.google.com (mail-vk1-xa39.google.com [IPv6:2607:f8b0:4864:20::a39])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3C0138F8C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 11:48:22 +0100 (CET)
Received: by mail-vk1-xa39.google.com with SMTP id x74sf4502883vke.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 02:48:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578912501; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ghg7Q8LgsQ0s8NkommDyy1oe8H5UWE0Uw9geAxndW+yiL48nmRo+EjdGjGwwxqjOH1
         iCWxOLxJRlH16fedinW3fUIUVL9IkXdz45/3z3I/cb6fIie1s4cbxCAZ0yYaizMqbvMd
         vk47kCy7aA5R9l5rku/I+K2SwH65AqEBZL+jNiMcqcsvHeL42AMj5egYy6MTkMhdOKTO
         BOBgktTeyHTxDCRfTlbsCipkgpt/ArvR4vqJmq3auxA38XF7fjE+15ux+ndg0Th/QxAS
         kTXkD9dzsQTpdKN+as71PvMo3LiS36TusdekN8igGDl8ew2dSNVz39O6tCA3xO6YICxY
         ZA1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8DlcCQFxmrJxxcJmIBt+/xWMEMhwDAaIjaOxPQvs/hQ=;
        b=JfKiHtH+QgRWzI4MX61wiKGWGYjJGrQyPDvrmHzUxSqXeienQOHhJRNdJ3q0msnWib
         i74C+g48ClSssOZMW+YTYAud40/8ie5awHGm1KpyV581CWSbZCVBB4yal+OfEBt1nrKl
         0y/Nb9QieEaV5Qf3KbSx+P9sw0XMsSRjBGdDeeSTRNsHHvvbt3zPuWAbPG+9yFMUIoyU
         9IwVGWeYgCbJyWOrCSSoGfez49mELbzzHqbBr8z+1W5U6mSvF9x3QbXqjMDxU+onZxqA
         3zEBFaEGCfVErhG2J7CFT74NrjmkwOGSgGZisY3CJvk1EIojUPAGFBebUi+36+Mnakd8
         DXDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=knID+nK1;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8DlcCQFxmrJxxcJmIBt+/xWMEMhwDAaIjaOxPQvs/hQ=;
        b=hwHljXI8hnqGbrtxtcUOOxdZyzS8DTCOF5UPBENay556hGFkSGFpFy+JLmpqwjIzgS
         dgQAY+DPvu5Z4Gk8lkxVlokIom/In9itP+nyLmdI21d+7rzhHfGMX43JnNRtkrLHcIao
         rKIOSvxTMi55dpIIyZH0n5yVLbt9i4QX1AXQtQvS80lyWGj95CpIsgnOK4wqq4izuOFO
         CsVZBMQFxTT/gzNW66+3wcIl6pkFq7E3oXSvBaLj473mzPUF7YmnCEhgRRTh47ZfXged
         BcESPbYkOiG7exgyQaECv1PsPbbXnMVLi2CBJDEBR65Pdr87M1MmrUKv92KIvqNkoS71
         6v5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8DlcCQFxmrJxxcJmIBt+/xWMEMhwDAaIjaOxPQvs/hQ=;
        b=PnL2IdR7nDtBZi94zWEvYIltjtfF7wheY35qpvFEPes7XP3dba17aJM2cgS0/k/92A
         qeE8QGuqzsY6Yjrs05Knl1ALe0w4sTh0y7UImQAlFciyO1XgHZZ0Pkl2LuGKKZn+Y0zU
         +DxNftMpWrZvw55SPDhDMuUAmydrI85uzui9f5Ohd3R46zWi/FAsqoV9H5E1VkaGEvJB
         gzKSvPzIcSuFjdfO/1gxfdODMJedeu1G98fcW1rNJYy88la1tRF+RX8UFuFO3VU5oAnC
         MuED80uUoo4OA89osybrN2+LPJVWqaR8bWBV86I/F61Eqh9lY5LZoTTiVttIkLv1xYTB
         qodg==
X-Gm-Message-State: APjAAAVHnB+LcfI97g7/LfsT7rJpREcQ8uvy/FuziPgfitmvRT5Mf5Sn
	WLaLRi6LQITcDvq9OoftEvI=
X-Google-Smtp-Source: APXvYqxl467Jyw27e7rSuMmQp7PXiJb+qVWkHj6qJ5C5aYSE5eaAGZ9jjQm//tDG80aZPahQcs8+6Q==
X-Received: by 2002:a1f:4104:: with SMTP id o4mr10334176vka.80.1578912501288;
        Mon, 13 Jan 2020 02:48:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9f:2883:: with SMTP id d3ls632661uad.6.gmail; Mon, 13 Jan
 2020 02:48:20 -0800 (PST)
X-Received: by 2002:ab0:245a:: with SMTP id g26mr6565558uan.17.1578912500830;
        Mon, 13 Jan 2020 02:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578912500; cv=none;
        d=google.com; s=arc-20160816;
        b=l1xroXInm4nJOJU+UNrGMdGDGV0A5JbI5TjX4rB6f96KV4hL+kCw3Xe7FKGN9fg6cH
         unB3znSLL3tmhzkOKu/1wi9+/OSMo0tHb7HW7929cPGiqPQvT9GtGTJUwL09zE/nAIau
         WWnGWwdflnLigxiPDRXA3PDyj2q91pkmYQzkoKoVGJoQQhx6uNSBlzUAlX4oyXaeHeM+
         pyVoqYuTjL5q8MhY2GNH7hYYGgCsZtj7T7LStRujNvt1ICttAjtY8dDOXNIBPxKe7jGt
         V7PUAV+zRll50OOE6p+LsnDbXxT93D4tv6HG442WoWSf0xcl0nSuqlWqU5mybv8bON72
         a/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AVm3he02O3VNSHc6UAGhR81KcdHCnV0paBFA/u9UFL4=;
        b=BAyllisSeLVfhq1aoUTO/6YfYibDWZdYP79rrG3Vxg7LPNX9v7al26HVkL7/h98DjP
         GD81AZmQhylO/4QVEXKKTW6Der4ROrieF12OrGGrSgrSjJO9E14cO9IiqdeJ+kch2sWV
         rbpL0VqCft94rHdq1DvyEEKQtsjc2rIJ1PLKz4UhbVbGn4M3FwGQhZvw0pJ/qYhE/4RS
         873o9u4CmaXCCqp4QWvugFpnaDScchRU5HJItyMb4/Sjf3XnrmKg6BEon4aZiqkJXQH+
         BkEWN1Av5zAJZg/nqjIKSdouG88bZ8WeqZ2x5dlgqMrYuTh1JgPH7dD6V8aRWupZxAIE
         F9ng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=knID+nK1;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id o19si534941vka.4.2020.01.13.02.48.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:48:20 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DAmKMl043940;
	Mon, 13 Jan 2020 04:48:20 -0600
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DAmKua001721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2020 04:48:20 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 04:48:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 04:48:19 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DAm9ML011219;
	Mon, 13 Jan 2020 04:48:18 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 5/5] configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU
Date: Mon, 13 Jan 2020 16:16:47 +0530
Message-ID: <20200113104647.25884-6-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113104647.25884-1-nikhil.nd@ti.com>
References: <20200113104647.25884-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=knID+nK1;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Add stream_ids for peripherals which are behind IOMMU instances.
PVU and SMMU-V3 sets up memory mapping for all of these contexts
for correct 2nd stage translation.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c |  7 +++++++
 configs/arm64/k3-j721e-evm.c            | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 177fb2e1..47ad32ea 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -27,6 +27,7 @@ struct {
 	struct jailhouse_memory mem_regions[27];
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
@@ -281,4 +283,9 @@ struct {
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
index ca91636d..4f9755a8 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -22,6 +22,7 @@ struct {
 	struct jailhouse_memory mem_regions[36];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[1];
+	__u32 stream_ids[30];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -87,6 +88,7 @@ struct {
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200113104647.25884-6-nikhil.nd%40ti.com.
