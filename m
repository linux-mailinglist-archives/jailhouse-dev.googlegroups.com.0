Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBONX5D5QKGQEH2JVOHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id DA229282CAB
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:09 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id f11sf934793wro.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838009; cv=pass;
        d=google.com; s=arc-20160816;
        b=qJ8Hu2wjBTHsMS6c/2M8vZoZo3dUUw0okLRaxmN9FgJ80PXEI+cvbwB/d93YEPxkdX
         sKaKTR3nDnlE5eGLPjXHGhAHnt8jQdWl8Pxen9rIR7/ISMePcO81QziDrttRGZULghAS
         WWRhelYwVQ2meySNvUW1DQ69ftMm3fmaYxW66rb35rJVsHrr1wZMC0DycmADorFtaJDF
         PQ00HX+4AOUMhScR1QmG81tDexTLcnFCglg2ICHO0RudbbNZdZ0lQzMvCGZHI+fma++V
         MPS7SUJoexdCMEwjvlfx0KvVwO8ikw+Vml/0QYHxfPeD++LBFgTNjME6LttkK+6HJbUi
         47WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=O2Hg6+G6aAtxST5NDHGvnWQNKjxi0sDu+l+wDNOW0Pk=;
        b=zoTV2dQNtv6SMnyfM6w/VGqa/BwPdpOj/U8X04TDVckHdUAnvtv8l9+3ZUrc+LkAgB
         uFZqzShjcoBkt1EGUlMlIgs2WHYUubHfXjmv8YMSDj5pGdsDm/AZSI5DEOMegepVSaCd
         NdHBRpXrmMU/pIOdZSkS26FoNy8QUl29PNpDZ5YBY/hiP2hDbzCZB5BzjWg85+1x3pvf
         Mia5DUhcqTy3y3ikOm/ap59oeI4DPGTCT0mBa75Fcys5gS/D98PIWvFogwE1CH7S4O83
         dSF+IN/QWnKazgyQHe77sFwlpASrsVE5XAdPiEC66pc4cGf8R7eEKJafoG8yLBaoVZ0B
         bvrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O2Hg6+G6aAtxST5NDHGvnWQNKjxi0sDu+l+wDNOW0Pk=;
        b=EFSka2Dvo2LPyT4mQ/k4BboxkU8WNycuNb59YBjVCc+9opIno0oSm7CPJzbw6+B6qt
         7+DMEF+MdkINq0dL0Imz7AwhhB5Cy4m+8S+VCGJfbnsCCVji3s9XqSaO3Gpinsz9E3Z6
         4oLVsEvecUX/rkrgRsAEqlN+GithFhVh3bA5sZjaGfxprbJgX5h+19dRUuipfpJcYVZe
         DbPaRB42/vcGRPM5chdo2NTI+97NpgxPBE91t9iDWRy6KDPoJw/yKvmZ9N6zoIei5XTW
         Cb87SXzTYV3FAWzsqHwiLVT1PDFgBIEPEfG3acDcAgWMoKRSfKvWVsfVuBdRV7JOC0SC
         jgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O2Hg6+G6aAtxST5NDHGvnWQNKjxi0sDu+l+wDNOW0Pk=;
        b=EE/mvE+S3cHKwKx8wnPB+GI3yB47SJ7PstCzq+KMuXHhlsg3ISM45qFpkt8sMfsJZc
         zQmqbJoqYXTGDkjECwzB0Y2OZOlrUjDgeTIf3p8Zk81IH/5AtGKDs7pXLWHc1OaCrFJi
         h6BJye4/90vPeOuypEpELqgjGeEhNOExp6lu3IYhWVIKdbf9MTn67UkUJ6Hqe/LxLd8w
         93ZwRFdN3pMEuZV1zMePs+nwTj6JIdjPoDCgpApzJ39/971m7TsSCBTQyrEFZalplm43
         8bGSxKU8Bg2Gnq4fOqQK5DH7H6hG+Ef/iBXAtmGTy8Z0JBda7uB0vT32HsOMOcCxiTo4
         a0dw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532hxLBqkNQRsvouRAkOcLh+4dTcz02OdT/mkN1jZk6jQSx7Ubkd
	jeNJaD53IFfBXYZ0EL+vW/Y=
