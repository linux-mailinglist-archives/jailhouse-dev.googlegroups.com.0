Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBNPVU7YAKGQEQGC6E6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7482A12D041
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 14:25:10 +0100 (CET)
Received: by mail-oi1-x23f.google.com with SMTP id c73sf9614852oig.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 05:25:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577712309; cv=pass;
        d=google.com; s=arc-20160816;
        b=dpZQB95ygWZ02pJCA/t9VZKg4AzhjFNmfksY5ieKrPFnCNBID0+fmTotb/J9GBwln0
         bMGXARAaoXqvKlgpSlsMLVVBIVelEAxNiuUJ/KpTzziEEjAcoAFEUPL5D4xszQn3vc6T
         hwCODtGyOVjMP0pQSmUFwXa+QgasPFCBcRSb7gFTeDo5yQFRCNDyOFkFuc1aV7jt4eZc
         98ForhEyIJi/s1eBof+k7xghhWbTcQGCSvgeVckYTn+8WX2KmJBZx6m+ap3n57xtV3Lm
         g1k9PKvO8bQYwI5pjUJEIYJVLv/xmZn2L+/9z0Ilscv4/fJ4HN1o3INYimwM1Y0PknRi
         xJ5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9WbvixDfLQFfNpzVpmJVBbf/IP4Z61iXRewaYAuoD04=;
        b=oGaX+YzUfbFQ1DkQPQPFww9/HR+HKx9BO/0OLZLbngy0ttjrUZQwxdZtmEnu2zViJv
         ZgJa04eMkV7xTSA8MkTlh97M18aKOm1stLXvkkyXn50RySQPeAJZX0gbBcJ+z3Hn45Ir
         AoD1nbiFG++ghXJh9hPNLdPHqX3KnszyGoH7fvMx7+Nd0FYZdc55UI+iQnDe2wmYggHo
         /7CkPdTt35BlMROTA5N5Crol23/CtXRNfEhAyn5GCIU/uB+HhRKwO1TxPZH9Ym9tNxiM
         UTtIpIXHqEiBVbx/9p5bQBE5tNkcixp4FI/wXlzB0wkD28iDhhMVTJkqB9HHItT0XwAF
         rZsw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ryyrKQ9s;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9WbvixDfLQFfNpzVpmJVBbf/IP4Z61iXRewaYAuoD04=;
        b=kFolWhi4WStnCnVa4gaiAKQsl5r84GfjZGn9BSx+4N4iF0vpf+DBY3InOWV7YA7iD8
         XF7oB8ITCHlszl4X1XVe1CNYeK+zInLceoC030KUtU/sl69+0jR5N8j4m1epx9JJupBk
         6cg7WH2/nTExJ33Dr/MPxjq0hLPofR17PAL0pTtCnu5x/+tcdJQ+SqkPlVCaI2zXBsyJ
         VYUkjAZKIwcdFwUluDqv7YG+g7LWNHwIetSILmjeTQMQFsEA9OraKrvzkIaVR0QK/yg1
         iK9ic+rFy5B9BTiLGsaIq+qX3YJsSDgI89bh+aLQPc0q7Im2n2pvqxhgk7TQRUJQhTQ7
         6Myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9WbvixDfLQFfNpzVpmJVBbf/IP4Z61iXRewaYAuoD04=;
        b=o461Ml7DJyiaibXlOvFkscaprgkhalaJeC4WCiItZ4Xg+e0d5IkOcmsr/LwLNP7mmy
         1yFNKsgJM4CNyiDUNOUCXNRtCUdZHrLxY7a9GsnmRITBDtOQe9cX3h5v/G+MaKZxY72o
         Cg4A0V63t/7lUvPa6xzc8YZB90PmFIcMj0K/0uiCLnijaH+MyIcdTuiedtQRRaoBb70W
         uRY8chkz7KykfDb/d15kTH3EMxXkw6mtj+0DqqVuILvI9gTo9CEX6/p5G4xwc7M3tx/K
         dLgtovQwMacOPphtWMHBhYxbl2fpm4dkwkFzB4Nw47OH3CdltBNLjX5rN7KdKgn2WRoG
         D7fw==
X-Gm-Message-State: APjAAAV/HZSp9tZPFYLEHeW5Fhs5Cp7yV2CjNWPa+anwTTvbY6Zy93vE
	CkkmgQ0YSc3jA6IoPkjHRwk=
