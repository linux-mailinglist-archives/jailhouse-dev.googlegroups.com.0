Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB36LZTYAKGQEPU2OH5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5E1311EE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:59 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id u12sf27042409wrt.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313199; cv=pass;
        d=google.com; s=arc-20160816;
        b=bQLgYorp8af3hEiGEZNaA9GGlsoETOMSiDh1JkJ3qf2ZMa5vKklS8O65iuLgwGABxN
         hDi1PEZy10NRJWoMYbwWizAEWQwZsy62m6LBSIFc21c/BHLyjj76iKAaxLHFSBrLP/c+
         +rIvtGbaWnArRCLQgJRqbxegJTIBwTS0fyBbFH7w8KYgle23h3wn2tddjwFpDOabesOp
         RgMWMpNrJV4Ya0xvyKqAhc/E0AmlZ3xsci/M2uQB+KhpBQxhgvZt7TFNG+JHVDOlURat
         k1EybdW0bHsmkeb3b2jeslm2ltLOOdQFDfOz7/TpRIAi1CyK2J2DyzsPFjEp+XOlPXnf
         y3BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=o7REkpxG8HNPGaS4iGnk70ofilfBPkxOT7frLyG+lyg=;
        b=TewLwtbDeZVtv+6nsDiyXogkQPqM01hzZpLYI1YkCJ1+7OA69KbNL91TA8H8oDwIim
         myd9dCu5HPEb4rUVP5ZFXAnqz0Di5w8zfrRUcgm4VOyzeTBsKnUvWS1U4G0bMnrzt/yi
         MCmSNK6CI9hqCZlN77W4PctFvdCFMiDnpZvdL5jZbCzFZvRYhQitpFPF4XmB0JjYqzoa
         I/wiuXk/3XeHETAcfGBNtGERUaxf5sL45VXoG5gBxPaz+BAn3Cg2J6NRRjoKDYga2BHc
         tLCrFtKkOHvfOBaL2Vgju3Y3L+WeIQHLzEuiVapnenzul3L0PAsqmVFJxoUp19ayXjjV
         Cuig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=o7REkpxG8HNPGaS4iGnk70ofilfBPkxOT7frLyG+lyg=;
        b=e/KnrH84AsSkuGNUXa2vxOWZgeiR4JnMLkRzEIVGFA0g+i2IWrsZU8ACpUmkn+Th/0
         PBvkrpzdOxtSHXDCS2An8s9TzIlqTazSPNSKReGsoG/FUuIXeKQjKpp+pyJy6mCuHyVP
         2zxlRJEjy2J3IpIKvUDWCzuFjkeC/E7ONpkeBun0Nk47tpMWz96h262covDfZomiTYxD
         RPDDgSBWE9yANuiwM32zlMORni9WYpy+pCSYUhwUgN105Q3DBPyE0+DXM6B8rKhVojWs
         hmWU1RQmFOdyD4JOmxc8uCMepmOzc0vTE5BYaO0q/1MYKZwV8AFp1hOsA+euR0qW9Mdr
         gCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=o7REkpxG8HNPGaS4iGnk70ofilfBPkxOT7frLyG+lyg=;
        b=fG1dJDUQCZNQmDJjmNrM2WbgKz4UTAzWGeydE2p6zDFG9vlUaH+rMJjYtr0SLHzXWm
         jw8mcf7gHS1PRm7Vit5hzvdGmmUYZz1FdqJgyJapGjMeNuI5wos+e+PZZZE4UdtLlNcq
         biAs6L9LPCUrwSGSssndgUDFwUHpzxIdj+Rn5PL9cGUl7qlbS/Wc6YcsY0kwQPjDzYq5
         XXKuJlIOT6sur69WnaoUazzkOQRO5ab6x333guWoCuKkEut8770r4RehkqLutOKiZuKo
         ktKNqtjMY/nN6aRBcQl/sycsJkjvC5abllhkMRWumVdM5KiBIfALFX97GeZWU4+YBWKv
         J1Ag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWbbBsg5b/cfTUsJxTzBPrbZ7Qz8V/6cAqz5gooMYB+jk3LGOB4
	UXii/SgidIG+t7lunBhRT8g=
X-Google-Smtp-Source: APXvYqxKkccX1ssUzXooGMiSfge5xsu75a2UrAC9im2HPDxLFroFJGwlUVahLtCN9c6vCj+TTcX5HQ==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr35207319wme.151.1578313199140;
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:e913:: with SMTP id q19ls5250595wmc.3.canary-gmail; Mon,
 06 Jan 2020 04:19:58 -0800 (PST)
