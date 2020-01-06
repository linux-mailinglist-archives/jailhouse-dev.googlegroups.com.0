Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5WLZTYAKGQEFBAVYOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBBB131206
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:06 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id t4sf2783707wmf.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313206; cv=pass;
        d=google.com; s=arc-20160816;
        b=bIBJZWQqS6tOVin8eb1KyWDVYx9sIIlpHKgtOBd9WSuef0izbvZ775qNBfMoWBopnr
         Ptx4PnlKZHAfrPc+WqwoLGPAfhBPb1BpOALPJcCXC/XuRvGO74OX+Vwa/CwGnbeI4eWK
         +9Wy0KxaiYxzQXGhRpPHX2YiGyMVjR5/BrmrV8kjr7D6j1k8CLvJH7DQhKXjbU30R/XR
         V1448/Pd6BSeyzSLc0GdTuSMaSHTy1oVDpPrP2SX26dROjGkxwU9jaQgPcWL3zMQej6z
         W/LwWQ3jttRqh4/nuk0f/ciYFhVY6wH/mYzVB6qP+lG/WDhOW/8P7l66WfR8vdGOWvpZ
         XjZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=hajAuIZfgDx7Uw9VfrIZ+S/99TCcaQn+XI62LA6LKpA=;
        b=OefyYZhYuGezaN0flXZgzOygVecHPAfy4pbCF26MavPlF9Rfjs2XYkAbdeaib2u628
         sHtQmAbyBK74ReJvgzpTvTnN9Vw/bZzOnw4SfFpCCNSP8D9La/igC86zdhTGbOTprCQz
         7dmoVO9X2Ps1LkJGWiYkZ6x7vfKJk12rZliLaBZhSCFiWUyGG6i5322indjzqwZ0J8pV
         eRCgrTmuKhy2qt7rbcR2Bc+/jmgKyaGGJ2CMCGXBYF/3znrChkgsIXMohCZzepzsC4IX
         f6qkqfs41R93TjJuT4WyUmUkUlB6jpW67sG0gKjC1+GpPr4098ZLab5FGLcZVvvbKufr
         a1IQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hajAuIZfgDx7Uw9VfrIZ+S/99TCcaQn+XI62LA6LKpA=;
        b=pAIZVW5KzC/Eue0aytl1S/5B4DQ0XQ9DqINMI0Gb6h/t23BEgC6WB8ic/qpi1x+tkD
         +Kkx2joJhK/72ioQAkblY3JBQPj/rEOxv6AQtGiphhccNP9mc5a/VD83voJrC/S+bU7/
         jiYzE9ro4SL7aMjI+MYv43ZsM3J4IWIOaYZiQ9qcRbdASAGjB/39PVXbcfwqv05ie3KS
         J+sXIVQxoDazcwyezwlu7Y8q8dJ10z6O2GyV96JyICN9U1QmgqP1EVWwPcq2NhLHh0t3
         DpC4bB621Y43XboO2rYrPFcbnbMJFt+74GNFM+qXsYYAo5bZW2blYUc4+gMg/zYHYOdg
         ZwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hajAuIZfgDx7Uw9VfrIZ+S/99TCcaQn+XI62LA6LKpA=;
        b=DHgx2Znzg+/QG/zyGwCgtvUw3IomPQ3QmSGVl1AV4sdlLqq/IrtsT38VdjAJ5S62Tj
         FT7bJO8crXFPiNodEyO+j4Yb1fP4hUQPsV9c6Ie0nirtAcuRQoO4gzfmqn5ix8iWDZU7
         XBpaADmtL/Fa8zVor3s9E3vj8HPBS5DmaZb+2xry83nhnOGH8UWZehaQCltKliedYU1y
         tEO01M9TA93XUPoJTDU4UzA/UoBoR9fdVnJufRKFsexplfIQ3od+oQS9qUQpOSZ6fTT+
         oFRhrM9tUS0Y9VGhoVcuAcUfrBjhOWQwAhp2TLyt0VU/DtcFwokyld/4S8Nc97xE0CfV
         lfJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVV5WuBRfUbJqoSfBTSSkd66RFIC0053BUDpIvXGtlbJNcAc2bR
	Fk/lY8tmqhuVM8QSCjgQHoQ=
X-Google-Smtp-Source: APXvYqx1KsADa7Oljgm7DHLTWmM04TWL+T3hKKOQVOg1dBsmiYPXAW2a3t4nxos0s0ojBnIRq4s6Lw==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr108232665wrc.203.1578313206167;
        Mon, 06 Jan 2020 04:20:06 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c76b:: with SMTP id x11ls5258295wmk.3.gmail; Mon, 06 Jan
 2020 04:20:05 -0800 (PST)
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr34713435wmk.50.1578313205489;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313205; cv=none;
        d=google.com; s=arc-20160816;
        b=09G1JWe64Wjp9Qb6ffcOUSAwWTHaeq3GNAnbWpx2yQR/DPKmI11GnpZ7U4ybY7FIfL
         vR42ywxr6jbEvXxMkfJaADFMD8+RIALMZfkPAYCAJ0oVrsmLGcy1D3UhO3evpBzocBb1
         lO32a8tVe7VhRn5iqCJE4RjQ79I4TXZz6FlNTZLG1zbPqxi4AW6zuHG86lXAYuC9FXeS
         BVOUDwMTmmOTcFTG6yhZT2RvqzAxW3+hdmedzs6M5QsnWMjDenwKeG0vCTyyqxo6j9TI
         6vcUFM3dmCnJjS4LzU9TkuliKWGXYetrCqR9qC0bACA3RcaR47qenLRi2wHTc0ZYjEAY
         Jwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=0o9ocOn2oVK8ZgNIjSuV2drpAAsXpLeg2/6+76WtdUA=;
        b=hNEj8Xw+tYQ7txdk22VNVCcYKTPQyeAZ0N9+tm96MmIF4K+aIYPW5pBCciD96HROwB
         ji7Tm+wmPYzYdfsy4MDgFDYvQjsoUrRwmyyhJwUUzmSV0c9ZE9ITWFEf1toEKi2CdOEE
         +2+reLBEUVZHXSlBJTMCd82V48gvk+qS5GHnl0Sg8puzcolPwiGs+kpIfQGtfuJzh+2R
         py3tltv7LuPxdysJ7S1T88IF08pk1eIAugxu7Oa3zAziVi0kl4qXbYYaYp3H1VpF5CS1
         gLMnjw+7xvrmza4s9grCw3/8MePbavSH2YLNGP+2ra6LkEi8tWlLkRs2zagsgPsS4oHZ
         GMDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y185si758258wmd.2.2020.01.06.04.20.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CK53l020926
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:05 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKFA029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 36/38] core: ivshmem: Reorder ivshmem_endpoint fields
Date: Mon,  6 Jan 2020 13:18:17 +0100
Message-Id: <76301e7854828a646e81be64188948c285fa3ed8.1578313099.git.jan.kiszka@siemens.com>
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

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/ivshmem.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index 61773799..9153d4a1 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -39,11 +39,11 @@ struct ivshmem_endpoint {
 	spinlock_t irq_lock;
 	u32 int_ctrl_reg;
 	struct arch_ivshmem_irq_cache irq_cache;
-	u32 state;
-	u32 ioregion[2];
 	struct pci_device *device;
 	struct ivshmem_link *link;
 	const struct jailhouse_memory *shmem;
+	u32 ioregion[2];
+	u32 state;
 };
 
 int ivshmem_init(struct cell *cell, struct pci_device *device);
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/76301e7854828a646e81be64188948c285fa3ed8.1578313099.git.jan.kiszka%40siemens.com.
