Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBDHU23YAKGQEXLVAPSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF4E134012
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:16:31 +0100 (CET)
Received: by mail-ot1-x33b.google.com with SMTP id z13sf1503546otp.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:16:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482189; cv=pass;
        d=google.com; s=arc-20160816;
        b=WyD7lAztNQ3qyesRsGIbCbGaYj5a4t3sP7zhmYt0mCjsw4b82g8Sw14IioxHhMuEb6
         VnDJATxDfoA2u2GBNONYcHDXXCM6bdDxDFt8ohB0qRiqqd8OlQmx+ceWdKiZabFSOSZU
         bMQuyiyjqIWsXRfocAg5+sz8tLokiwz81H682JkPGY+GaU275BRLok/+FuxDg776yMjl
         k+evgJjbBoRvMw/4mqOzxtOs3CtsEEnS46Z8WNOyfsLRonOazMSH91M1Bhk64GZDXnFu
         PyP3BhQ017l3nk1jN9Xhjr+hm09BDsYyuem6KoLoDAwnFcQg+0J01fSY19uaw1FkXcLz
         FwIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QyyHeWbXKiF12b07Zq9YlaMXLQKGS9MdGGVCEu8YKAA=;
        b=KsRiW1l+XsT//U3LUx2iespJo7g5Kc+VzlReE1T02OPvijDQ11C20muyaU/pFrYjea
         CW0/jC1uzmeu7GgBGdCIqF/uxKJKIJCserKFy68a2j84egj+S6HW7bJGvL5PsIPfbUv0
         Mq/IBBSKDoXeGaMYnBJyyP+N5WVekg9YeVyqsrhPB7BUzcbkKWZHnh9qDJvpQKBamusi
         eBCOeRelCNygImD+a7ZkXih7DlHNWn9Ie8PlspAegnuyhcOM1sLVtVW2BsMj29IRi/se
         fROS2wVr23HSInxGmdSJy9h5VqV1VJ6eNroTkpURHM+ZGT/z7/48Cc0It4tQCwFRHq87
         r0dg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yHTkYmpZ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QyyHeWbXKiF12b07Zq9YlaMXLQKGS9MdGGVCEu8YKAA=;
        b=q4lPCOQrbroTvtYtYgMdP7UuF0m+ca7Pf8UjxeQYEMMxRMEQ99egg8ubhjeUUoOHFG
         lg4NCz8B/6PogFMKhNY/EVUB1KWicMj0ESbvV9FiDob7ZjMOhKgUlFteaPBdqvuy84tp
         wgV717z3JwyuPDcqPa7rS7t64HVk893xk7jlGmPmREkIvBtxDg0NBoKec2LfxiTkTFyJ
         idrNbwFccZhms4kSJph7h44qPdinzgjGiFze5AsXQy4k8jIV+IPNpsClIdBa9CAuzBkg
         /XZscY0v+9ML/gMbsdS0irtiJbMFtgXP6A+7PxuZIayZVNgwu+D3sDm2xZaplhkF4JKU
         D4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QyyHeWbXKiF12b07Zq9YlaMXLQKGS9MdGGVCEu8YKAA=;
        b=t87Ixtngrl518VksOeh4Kqi9VlZsngElh3sntGVR7NJeG8SObRwdkuFrupIcvnBpte
         RZIdAU/aTFoTR1w9NcqKe17FfqQGu0fgA+Az54a4KJ8Rs3Sa6oaV6n1jdfdC9djrQ8Ln
         sKEY+KxBs5p3EnhcyeJLmODEAaau2JHdbC7g/y5vhfubHkOnTe/H1oT6dLreQxdz/21A
         187mpSKUe16KjOdT1RrF94TMJryXq+BQhwEggCnCQwtfdS0Zt5tDBnTUzH5WUryLKA6S
         Ts8cEaE4of0nXd+60pIPqi2fQuZV3j0b1hMdwIA4VfTeml8O//Y0a/GYntdRNRU6/uHR
         BSmw==
