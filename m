Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB36LZTYAKGQEPU2OH5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22F1311F1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:00 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id v11sf1780547edw.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313199; cv=pass;
        d=google.com; s=arc-20160816;
        b=vFxkejXaISioU674N9qdW6JNyP8nUHhihy7vduik96kaj+zSZdrC0utv7wY/R3XLiY
         PbXZ+3hHlqPmu5SVQakH52XKPrdWEe4CJG7A9ru1Fxbr8AdKoxNWm/FrqyYTfj0a7D7P
         XXlVjO46gUD4mwX7jfBlCkwZ4ddmCj3bb3waW2U345r9a/WCL60INUZtU9p9FA7W9FNk
         krs+qVzZlINVfCbxg3TSm90rub9DAR2kxBkjVVbLrq8t29ytvkcxYf8Lp+m+dUbO1kQK
         YFoGvQ00w2YbzfypbRginqpYKtNQE9NQsc0EvuUXpiCJzLcrZATuk4wSQJ5k66/o5E0m
         mpQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=yg0qXakVOzfRWTvTjosPQ4MeVZ0Qp4j2RE809+WcocQ=;
        b=DvU3l9SO++3piBMKKzWBwEVxAzeX+9aaJBQ4Uwe7048PvPoBWSF0wIfTcg0WGYlYjP
         57JECmmsLLh4cYNE4sVNqW4kmKSVO6fnGCC/NyypV20cGm5TWzQi7An/ZRmVX2EXejGF
         0tVlu41TgMOGfQ8P8Wpp+tvejsyEEj+cBelw51Q9frYLuNkAW/r4wWU5oxDiD9rABgqn
         cmnNGjmDycMclemg8DvLRfmaeD6mnbJAQ9rwKO+iBu3r2EWc3XXtXJCNzC7mlZyu0ohS
         J3/cuVUHTBiNc8BNJ0nf7BL8V7RyDomm+kCX3ya5xKsYA4vEkvyno8Rh2NO/czl1DivL
         KgvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yg0qXakVOzfRWTvTjosPQ4MeVZ0Qp4j2RE809+WcocQ=;
        b=fyjlAWyNjAiteRz9/Kn85Ym3T76aFH0Zppu+/o7moeXIIX5BX6IZpGszXJ35nKO49o
         b5m8MN+erZrxdC79chqnwC8z7lm0gkM9Glznq62DcaQmasS6tw6NdJRxXVmQspQFzTFc
         yinnyBKxR3f7t/Va0TqXQuoAolGXdAFaqlOvZNv+idUpP8TCK3sIOQzrC8UVmxQ1wB1V
         jZLNNath518KNRTOxryNfgY/VGsMjgqw6v+iyUnBc82gUGam/U+L8v0//hG5eqZezB8r
         WZLRNMp9/suu1MR/zejobd8vywHCcG7Bh3ugR+KPj/43IylC0H0Ky+db7EJcPHdaf1Q2
         Fbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yg0qXakVOzfRWTvTjosPQ4MeVZ0Qp4j2RE809+WcocQ=;
        b=Zuk1Ffd5bfgYlA5t2DBhV/gmD1ISYBQYEllruno+xdhGtC93HHDbpg4LaQd+U4E/fw
         5QJHcMXhXB6UjpVQsfgkJ3XK0Pxjx8WI8UvkZKfRszxF5B7quMrnBD3vF6kkpTzQWgWa
         m7oUOH2X4hAFbpS5+A4adP30nWHytIUPfnxtWpc10nFo8MBozCxhsPGs1y4TozncdB0a
         GR/1cPg5BQ6fER5YISi5XGEvGMycaI5sSmMzT+hLd+4jRg4omNpwImNkWnpzauNBt6px
         66Y24FVUpXxK+FML832wNKixr7lc3LnFTrvtIa3I84pXmIqbBHJbI0mA7Kh782NL8i9C
         I4wg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVVnlLhjoVYNNdgp+apnIXg1PC24ufVyDU4Dc3N3GrOgGH6PkVX
	bmzf8PfrEGjJW/McsUdsrk0=
X-Google-Smtp-Source: APXvYqxGNfQlipfND2NGzInc2Sc8h/i03iYtSc4jVQF/yE6qFJ3gkIp+yiveqGc3M3TfzUjyccsiDQ==
X-Received: by 2002:a17:906:bb08:: with SMTP id jz8mr106145012ejb.96.1578313199816;
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:104a:: with SMTP id oy10ls15485266ejb.3.gmail; Mon,
 06 Jan 2020 04:19:59 -0800 (PST)
