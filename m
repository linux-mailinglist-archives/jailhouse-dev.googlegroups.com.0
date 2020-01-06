Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4WLZTYAKGQE4A2KO3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id C403E1311F9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:02 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id h7sf7955094lfp.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313202; cv=pass;
        d=google.com; s=arc-20160816;
        b=S34SkBL7XGUePO0o9OsOL8gRNAgxed8KPDJl3p5I2GYpWV1tAxQwFj0T/aWRDF3SFJ
         i57/2rO/R+kFTmfr4cQHRnK6MbIDSKWPYcADoeY9DBsmjrTm0CxkGlvaKrSiApfX5nSk
         GPejc7sLYhmO9tkIEa92mLMVJ7UNSmFXjyjkYHwaklIHGkSEkB2YRTKSUJUyDz1FS9nE
         YR2v1G4opfrUPZ/qR46UQVm4teRNwIqHftZ4tDz9BxrCq9yNLMS03WmBAnGHiuror40g
         zRRbno9VdS6XLvqzPHxHHfBJnQNjIuoEy+ash2ZzN9qxJH9HdPq4dlgHoEoNhZUoN5Ls
         0Qag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=lUDj4C7OcnliF4Bz1CUslhEnDxx5kY5vh6rovGe6KpQ=;
        b=Wnt2MhgwLfLvBGc1i98QXJOkTWZPSdA+Xhqp8vVsQpvKd0Fmi8fg1O/9VPtSlwF0bG
         0nsn18TY/5WKGN6GDKZpA8fJVouHp9tnS59EnLzXOUYtP0Xc+jpAk+AzH8FWJyw7bB0t
         KJx2r7c45EIGB3OTA89qvZeFAwcBK3hbBPiC0YvwqIPYGJXqulRWFXTaHyKsKvPZGjM+
         UHfAPOU2fpq5XDhQ58hjp6N78oKUwDwEsX0LD7oWIipSBK5RlJ4M7vDMNkXtWEJqmaDt
         3iOVKfJOXnyYQps5xlV/spEm36zkXvNagO2brXYU4jJHPfdqsXJrm+J5yBE3j3bUGH9k
         nszA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lUDj4C7OcnliF4Bz1CUslhEnDxx5kY5vh6rovGe6KpQ=;
        b=XpMcuDHu7DP50NZGlKDSDcI6TfPAFB3pHQzobULxgcp0mxr1m5z05Kp+EBupPD5BKD
         //SI7md3lPn4qQcXeZfem+lqESdBdTNM41GWfOpdBX62IahjhvhZHwog44nN6uleh1PX
         9uG7fqU3PYamUEIFEfVpYFDzdAfIkYH8f/2Nj3UaX5dUv81Px8J4QMy6PscYYOe1dMZa
         G9FdEqmxN+/Wmw/ZzWyOw8UkpBiIFU+1bUI992h+n97FZOJemoGXoQwmujccKDYtlCkU
         h4G44VHsyAidWNBVIUioDFeN0UzV+kZuP8hHsMwmC0MjsVp0RJ2wfVVYIevyGKkSnXP5
         6NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lUDj4C7OcnliF4Bz1CUslhEnDxx5kY5vh6rovGe6KpQ=;
        b=pGqCNqP2Y33o7M0v+WxKB+GpDYhJnFFw449yAfTwkgpgB7I3vSZefpQZxMM9Qnagvd
         6c3dAH6f38t1CqItlYIiZmc0LASS/9VtQJRkvBGveoU0/NBZ/v56qDbrMIVtfuyNQAoT
         RkjEWqHQQWaTSyZydbulkmfJbcOCjSQAdynafh7dvKbZDPTihq2iTQ9ze3TU5MH+MD9R
         jdquyPhq72IstZ8aZfgvcd94BYGPxideRXAAKc01RDJOyhc8htpiteKWvaXTqgLpYdyq
         uFFAxqvy5lot7TJtg645J+BTEwYe+g9IXmad/YfJhwEyfCqxlkmUS78YYzqKvPY3OWxk
         dTTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXC+4MKnl6ira76X3e9AeJPZ/ZPJwU+W5mFYsK4KLP/KFqd1luw
	KbkM3ara0HmkXu5b9qfCrWk=