X-Gm-Message-State: APjAAAWxouXcNLWql/g7WmR7+bmTr+eGXRZH+wYEk/VSj9UOfPZCTE4Z
	aTSpcftm0a0KJlvIhhBl6n0=
X-Google-Smtp-Source: APXvYqxjmX/vclXX7B4q64wOyT+/M0cBSLGAzHr6+f7mPGL3Ai6/IKytegEXlpjxiy/nlYBj7XR4XA==
X-Received: by 2002:a05:6808:8cd:: with SMTP id k13mr2771683oij.4.1578482189241;
        Wed, 08 Jan 2020 03:16:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:a81:: with SMTP id q1ls477109oij.12.gmail; Wed, 08
 Jan 2020 03:16:28 -0800 (PST)
X-Received: by 2002:aca:1309:: with SMTP id e9mr2593759oii.7.1578482188680;
        Wed, 08 Jan 2020 03:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482188; cv=none;
        d=google.com; s=arc-20160816;
        b=i5AX1jeCDXXeTEXb8mOxUhmDb3xex09NQNXMxfUhc4QjdV0XGMVFrDsGER1/J5jZQC
         H+YLLJhxYX8DNIV5PDMvOIe67M22RjAxot0gqxkflTZ5u2D+owpTrj90T13++jQt5VnZ
         KLsdWl7pZZ6714MhXtPs3SPaId9mO78IQ0mZ1PCW2XD/H8qqADoddQulC80Y056BKt89
         30MXdAwtqokzzU+1stc+r9h3Lx3uX8s9/P2GSmZ8cCScGzCCHvag11MxKYmGKAkKk5ui
         9D8vq8qN6CPcFgClp+u8dCwUgDLNibf+7F++zwP8t+AQzLcCUwXnke8uVgp2Xc3xm8zr
         BC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R8R6hT9MaSw6V0nAT64KN5EZNZB6l1ga6YyssvOytxM=;
        b=RUlZ/67W0xP76kbGPE8yctSd9bWbpzvQGcN0zO33bqlObR75iLQH+OUHbpApd4EehM
         LMG848YiZ3Z8Xdy3R+jv2K3G+1G0aUQYmm6biHqYlShGogeEyF8EWVbgYA0pzL4lx/c9
         8Moo3zTrl5SR1fK3TX2fLnjrtavg7jUSPMg6jNLaLksCCZJ+ZNbyJyq2bctGaIj+Bo7t
         4KxkIIYVSL9Ak2IfIjJumdSoBM+TGoHrVVKIiblo84eQP7JpP1nXLCeINVvlMJvJwV/5
         PbR+7igdjNjla0+PeDabBs2q8tUZ2vJRdmzemt/fK+Wrbii08+M23gFxP2r9sSNq8V9s
         iPLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yHTkYmpZ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id q188si150578oic.5.2020.01.08.03.16.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:16:28 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BGSSt125190;
	Wed, 8 Jan 2020 05:16:28 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BGSIo028436;
	Wed, 8 Jan 2020 05:16:28 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:16:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:16:28 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BG8Bm031463;
	Wed, 8 Jan 2020 05:16:26 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 3/3] configs: arm64: k3-j721e-evm: Add SMMUv3 IOMMU in platform_data
Date: Wed, 8 Jan 2020 16:45:12 +0530
Message-ID: <20200108111512.9844-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108111512.9844-1-nikhil.nd@ti.com>
References: <20200108111512.9844-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=yHTkYmpZ;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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

J721e has a single ARM System MMU version3 for 2 stage
address translation of DMA requests from different peripherals.
Add this as iommu unit in the k3-j721e root cell configuration.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 17ffb0f4..1de90416 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -50,6 +50,13 @@ struct {
 				.gicr_base = 0x01900000,
 				.maintenance_irq = 25,
 			},
+			.arm.iommu_units= {
+				{
+					.type = JAILHOUSE_IOMMU_SMMUV3,
+					.base = 0x36600000,
+					.size = 0x100000,
+				},
+			},
 		},
 		.root_cell = {
 			.name = "k3-j721e-evm",
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111512.9844-3-nikhil.nd%40ti.com.