X-Google-Smtp-Source: APXvYqz4rOU/Cy354PJWC5DmLk85MmsD3SmakN1IRvysO+oeW2hu3kTYcUQxZCF2Zp6hQx8/VBVeIQ==
X-Received: by 2002:aca:cf50:: with SMTP id f77mr5452101oig.60.1577712309296;
        Mon, 30 Dec 2019 05:25:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4a8f:: with SMTP id i15ls10399526otf.15.gmail; Mon, 30
 Dec 2019 05:25:09 -0800 (PST)
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr76749948oto.248.1577712309000;
        Mon, 30 Dec 2019 05:25:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577712308; cv=none;
        d=google.com; s=arc-20160816;
        b=TFnncHuBXa/As8LBJbfpQc1Du+gpRoTsdI8GIlrJfSsZLOxVQVdoiXwkKSWPc3DiXY
         4PJ2UG3dcfb9cXDdqzCTi+XE/RFxBm3xbpyVtS6Wn6L3+WnSCpXgvWilHDGuNzyTI1Ym
         ZxkGM7pTNysrB1I7DInNAyMbTsc++ME/CY/2TJLpvxjSPPRI2WasjzzQrLO8VwpSeoJG
         Rtwyk20fikBytyLKQa73rGqiR83ho1T1WMGSeZryuXWVv6wWb/j24IaLhwhB6ZmNBl9Z
         yqYDqTIeq5slFz86qeavj2Up+UvKQLVfsx6FpCI5ko2rNatgNt6LfgkdjRQv6UV/vI8a
         EE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ob+oMj1LsQavlCuKbx4OUfMnH7M7C7Nl5SAFd47PUWI=;
        b=qYEm84Hg8z+H19bQXt5hQ1Hkuj4DshpKL58U0TOlH6ydCtM1RkhA/ZSzMx8i+SAhqh
         LA1xO6kGtJFW+CogA1DGl5bmj3qnALTfHegjTNFzT2pBlkM1yZmHXxQzBG0Nw+zy9PX8
         RriQLOBlFLeN2y2dOjHKWqUsTM/YWf1Px25r6+pRj/iWucJKBCw+lBaVqWLL3qhqMhOx
         4zUvP3tbMOTwu3qMqeciVo+POyCVMMB/Jx6pY+YmUO2B2HNv8IrgSAWumI8eTlIk/X0h
         vCZx55qv/G/vZC0oEtClFptiR15p1B1ptxf4e6LPGwABbMnB/2Tt9y8JBHdtDSjnvZnF
         CgLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ryyrKQ9s;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id w63si1551519oif.2.2019.12.30.05.25.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Dec 2019 05:25:08 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP8XP086003;
	Mon, 30 Dec 2019 07:25:08 -0600
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBUDP8QT041849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Dec 2019 07:25:08 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 07:25:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 07:25:08 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP0oc120516;
	Mon, 30 Dec 2019 07:25:06 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v1 3/4] configs: arm64: k3-j721e-evm: Describe PVU IOMMU devices in platform_data
Date: Mon, 30 Dec 2019 18:54:05 +0530
Message-ID: <20191230132406.19985-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230132406.19985-1-nikhil.nd@ti.com>
References: <20191230132406.19985-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ryyrKQ9s;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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

J721e device has 3 instance of PVU which can be used as IOMMU.
Each PVU has a config region and a TLB region where the memory
mapping information is stored.
Describe these as part of the root cell's platform_data.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index ff6dcff4..8fb4773b 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -50,6 +50,30 @@ struct {
 				.gicr_base = 0x01900000,
 				.maintenance_irq = 25,
 			},
+			.arm.iommu_units= {
+				{
+					.type		= JAILHOUSE_IOMMU_PVU,
+					.base		= 0x30f80000,
+					.size		= 0x1000,
+					.tipvu_tlb_base	= 0x36000000,
+					.tipvu_tlb_size	= 0x40000,
+				},
+				{
+					.type		= JAILHOUSE_IOMMU_PVU,
+					.base		= 0x30f81000,
+					.size		= 0x1000,
+					.tipvu_tlb_base	= 0x36040000,
+					.tipvu_tlb_size	= 0x40000,
+				},
+				{
+					.type		= JAILHOUSE_IOMMU_PVU,
+					.base		= 0x30f83000,
+					.size		= 0x1000,
+					.tipvu_tlb_base	= 0x360c0000,
+					.tipvu_tlb_size	= 0x40000,
+				},
+			},
+
 		},
 		.root_cell = {
 			.name = "k3-j721e-evm",
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191230132406.19985-4-nikhil.nd%40ti.com.