X-Google-Smtp-Source: APXvYqzT+Xfjwwfa+jrOa0I38/6AvbQ3D2RBusrUFjmyP1R/ukRXJoFCQCMT9AjEStZ23fKjChWrpQ==
X-Received: by 2002:a2e:9095:: with SMTP id l21mr58842273ljg.175.1578313202370;
        Mon, 06 Jan 2020 04:20:02 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:915d:: with SMTP id y29ls4123409lfj.7.gmail; Mon, 06 Jan
 2020 04:20:01 -0800 (PST)
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr57183575lfm.140.1578313201487;
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313201; cv=none;
        d=google.com; s=arc-20160816;
        b=mN3/BwJPnHp9Bdx3nT4/QRKspsIrcZQm5i9vlvKRSHt5rMcE+NiZaAqjrKqk8B/jup
         VmFgwNT43eWe7MmizVDU/AWPowYbchY2YMPczCDA/C7j4yovO+/zamjBo9BNZXJWK8D0
         6YgdA+tsuWRCb79zthd99S2/yRcHQWqG2RD4xCIMl5jE7WILJR2hU+xHYP60UQ4ZxI6a
         ju9FzmaBFPS8uJ+OhGAZ041IzPLw02HLIrFdozBa5av5fS4hrUBV+V4ubM8+K+t/vC+Y
         AyvLj5bgo5z2uN21gbA2bBKoshyIlneVmejomRseiXbTh8DTWsOQOx8j+YFKZXRKx70s
         KOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=wwx2OySDBSX3hNA0PpTMnBP8/E++TRk8YOYqmc5hU+c=;
        b=a33hACkODqJiFAINsZolzlIDKk0L/1vNzEBBoAiLM3yGBr27QNDtcenZm9Tdc9C3wn
         yll6XG+Ft9etAS0lC7rXTC6APtUDC1cLxkDvQHQJGjfpfKA+7bqhPHs7hlDIE5ehNolm
         ngDpAzpgQE5U/NIBWt9dNBf2ITJ3ISklDd0phjnPumVXpxwFkgW6wl2kjb8L78Wq6D0Q
         4CDGE+y4C4Z4Qlt2f8rIvg3eJ/RZg7g7L/lE7MVbSvL0IcBStd2OKsMx0/l9DIxnw2uj
         IWDYiEo7iQVvNVYtgz9100P/j2/y6H9RivJ+X0rIOillAS79VjxLfxc7inv8u6TrdbJP
         hBqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v16si2680098lfd.2.2020.01.06.04.20.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK0oH019228
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEt029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 21/38] core: ivshmem: Relax peer matching rules
Date: Mon,  6 Jan 2020 13:18:02 +0100
Message-Id: <1e876ce52b5580d759b63d542d1119ff182da2f1.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Only match based on BDF from now one. We will rework the number of
shared memory regions, and matching them all will an enormous effort.
This should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index e048d136..8d8481c7 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -17,7 +17,7 @@
  *
  * The implementation in Jailhouse provides a shared memory device between
  * exactly 2 cells. The link between the two PCI devices is established by
- * choosing the same BDF, memory location, and memory size.
+ * choosing the same BDF.
  */
 
 #include <jailhouse/ivshmem.h>
@@ -314,8 +314,8 @@ enum pci_access ivshmem_pci_cfg_read(struct pci_device *device, u16 address,
 int ivshmem_init(struct cell *cell, struct pci_device *device)
 {
 	const struct jailhouse_pci_device *dev_info = device->info;
-	const struct jailhouse_memory *mem, *peer_mem;
 	struct ivshmem_endpoint *ive, *remote;
+	const struct jailhouse_memory *mem;
 	struct pci_device *peer_dev;
 	struct ivshmem_link *link;
 	unsigned int id;
@@ -342,14 +342,6 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 			return trace_error(-EBUSY);
 
 		peer_dev = link->eps[id ^ 1].device;
-		peer_mem = jailhouse_cell_mem_regions(peer_dev->cell->config) +
-			peer_dev->info->shmem_region;
-
-		/* check that the regions and protocols of both peers match */
-		if (peer_mem->phys_start != mem->phys_start ||
-		    peer_mem->size != mem->size ||
-		    peer_dev->info->shmem_protocol != dev_info->shmem_protocol)
-			return trace_error(-EINVAL);
 
 		printk("Shared memory connection established: "
 		       "\"%s\" <--> \"%s\"\n",
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1e876ce52b5580d759b63d542d1119ff182da2f1.1578313099.git.jan.kiszka%40siemens.com.
