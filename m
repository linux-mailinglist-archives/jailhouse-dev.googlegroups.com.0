Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBSPV23YAKGQEGTPCH7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EDC134035
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:19:38 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id d1sf1718132qkk.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:19:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482377; cv=pass;
        d=google.com; s=arc-20160816;
        b=DsCY7LQ1bZPbyDIDdjz+QfwKv3+OzFHb4/j0D+vOpCNn9rKLq1ZWbxo/yHkE1Peu/W
         8ip0rDukt80KCwG9stau3TV3tN2qgA3RwP/OL4jwogzy1Ib0Cy6qcYZaC48RWQ4L8Iq0
         14MaywxnhRjvypF6hpa4okbPFT6tXZHilqsn9LbXSK7KpiBNoz3nzEJXIs/5/ZehOvOP
         b0j0iYKnYvleIIsNk3GJUJX2iQ197CCFHsD9BcNNpmtOKh4pDXke11il62OSpTPe9YOw
         /AE4S2wDuiSNdkXTud7RixYkNwB+0JGyqTOLQ4HKdLzRGYepesZQ1kB2OmdXOMVOLXTl
         UVJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8yuZnHfxMPY+825+P21HyzFqioTrnANduRiXX3b7iHw=;
        b=airqUceXITqPdszKSonmb6zi58aGMpnBZqToIpA7UGhzgd+gxDx20IfULGx64mGcl9
         ZxI5qyNx4i3iw6XIbb+/Vm83pp5Af1iLFAXDwgQVxGJOogW1cg4vG3VmvJKi2EEg/DkM
         GaXttGdP7gIAzjqyUPxBFHlSCzI/QLj80en2t1//t2qoa2Ewu/mK/NJcQj7Uhe56hV59
         nUkQe7bbzOW5rc3p1gEwdeK8ZxKSwQSia1YpoJP/v9gEJWQ184hyRfrpicGHDCVENheL
         ZRn9wIjomcxc6Ax48XxGpn9u6QjGyv/Ql8+Ciyw0oT7gE7N6n3eXtzeTmp8W8k8AUv5j
         mWfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cYTqzbMn;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8yuZnHfxMPY+825+P21HyzFqioTrnANduRiXX3b7iHw=;
        b=nvj2h/Bvcw80AU6XYglLjhn8Opt3S6QyyRiVHTtKq64uNqf8UA1NUXt0Um8uJwWfje
         KvxN21aWQjgf0z12HgQCJc9PWc2XkbOaI6RlS/IhGs6P7YLDXnaofDWhOzehDrMdxdfW
         50VQKMkcuuijUuEU9UtHeZUGe0DohnEq3B19rmxyfPFQBJbtyErp+h1MqbbGQLKuUCYF
         kvWWwARquAsCaFmY/cNOIqNx6CiDjCffCKfVV40GcfpEbd0TSjHGCM3V3qR4Njbr/k+r
         ZzVlSitDX2/25A2eY0Z4eiF1lLlOki3mR5JdyXL0kNsu5/xU/zLBFKBusoikhtRXNxTU
         A6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8yuZnHfxMPY+825+P21HyzFqioTrnANduRiXX3b7iHw=;
        b=YnKwqpeFUOupTtJN2MR6IYKtofoqP1aYS4HBaGUAswbttJLWdWG39bKCN1wOatM+2A
         VweeiA850xR/2Y5VIT71KeBlbcCnZGjbR9ViFT4Cgfy8kaTW0vEY0P7Vq/jmtG0h8hMO
         /E1gw8cfzdtlttLcpiH3Zouw+06HqdEvmsCfYOqz3JrsSqWOpWx+p5EzMQ3LzbUnSTkK
         XqaNyZA+hMjFCY1MByAReAgGo0Ae10ziyxksovwYAFCFE3CNQ2ow6QfDaJKrT8e48DhQ
         DwPB7f4p23KAWXW0psXGBGqjvLbAWNc3Q9LLvgHhF5NKFc+vYH2h0ZGT98shKSeNeBpw
         GQSA==
X-Gm-Message-State: APjAAAXPCEOlYfUil5unR8/L2aiu104zN9is7fO5p9BBb6WGmlCvOebG
	RJcHoW3GYwIX5vKr0kZB0uY=
X-Google-Smtp-Source: APXvYqz+gOtUmECRZPT8LCLucPcn8nzONX5QLOfLpjGW/iJzRdEIJlPkr4egB1CORN3ntHESmsZkUg==
X-Received: by 2002:a37:4f8d:: with SMTP id d135mr3756738qkb.455.1578482377559;
        Wed, 08 Jan 2020 03:19:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:350c:: with SMTP id y12ls845359qtb.10.gmail; Wed, 08 Jan
 2020 03:19:37 -0800 (PST)
X-Received: by 2002:aed:20c3:: with SMTP id 61mr3078924qtb.392.1578482377097;
        Wed, 08 Jan 2020 03:19:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482377; cv=none;
        d=google.com; s=arc-20160816;
        b=SsdpR3DCtvK4A9kflswKS5aCsTdIZNTgUsmimIwtuF3AX26OBS4WU5PMi7SHhS8zgH
         4rsozSSaZttWrxiEQVnPUqRILa1AqttSkXdDz7LXccFq0uHhhlz7UPmAudJml7Tl64lD
         JRzzdo1EcuUis2zDkrhNkJ7/GtCB39Go7aBco+cKwKK+w+4GZ/ww2ZnRBDIOXZ/ZJGrv
         r43mGuuwuebFcGoa+cV7ZvvqnsQFxJoaXgcftqPqVfzK1aZmC7qQyvEFe2E+TU6Z2gmK
         FzpZY9vUg9nn41SFl/+3gC/6ioJUZkyGcygaD6nGOxWxCW24bDKgop23ereQUvSDox0x
         3oTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UqxODcrrUp6B7p6KCvu6lzbIooY7Imo1f6tq4holpaU=;
        b=h/60EkFMr6Wcf/soTsdHwl3cphE24a/nCgQkITRsh8+Ao6nZAt7+bjr1F9YWkQlFHW
         WNOnjkkEESHkdidbrxJq57NGqQSIS239poMq3dwqy6g/IVMOrOVkydk0mpXXiUKX/tN7
         3dTKcX5Rxxwa3I5FfNRuNPRpsxNmhV0Aeb8crcLh8eJ6moCir/D4Dya8KjyUcDLulTzj
         TUh2pmMccD5xmG3ZXTOBCLkZvkC/I4y1xqmPVnJX62bZjwA8Q++ACsAxCj8MauFdq8ft
         H2j4h0iva998285ynB/VN6XZwcu8xN3e9nKYW26mvBAzd1v/zpu4IWufhj4eQ1foDXz2
         R8VQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cYTqzbMn;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id y2si114788qtj.5.2020.01.08.03.19.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:19:37 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BJaqT104372;
	Wed, 8 Jan 2020 05:19:36 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008BJam7115739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2020 05:19:36 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:19:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:19:36 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BJPDv021746;
	Wed, 8 Jan 2020 05:19:34 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 5/5] configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU
Date: Wed, 8 Jan 2020 16:48:25 +0530
Message-ID: <20200108111825.14280-6-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108111825.14280-1-nikhil.nd@ti.com>
References: <20200108111825.14280-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=cYTqzbMn;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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
index 825883c8..f1c99415 100644
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111825.14280-6-nikhil.nd%40ti.com.