X-Google-Smtp-Source: ABdhPJxL4QccndD70iWfFt/6/yRsAp+rZSii9OIsyWgK0vLbSfujFg23/KByCujxJ/vbaPvUPdcnXg==
X-Received: by 2002:adf:f552:: with SMTP id j18mr14418541wrp.128.1601838009658;
        Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls5170136wrm.2.gmail; Sun, 04 Oct
 2020 12:00:08 -0700 (PDT)
X-Received: by 2002:adf:c188:: with SMTP id x8mr14618545wre.201.1601838008592;
        Sun, 04 Oct 2020 12:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838008; cv=none;
        d=google.com; s=arc-20160816;
        b=Mf9bS+eDOnd4aJ+Q5mpoWjLiKVYUDOTsN8n04H4cLkexsHO6x2CIQ3Yxra3h7RlfwJ
         tUwjCWX1RR4dvBCXy8lOv6rifZsfJxlwta4Xe35VKuEcZXhDKmpUhyFDP1uPjpdwReku
         1LGQJ/ukrKdrILXB37bJ4BXoQvA3II8FQnSNNVIy6VAw9YXB+bS2ZBus8UCLwtPXnT63
         dnf8wbpAWWHqqJ5ARpUZudVeWO0oNjKCNzASKpSzsrNd76s9VbnJbTQKHIw0XS0EDsMN
         gnWR9SQjvp9HndRFXf4BQD7LXK/gnTUwVEISCCCjq5GOfBLqoSi0c+Xd6/A3ycQCWEic
         jGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=6y00Q0xlhgZC+5AAciMWKPPlLXXqFkycmmQGK4M34e0=;
        b=kmnrkJJvHIv8syweDds9YVKTlf12JFTdbfXD9CXn8ZvECDuwHZl78FhYCYReAy+MQ1
         6mtyb/5qIHSQj52C2eBvQoJnzv5xJkjhm1QT5xh3YbyGnrUTSB0tYCYkGgdRhiGK45E6
         mWcjWyKgbwBZ5Sxy+0jyDJ/R3/jhVwhfRwzckJLYTA/z6RnnRA66sjKxbdhX4M2Y8+XB
         EYgnOwidwhUD7ckSc5++DJYBOm2Dfmjcoj54+dDn7CqiKnAB1X4tLmXsrqwesiKA4i1h
         ajGpdTy5edTjY961RVsEsA+nopMyeaMLwfKvcfqSD5DfScVcGZRAY55+VVd8M6ebLhly
         jgbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id b80si171905wme.1.2020.10.04.12.00.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J08Kh004252
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:08 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060D017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:07 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 01/45] configs: arm64: Add SMMU configuration for Ultra96
Date: Sun,  4 Oct 2020 20:59:22 +0200
Message-Id: <f0c7800586d10a1d53b6cbc5dd515404d4a8994c.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

This only lists the SDIO interfaces for now - more isn't working with
mainline so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/ultra96.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index f917dc34..db65ae01 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -21,6 +21,7 @@ struct {
 	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -41,6 +42,15 @@ struct {
 			.pci_mmconfig_base = 0xfc000000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
+
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_ARM_MMU500,
+					.base = 0xfd800000,
+					.size = 0x20000,
+				},
+			},
+
 			.arm = {
 				.gic_version = 2,
 				.gicd_base = 0xf9010000,
@@ -57,6 +67,7 @@ struct {
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 
 			.vpci_irq_base = 136-32,
 		},
@@ -148,4 +159,8 @@ struct {
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
+
+	.stream_ids = {
+		0x870, 0x871
+	},
 };
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f0c7800586d10a1d53b6cbc5dd515404d4a8994c.1601838005.git.jan.kiszka%40siemens.com.
