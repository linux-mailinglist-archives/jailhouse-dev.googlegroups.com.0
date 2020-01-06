Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3GLZTYAKGQEPYI7MRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 951E61311E6
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:56 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id n12sf267252edq.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313196; cv=pass;
        d=google.com; s=arc-20160816;
        b=Hp67k8vYv9BS6LsJbR893rPxGHHr8QZiaHK5Lags7TX2SC+JoyVfm0/3kyVHHFiQPT
         JVMCmcCDuTW8i2IBpr2hogzSKx9ss55rgmQC5nTWRqoDpgkS4hOViGXqVCypnFp2OePf
         oUpruvKSxuP6XLWvYntdEbvXNxxdvlkmVgx29D/OBEscfpkndhr/arKaTdKQ5aQ0GI4A
         mGJw2tmdis2WGSh8kHZIHWdnCvuM1Nz2TX4Fhmu6J7+1uukv/Xge0Xvi8SzVmA4z6uZM
         62cNtxCs23brHe8tICWx9L0tfH/ZRMSlKE+jFNXIRncljKl+rke1DDUUUTHI0ZebNDRm
         xdqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=A+YdK7b//CwFfNsrfYkpOwKqG7f0jFtko7MQgyJ96gA=;
        b=WNLR7RaV3IXrtiFtR8iJygXJ+j9qu1FZCmbeR1GC/VegYFnbRRQ9spCfsLuG8HCY0R
         nPwHCeV7XbyVkKOqdKpauUpYfsn8wHfokt/sydSaXZdviC4k9ATcUhdRNU2t3SjNtUPw
         sEMX1UnKJ/z/mC6O6v4DJ9xUe57NLtIsadCJ79s7U6HI/JHkFnQko5gKAbcPmAmxGX8x
         kwhmLDMI4fiv5lFTsfDqLxdYx4yXuIg2G0MPUxg63QEwH2918J4meqQATLe20H+XILyA
         sOK5sBLuBEanJ/3RW11nRD4gCiX857jfH+sRR3IwMftacH0aNKcdju7FFfPPm/Z04+CW
         oe7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A+YdK7b//CwFfNsrfYkpOwKqG7f0jFtko7MQgyJ96gA=;
        b=RwB87Z/HNO7rvpyoJgthX5Da/7TfvQfWDtijiM5g5Lmr6SJejM31YOuamlvdV3h5d+
         qY2uTBhXLN/2dtIvBv9U/Hk4rbd7gFtUasrPRQjPHbzSbd67L/jqQ2ORioE1txFSV7aA
         LZGTkuPa8gRaUWay3sIBndHt733rtj1tS9ji3Y45JYGYS8cYq+2rcr+kJRBpcl1RGP45
         KqAZNVcDPnfAE44SgqTxVPZL+/mOBEUa8TT83thhaB8lijU64iJTFDihvXNguYP18pdp
         GKXOeNbafZE9/pP4crzVzs9YqHm/t4HYEF62+OrDKPy429YK/1p/XDEKwobPFBXIk44z
         s5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=A+YdK7b//CwFfNsrfYkpOwKqG7f0jFtko7MQgyJ96gA=;
        b=M5BZaFHdqtgpvR0KawMkmSJmj+U0hG0DbQKh21yAJ2zxUg5rTUC47C/h6wvjQ3QIXw
         m+sj2Nma5hWdo4zHBONWCY3dHxPBBezCN1xC0DNNkhQieOAsRm3EiDvkthjkaO64Rn/p
         BvN6Ggm75BapDqSD/QWDTR8WLClEDeA1DpOyqASnEJhF/AJnmdTaHot1shsiTSGqGe6w
         TqqwzwZd7xi6Gs+DfIq/tCQDKJXOCMECMNYi499E3BXL3jGhznVPhVy6xAGbwDOzL1E6
         6r1Ei2BPHE6qgAJtqYnkHBd7qpw1S1iJOvpaWblOxSnd6XGTqmBB1p2eEUM+vnWbP9zo
         SeNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW3Ry75WrdaXY/ynjl8bdbscOyMJNcIcZjBxWALJl8XvpQbhEOu
	Wr1diq3V2QU0IBnAYoM+gqk=
