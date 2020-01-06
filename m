Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB36LZTYAKGQEPU2OH5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B91311EF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:59 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id w9sf1254216eds.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313199; cv=pass;
        d=google.com; s=arc-20160816;
        b=QtTBaODz+banc/cw/XjYy0JZyCtQ596GRW9Acoe5Oh878KeTCGiJQhjwTO97bWGDEW
         YuGvGMZiDz16w3DFE3dewJg+GVBhgZKUq3C12kZp97AM6GSMeW+wJFiJdb9Ke9N2y77Q
         kHBXBJ2E7Il/bLQn6fQLpMHEMLsBoPIjiBktzTx5amtzfu2DGcG2Ws3VEGhhGTjv/dMP
         YuQxvuFbJE1CCAPnHFRci7PaWqzC253SZ2d3xcPG/E00aviV4wg01tOb6Cs6mu/DDGLP
         dgIGIS4pWyJ4rbvG0jtFYa0hi3pH7oKi94ikK8lgGZFjqEfkXRJHWstrolshExyFU5If
         OUTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=nMKDLIJEjnpPArqIoYG8Nw7jtQr7dM3LyVGXKPhSAtE=;
        b=kaeu4FNpqjxHHjYimOmZo8p1OOMM2t+pzBR7KReBZbuYKloGHMLiS2gS4UtK/Ec630
         YtcTigQeduiS7DEa49Zg7Ay8PerXaDS3VfhBSSYnh6ZnpWXm965IDViO8+PNqHjXZAx7
         lvdzprm0nswoTy7PVuuorkM7zQI1LBF1MZUaxLqUUOsKnBSRcCgnLu+HhARleOSs5TMk
         83NjyzONWrqheQlVoakaI9luV/GjBosef7ISRrHTcDmklnSFi5oKWnHfUoQnSQN/elyG
         qKcxyUAnOdJA0fvB7optqxraf08Y8CjAPUIHHkkgy+6k0XVKTOMDGLKHYKltDc4+SEBK
         lwkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nMKDLIJEjnpPArqIoYG8Nw7jtQr7dM3LyVGXKPhSAtE=;
        b=MBl+eb2C6QJAWOlozaKNKzLQAtyy7j5jJoNa5AheSJWNpDYSJtQ++pTiWqeJYE7wv8
         OC5xbGc1k2+x01BVSc12bExC9JYiRBJNPcMMVwR9g8RMZH+gzy/V6emxp5X7S9ktbkDh
         o2lJRBKV4zGfv3TctIh496c7D6Zey0lnL0QnR5wdSY6uxYxcbxTO/IKSNoflg0tmbRZj
         /xzxXsVJHfUNLM9CsqPeg2oBpiTzK3SBiErRe3dO2uyJgpyAgILYXuBBDvLEukfe13sU
         qQLeqpWJ7JgEbl2RcJ04KGDOdBJFHkIwQWGZQ/XQv7TglJT99y5LvByi1g/+S5UgQCZf
         s72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nMKDLIJEjnpPArqIoYG8Nw7jtQr7dM3LyVGXKPhSAtE=;
        b=AwCZ5QtU2msiH9OhoPvW7C032+GzCQU2NZ/CVHWR5yGyySTl8y2Qm5mQUfq3dE+1xq
         TFHUoEGr0eVlYzPIk1KMlK29/ZRj/0Phrl9Nf8BIrNEdHJjibPOzYi5oOT6gojHtGyt5
         x7zN2j9/1NR3Iq1OH9BTuGnRy1sR2jt+f4VVXbqjZjBvzusLGnleOWrBYZ3amuCYqVdU
         QdJaJ+PL3IPoknq7i1VCz8kU3qyl0rU8d/m980hiV6pF2jZVLE2ui7plj5sgfYi+2yWP
         UBI5EBAz3+jMLDrCsmNfxXaMl36u6lqyT2oOlzIe/LZeK8fJlglqiO3nPCQNlsRsKEUF
         dLIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUcVgIaXsm2QWc/V1ozRGxCU1itSW60xFHnS0BxobnMOg7DWAdd
	M3ApmC6iq7a97JPmL0v6l0c=
X-Google-Smtp-Source: APXvYqy+PbC88UdWxVofSaEu49tWK6iTTjFYomN99fcyKo8alIrMejJ9pYYDB6hBUdLOGcLrVKXjNw==
X-Received: by 2002:aa7:d1cf:: with SMTP id g15mr105231762edp.301.1578313199205;
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d6c8:: with SMTP id x8ls13999487edr.14.gmail; Mon, 06
 Jan 2020 04:19:58 -0800 (PST)