X-Received: by 2002:a17:906:939a:: with SMTP id l26mr105830666ejx.91.1578313199106;
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313199; cv=none;
        d=google.com; s=arc-20160816;
        b=cdvKZG8mTbe6D+FbtSdJy2N0QYohjCViFUC4k75N/dvTujBLI4R7fDbnxb3LKzgaJk
         U2RczyhQQRbKJW+mdJBgI/xRH6FeBGNrxHdu7Y9ArD/ayr6uy85s3eV1wWBfXQ5fsQ/x
         o4+DUKK9rS2QS166fKlazYh7wKgNbGU5A1bmC6Tl0rK3AIUkLRrp6UMQwyEzKeti7ZeM
         flrFeN/AwPLBooEn2U/oN1IF7k5qMYuxXGwP54k5l47GtpiPArGX9gUYkrCtY0Kfv7gp
         mgonxjxiqTYpRSkwtnlgzLQI2WKm8I0I8z2l0LuvRJ/rLPyDikmWtWra9LJZ3pOnAAcO
         FRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=fRq7NnaRn3jgeCHPKVPWJeRH1HTYlM//hMaVaUYf1Bs=;
        b=HuF2+lkDFsw/7eRJ1afuCNNblDoV/ZCwoSq+jz07WX5iDjhH0t+fp3oD0eVu2TSKeS
         sgT4ZsmTVt1Zsd+jot6qzEWs5GQ4rpDvxzeBFkdGctEUOakXzc7ybPMRBdV5NRAIdJCB
         ZE9VRODQRx/PvMag3xvBR4/F9GLGWM9MTbwVFZTZ690pgdJXG/5gc3eNBdicsAB7HceA
         l3xQCh43pxQehBCyNvjLFFPQ/bGwS2HPq5KvNLYLlhmaqsFEizlCtAGW7oMFP8BeoABs
         j9D1ovpcRYSnt/QjLz40B6xjxK7rrMJDCoZ8Gnd6LCdUAkvMJO8aTJ7MFpMD1w42eXgn
         vmmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d29si2534779edj.0.2020.01.06.04.19.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJwmO021024
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:58 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEl029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:58 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 13/38] core: ivshmem: Use device ID from config
Date: Mon,  6 Jan 2020 13:17:54 +0100
Message-Id: <f25565207c0de2d7c07a755c386d3039f2e0144a.1578313099.git.jan.kiszka@siemens.com>
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

Convert the creation order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/ivshmem.h |  1 -
 hypervisor/ivshmem.c                   | 13 ++++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index 45cd3c4b..dae67f44 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -29,7 +29,6 @@
 
 struct ivshmem_endpoint {
 	u32 cspace[IVSHMEM_CFG_SIZE / sizeof(u32)];
-	u32 id;
 	u32 state;
 	u32 ioregion[2];
 	struct pci_device *device;
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 7bebaff4..45306b85 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -99,7 +99,7 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 	switch (mmio->address) {
 	case IVSHMEM_REG_ID:
 		/* read-only ID */
-		mmio->value = ive->id;
+		mmio->value = ive->device->info->shmem_dev_id;
 		break;
 	case IVSHMEM_REG_MAX_PEERS:
 		/* read-only number of peers */
@@ -326,7 +326,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 	struct ivshmem_endpoint *ive, *remote;
 	struct pci_device *peer_dev;
 	struct ivshmem_data *iv;
-	unsigned int id = 0;
+	unsigned int id;
 
 	printk("Adding virtual PCI device %02x:%02x.%x to cell \"%s\"\n",
 	       PCI_BDF_PARAMS(dev_info->bdf), cell->config->name);
@@ -340,8 +340,12 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 		if (iv->bdf == dev_info->bdf)
 			break;
 
+	id = dev_info->shmem_dev_id;
+
 	if (iv) {
-		id = iv->eps[0].device ? 1 : 0;
+		if (id >= IVSHMEM_MAX_PEERS)
+			return trace_error(-EINVAL);
+
 		if (iv->eps[id].device)
 			return trace_error(-EBUSY);
 
@@ -373,7 +377,6 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 
 	ive->device = device;
 	ive->shmem = mem;
-	ive->id = id;
 	device->ivshmem_endpoint = ive;
 	if (remote->device) {
 		ive->remote = remote;
@@ -447,7 +450,7 @@ void ivshmem_exit(struct pci_device *device)
 	} else {
 		for (ivp = &ivshmem_list; *ivp; ivp = &(*ivp)->next) {
 			iv = *ivp;
-			if (&iv->eps[ive->id] == ive) {
+			if (&iv->eps[ive->device->info->shmem_dev_id] == ive) {
 				*ivp = iv->next;
 				page_free(&mem_pool, iv, 1);
 				break;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f25565207c0de2d7c07a755c386d3039f2e0144a.1578313099.git.jan.kiszka%40siemens.com.
