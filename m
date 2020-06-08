Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBC5J7D3AKGQE4FQGYBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x638.google.com (mail-pl1-x638.google.com [IPv6:2607:f8b0:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C56D1F16C8
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:35:57 +0200 (CEST)
Received: by mail-pl1-x638.google.com with SMTP id o1sf11931950plk.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:35:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612556; cv=pass;
        d=google.com; s=arc-20160816;
        b=1GMVetv706z56IGM6eRRq/0825sA8LRJnkFQsIn88w5R6NsNpGH7wXhh7SO+9qh2W5
         H8BxVcPpvUYNt9xE5k0RPHw4kxLp10raZhODYjezu7Dj7RiygPRtCLlnLakpdEY1JFLp
         OhUeT9UReWYMrzNw+TU/d88nQqFjOoJUPJ77+7XbXEehqJBqzb3W3a2r6Rl3I0Tb1FLL
         PcpTsraRCAEa4eNOGWWjk/OQwELUXktPuiLyT8oz839ROiFKeF4QaNGLTsxE9WnE+f17
         4vANyrQN7dOA2FMXy4Y9J3XWZvzhlKb+tmSCXuQu7+iU/cVSHfpAe43mRku6bJr8Q7S9
         he/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Uqw6v9pvjiPMpf69CBxriDgTlcGsHL19cdV4PfTDqLY=;
        b=y9qhfwfX5UcOCorbYG7Uqs93nJBUiyrXXocZUYFjaF1mBDNgtueNcSIB1xysQ/nXH0
         Qvsh9EnY+hCiVPOTiS2wdMDWaZaa433IieW6GWAMGEjNWl57QicmFtRd7dwo4F+4m7tC
         SeKEWXHtygIaKdbQ2nU+Iw4cfu/trM9HjLwmlzo0XzzEsqGhabY01kgh99Re0Bdw75FT
         jQWuzGnKcHC6H3hWvsE1kTKbgWVOvMwHYI0czwalUUZISax+Vtu6H3LXSgwJJcCy8HpJ
         rajDmTKsB660FwW5G5ZMZ8iVT/AyVF/Pc16nqm7rO+zgakhWzngpL8nesX1S2dg8vkmn
         rs3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qOq7VluO;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Uqw6v9pvjiPMpf69CBxriDgTlcGsHL19cdV4PfTDqLY=;
        b=FRnhmMZ0zyJJDeNXm4a7JvtG6cfehzmH4HQ40AT7a1vQE2WvzFFBGaxXsHu6QKaDig
         +JQZsCjmvKWY/966GLMIbvvLpIhFHjUsDhdR5sutbXcVjqGpCm0Y/2IeKnXa02cdDhCW
         S9PgU9ARwLmcO7lb9zlOlrI26wwRjJPwL0qzxqZ7wsKekz8tDSbA65CukuFxEdNt8NQc
         lmz4yRuN1GbBaY5QGaLgRZESZmJ94NUxYV5gZb2wNd4z3RMLYRbxXBnGLQAySzi1igP1
         a++yKKo3eQR35T4x6pRPl0+sGpIX55wG1n8zG09lAXOtMjqdKpuRELETn2nz0kif3n92
         D+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Uqw6v9pvjiPMpf69CBxriDgTlcGsHL19cdV4PfTDqLY=;
        b=YCvmvWJdpC2DIk/k4/i6OevSyrmt/NrTPeUlUmMUVoTiPEfBDfr2r2hJB1XyK1cAPI
         qHOR2+CwN9D8t6yUzXNU9pjuEA8rpr3QAcoKIhqOvvM0wgVjDN96GfQHJOHpJasF7NjG
         R1WHwi2kHrGrE9CkuUKqMSy/Bfdd114tfrfPmiUq8pFapzk7c2DAm2M0VBg392ZEQNWS
         gi4HKI4h6gYPCQ9fh6fGPivPl6Dr5op4EaUyOgi0qzxNxG396nPVKP9kaDqeDtRL9qVQ
         VTjhPd8y8LrwuDeJUNjpYKqTNBFKHmpPPq0Mh4XAm9t+RfPt4ah+pVwD/CBGJANH0N3M
         4mVw==
X-Gm-Message-State: AOAM530xrKQh6xMhdXKYqEZOhkmLwqRsaSDQPANsB1RXdcFlqxa4JIQw
	DuFfckoQXphJBqdAWsfwwok=
X-Google-Smtp-Source: ABdhPJzA3smpbxUj8GJA/ceLm24jQLaS87cdRsVhqK98+oelOEXMacpnkFw4JlsSqw3GRWr8xqAm1Q==
X-Received: by 2002:a62:ac0a:: with SMTP id v10mr21330075pfe.27.1591612555915;
        Mon, 08 Jun 2020 03:35:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:8548:: with SMTP id d8ls6064751plo.11.gmail; Mon, 08
 Jun 2020 03:35:55 -0700 (PDT)
X-Received: by 2002:a17:902:ff18:: with SMTP id f24mr19680193plj.118.1591612555412;
        Mon, 08 Jun 2020 03:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612555; cv=none;
        d=google.com; s=arc-20160816;
        b=N8VwaCJ6T9lkdqqV38BVOjr0TlrZcJEy6uLIY5NH8SHSf+Pmp7P3n2vsrCjpkzi6rR
         ROw2aPHdaD9LZMDspcxp1b4Lelh7tIO3UUkpQtbkr+gSGi+IQlS136xDKf5va6I7M6jy
         BWJaMrM9oFAdp/b9LS7FfFw+U/lKzOYZ3TFB/VzJnoY3eheS5/HUcexPAo6ZdGQvi//q
         TZh5p8xZaQBtO4G38XSYeWTEjOaGAy4TricU1NFVvxzEfY376+0ycIfeyVZ+r1S3eTfT
         s+qKVRiutH3rAxhAobJt1nrmY7QOGnKZKvDf4PdMaIQG/UsM36brtjCDQ2/nkAG6pUt6
         88yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hgXjSBBPkh5NnqgFUNlDIPHBNgPFmq46bUBJIyPVEr8=;
        b=tlGvYtnsNCKu5MYNQIBaZE+Lon0hHGZZNFz51JprPyETraUdP/PGYk3WgoFOeLC+HS
         D+UI8uCIjUa56Lp6gOylHdygTFguUFQ9web+KPajNk2B41ulg8B2gGevHlV2PuhYUo2V
         NSYwmUYU/FduwZPhRhu1f/lcrx7E2hZo8TGMRlPZmV8kb/TMXau0EiOEVdUEEvhwyS2k
         yUd+8XGnz2BSk388bQiheq6J3ajaHLyZtPyPsn6YxbC4uFgZRhX7EAd4HAXpuYxNT+A2
         dvBqqS9qUUR5A1Cn2DDfUCAEUaEaTsWZ5Yr4aBmwkLsKTENH+69OvUazF+AlIRqAuiW3
         uKPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qOq7VluO;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id w15si1059677pjn.0.2020.06.08.03.35.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:35:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058AZsvb083538;
	Mon, 8 Jun 2020 05:35:54 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058AZsNx130131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:35:54 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:35:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:35:54 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058AZnoT122340;
	Mon, 8 Jun 2020 05:35:53 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 2/3] configs: k3-j721e-evm-linux-demo: Add USB mem_regions
Date: Mon, 8 Jun 2020 16:05:47 +0530
Message-ID: <20200608103548.9040-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608103548.9040-1-nikhil.nd@ti.com>
References: <20200608103548.9040-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=qOq7VluO;       spf=pass
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

Define the jailhouse_memory regions for the USB toplevel MMRs
This fixes the crash when inmate cell tries to
access the USB devices.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index f494b0cb..4a5aa3d9 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[25];
+	struct jailhouse_memory mem_regions[27];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[2];
@@ -86,6 +86,20 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
+		/* usbss1 */ {
+			.phys_start = 0x04114000,
+			.virt_start = 0x04114000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usbss1 */ {
+			.phys_start = 0x06400000,
+			.virt_start = 0x06400000,
+			.size = 0x00030000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 		/* main_gpio2 */ {
 			.phys_start = 0x00610000,
 			.virt_start = 0x00610000,
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608103548.9040-3-nikhil.nd%40ti.com.