X-Received: by 2002:aa7:d30d:: with SMTP id p13mr106330294edq.247.1578313198342;
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313198; cv=none;
        d=google.com; s=arc-20160816;
        b=JSCpOj9WLUaj++mqx95VLA0SBBbZZDAhmqeG/0l6rgjmCpOQBOmyl1LGDX5lrnhv26
         uEf8msNqMOd/nRGpbhMBQ0Bh/x3iVMncpj96venZmDagHEUbbmjvlrekuScqQg6qT/K5
         UZymspWpYlWO18N1N1wN28AJsBVhh+Ji4uWXI+VOrClKcgqegO8X1ehueYFKdEREjVp2
         RVlbfD0JNgShoXib7y1nwWOWgcFZATP5EB3bCAZjk25AwPcgZsKdFAw3i1IlN2F3/0M9
         Pg5PUnEMb6Cjw0TG5yXvzAP4ipMpaIp9nUgbWHlSf08P4SiO27ORmiCYoy74MNKQzdOr
         E1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=HcFdlRiIU/1Qj7F/V6o5as/qlo06IE7dH4airGpU99k=;
        b=gVG3P3+Br121pyU8qn9hLMPqflQqDodJZ8LgVnzEtqPiRJXdMbRk57myoSJ1iVDD6p
         NLySgNAv/m9n5iYvFknq11iggSNWTv4n/NniIfVeeOdlp5KZTH/rErhHMVVhD+P2sGQX
         s5Wm8RlPUT4a1B3GW9qVPdn0iVJggYYTm3/OKBbzD7FkKacqCWASHDJrcGfBoc/HqBiE
         73yKgJa3er3duSGLvnUhAF9BzQTo3apdQT3ii9pj0IUrgO7G/JI0/SLChMh54OAWQQcB
         1qwW08BasHyHcHFo+tT2n7aX4zFSxy52i5x13zP/4vMiO/5V1S7+reE2xq4x55DWolOT
         s9Xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z20si2123809ejx.1.2020.01.06.04.19.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJw4g021012
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:58 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEi029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:57 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 10/38] core: ivshmem: Rename IVPOS register to ID
Date: Mon,  6 Jan 2020 13:17:51 +0100
Message-Id: <313d2a86c530e0ab440e6520ac919f2933017a5d.1578313099.git.jan.kiszka@siemens.com>
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

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/ivshmem.h |  2 +-
 hypervisor/ivshmem.c                   | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index 16d0cef0..45cd3c4b 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -29,7 +29,7 @@
 
 struct ivshmem_endpoint {
 	u32 cspace[IVSHMEM_CFG_SIZE / sizeof(u32)];
-	u32 ivpos;
+	u32 id;
 	u32 state;
 	u32 ioregion[2];
 	struct pci_device *device;
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 3f023b49..a195140e 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -48,7 +48,7 @@
  */
 #define IVSHMEM_MSIX_SIZE		(0x10 * IVSHMEM_MSIX_VECTORS * 2)
 
-#define IVSHMEM_REG_IVPOS		0x00
+#define IVSHMEM_REG_ID			0x00
 #define IVSHMEM_REG_INTX_CTRL		0x08
 #define IVSHMEM_REG_DOORBELL		0x0c
 #define IVSHMEM_REG_LSTATE		0x10
@@ -94,6 +94,10 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 	struct ivshmem_endpoint *ive = arg;
 
 	switch (mmio->address) {
+	case IVSHMEM_REG_ID:
+		/* read-only ID */
+		mmio->value = ive->id;
+		break;
 	case IVSHMEM_REG_INTX_CTRL:
 		if (mmio->is_write) {
 			ive->intx_ctrl_reg = mmio->value & IVSHMEM_INTX_ENABLE;
@@ -102,10 +106,6 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 			mmio->value = ive->intx_ctrl_reg;
 		}
 		break;
-	case IVSHMEM_REG_IVPOS:
-		/* read-only IVPosition */
-		mmio->value = ive->ivpos;
-		break;
 	case IVSHMEM_REG_DOORBELL:
 		if (mmio->is_write)
 			ivshmem_remote_interrupt(ive);
@@ -366,7 +366,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 
 	ive->device = device;
 	ive->shmem = mem;
-	ive->ivpos = id;
+	ive->id = id;
 	device->ivshmem_endpoint = ive;
 	if (remote->device) {
 		ive->remote = remote;
@@ -440,7 +440,7 @@ void ivshmem_exit(struct pci_device *device)
 	} else {
 		for (ivp = &ivshmem_list; *ivp; ivp = &(*ivp)->next) {
 			iv = *ivp;
-			if (&iv->eps[ive->ivpos] == ive) {
+			if (&iv->eps[ive->id] == ive) {
 				*ivp = iv->next;
 				page_free(&mem_pool, iv, 1);
 				break;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/313d2a86c530e0ab440e6520ac919f2933017a5d.1578313099.git.jan.kiszka%40siemens.com.