X-Google-Smtp-Source: APXvYqwSaK62jfPw2PVZ2FGdZrDhSCxB4mL9qZEBxM8QN2pjwFlBeyIiTlizawyU9D4OB+bxHKvdcA==
X-Received: by 2002:a17:906:c4d:: with SMTP id t13mr107141007ejf.198.1578313196198;
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c82b:: with SMTP id dd11ls15475895ejb.8.gmail; Mon,
 06 Jan 2020 04:19:55 -0800 (PST)
X-Received: by 2002:a17:906:4888:: with SMTP id v8mr108748028ejq.329.1578313195511;
        Mon, 06 Jan 2020 04:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313195; cv=none;
        d=google.com; s=arc-20160816;
        b=phNTEFiPIq3zFlQda49/VS3cesL4/czBXQ9AeqRuG+LX7ciUzK1HiCLeIQRAM9H0m+
         K99jMGXoJkkFWJ4qTtMU4BJDPAw4GX1QHdp8JDCqaFt8hxaAgDyWLQqIGuSjg4dR7nMz
         M4w+Ap3Ns35ZdhLUOEn3SiJ9IM6TISMvS5tQPye7zm3kAqDUI36aJH+hOU7uvY/Ms5np
         mYc3HZi2sRo/NATVyjFpMfYNTNqHq1VLznN85IbVKX7euRXM8g3A9DXCJbhaS9SWAWyR
         RQuvqjyGLLPfJ3Sb3Z4LHUCznQJQuBsZeMZ3HrhZKg5mulMH1ouSzO6phGTU/xV8b240
         Ut4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=euRv2LLxWrA5YbaaqtIiNaYXtMVAY9X8CQkC5gRAXfY=;
        b=zVLhSk910CsGS3rNmmMNx8/1Fto9z3weRxkreIAcAceSdOJiaZk7FgtR0HkUnxP5MT
         30mIe8naZISw8i9zWjBCwplmVt/n0SH9Op1LIcJethYKvdbwDlXbrtxD88sf55T6n+wf
         5omKlAlCHvYb5R4/AZyHD2i+7tGKgpVu7YQweqtc3hlau6UtUww4dqCTcrDAhKx31yVc
         uYELd+xmY5Yv6MG235H65NsYobXVLnTn+tCV0cSGg1CH9JqhGzpPJ+owuKZi/H4ulndE
         aiQ+ibnDE96YXq9lPJQ2bqbLOevSUa4HdxKsBV9VPoEGSJ8sIOAdkL5j9wBVKPAm5udq
         eOnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id ba12si2227396edb.3.2020.01.06.04.19.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CJtiI011019
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:55 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEb029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:54 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 03/38] core: ivshmem: Derive MMIO register region size from cell config
Date: Mon,  6 Jan 2020 13:17:44 +0100
Message-Id: <c2c1b65e1525139e7560a79be0cad84742a455ea.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

The BAR mask encodes the size of a PCI device resource. Use this to
allow a target-dependent setting via the cell configuration so that
alignment to the cell's page size becomes feasible. This will enable the
cell OS to map the MMIO region as a whole into user space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 358c5b04..f4b698e0 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -46,7 +46,6 @@
 #define IVSHMEM_REG_LSTATE	16
 #define IVSHMEM_REG_RSTATE	20
 
-#define IVSHMEM_BAR0_SIZE	256
 /*
  * Make the region two times as large as the MSI-X table to guarantee a
  * power-of-2 size (encoding constraint of a BAR).
@@ -221,8 +220,13 @@ static int ivshmem_write_command(struct ivshmem_endpoint *ive, u16 val)
 		}
 		if (val & PCI_CMD_MEM) {
 			ive->bar0_address = (*(u64 *)&device->bar[0]) & ~0xfL;
+			/*
+			 * Derive the size of region 0 from its BAR mask.
+			 * This reasonably assumes that all unmodifiable bits
+			 * of the BAR, i.e. all zeros, are in the lower dword.
+			 */
 			mmio_region_register(device->cell, ive->bar0_address,
-					     IVSHMEM_BAR0_SIZE,
+					     ~device->info->bar_mask[0] + 1,
 					     ivshmem_register_mmio, ive);
 
 			ive->bar4_address = (*(u64 *)&device->bar[4]) & ~0xfL;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c2c1b65e1525139e7560a79be0cad84742a455ea.1578313099.git.jan.kiszka%40siemens.com.