X-Received: by 2002:a05:600c:145:: with SMTP id w5mr36464795wmm.157.1578313198495;
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313198; cv=none;
        d=google.com; s=arc-20160816;
        b=beWdbWrp6v0a66l9ealXaUuFsk9+ASqfj4q/NLYFUqr0IMUlPjn0fBSx/4ki+LCdLW
         Y3GXixHrrJLf8wr8xZwvCNTG66SPDcsyFBmlo9IOaniO+v04usz+dzCKmT8hpw6oLhHk
         uZSzS58jk6BlVgUAlQDpcs8b9nNFXHRGkbVHN2YLRhqBJIFtfGyFW7y7rDyArfVrMjkW
         diDAAPWnkLLxnd+vlrR2ieVa9oIhmUiXRHfJU+J0bwxbg0aCiS7p0osDpQ1CNI1Ri2L3
         8sHtblORsXMQ2PRJFNERW2tP2NylWcDpd5aZHIGRK9nwFpZCu2/VSvm3KxqozDkuuNVr
         TF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=3chAoCxKPxE+yuLRYSa+yHG76JlRP+KAmu/ux9PVEQw=;
        b=D1umlRy4xi7aBT9k/AGaAJb6kimgSxLba018aeko6LfMv79s2xd9nBeU0MVe4lG0Ld
         K7yPclfCrAOI1OzBUxM6uFJiQPT7QNElXSO/06Yye9ZZuKHJB/erkHvdAkBvAhl8m88l
         dWpcPkOu1NhN2Dr0j7G7nBp1pceziIB6yAn+EbIPGjy38dN7KSEwyvYaRO5fOIRzsCsH
         KDNiNjFtS6zMc3zDMftoAy1Y7D7VuNW2K6OWL7aAhj+pRRf4DzIVScyBZ1nxoRHbGRMi
         6AsteFs9jAJcuS3F828qefM056PKIGjrO6XLiaPikAxpW6JpaTx7fJRJYZUMLSaYC1wQ
         EmqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id x5si1046521wmk.1.2020.01.06.04.19.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJwuV021019
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:58 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEj029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:58 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 11/38] core: ivshmem: Add MAX_PEERS register
Date: Mon,  6 Jan 2020 13:17:52 +0100
Message-Id: <002ee2a2bebd524958014a5b81e45d8ae76cc207.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index a195140e..7bebaff4 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -32,6 +32,8 @@
 #define PCI_VENDOR_ID_SIEMENS		0x110a
 #define IVSHMEM_DEVICE_ID		0x4106
 
+#define IVSHMEM_MAX_PEERS		2
+
 #define IVSHMEM_CFG_VNDR_CAP		0x40
 #define IVSHMEM_CFG_MSIX_CAP		(IVSHMEM_CFG_VNDR_CAP + \
 					 IVSHMEM_CFG_VNDR_LEN)
@@ -49,13 +51,14 @@
 #define IVSHMEM_MSIX_SIZE		(0x10 * IVSHMEM_MSIX_VECTORS * 2)
 
 #define IVSHMEM_REG_ID			0x00
+#define IVSHMEM_REG_MAX_PEERS		0x04
 #define IVSHMEM_REG_INTX_CTRL		0x08
 #define IVSHMEM_REG_DOORBELL		0x0c
 #define IVSHMEM_REG_LSTATE		0x10
 #define IVSHMEM_REG_RSTATE		0x14
 
 struct ivshmem_data {
-	struct ivshmem_endpoint eps[2];
+	struct ivshmem_endpoint eps[IVSHMEM_MAX_PEERS];
 	u16 bdf;
 	struct ivshmem_data *next;
 };
@@ -98,6 +101,10 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 		/* read-only ID */
 		mmio->value = ive->id;
 		break;
+	case IVSHMEM_REG_MAX_PEERS:
+		/* read-only number of peers */
+		mmio->value = IVSHMEM_MAX_PEERS;
+		break;
 	case IVSHMEM_REG_INTX_CTRL:
 		if (mmio->is_write) {
 			ive->intx_ctrl_reg = mmio->value & IVSHMEM_INTX_ENABLE;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/002ee2a2bebd524958014a5b81e45d8ae76cc207.1578313099.git.jan.kiszka%40siemens.com.
