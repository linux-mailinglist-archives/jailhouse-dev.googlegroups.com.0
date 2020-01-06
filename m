Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4OLZTYAKGQE4WG5QGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F91311F8
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:02 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id v17sf25429926wrm.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313201; cv=pass;
        d=google.com; s=arc-20160816;
        b=nVQ9O0LYlNW1ap46gERMDP5Fd7+fiJRhDE0A9FQPh9tCda5vMIWne5dlwqpI7AvpQh
         cM71lavnOq9RRn1USwIJlgtJgUqNqCNl5RgQg2TJgHUrYLUHsgQSECC+x806DGjhJkPI
         UjEiVQQq7E7c6LOqd/qgMmwiEJFo4sKKKuHHcX+WAJYoTvH80UgjQ26UwNnZrchY7RAw
         XI8Njcgu2jFKXdAlPI//ysvPGDtussvNKNHLNFOY7TaYfa+gbczGjuDFF0Xk4Z5kVulG
         nJGzBO9tP1o+h9N8w5bWSYCpPEYh4fQzJry5p/sWZyFXt5pTjowpAnqlENG+0xcuKjBT
         L0Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=p93i/AFTrjXwN2zoZIuDRdtWDzC9WrD+rMR84tnPUqg=;
        b=MtD7zWim0o35Rda2k2nmhHhGj1GipXgYoyqypNvra2FQVHKq2j7kSsKQx0zQrhB6Sj
         OwaDJFk7lIahMIjzBQC9mmCzt9Msx97O+1SONIayW8Y7c0Zwdc19ox/MFbUVkRM+IR5Z
         c+rtcePzP83e15RyAMncm9LOkmrwuOWsMSDZh1GunQN1ZpmIThNacVTb8M8SLe8qvp5o
         IgkqmC01ahBNT+0b7cUF6XxsEWpceSKjA+YgYU8ie54GyOZxiSUxB1mHPXtgYSoopDOc
         Ay4MKiP2JB3DTSzBw6/SlDD7vqejyQglA/xvRsLc20Tzr8UoJr3inkNs0pW/8R+XLOf2
         pT/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=p93i/AFTrjXwN2zoZIuDRdtWDzC9WrD+rMR84tnPUqg=;
        b=DoQ25YMiK0xabRT8qOX5Nv+raVNDi4Y8oK2nsV0BikIv/axNLEcujZuh2TOjdmjl6i
         rC314SdZORQFyW5mYAzzjYXX1CvVucjbTtIg1Xsmv4LATk9lrQkr4PPAUeVuvo6+S1CN
         A8AxtnOcixZpnnTjp7z68EAqEq/iBfdd+E2ulIbaxNDN9Eq7q6xG2pgvRYNnfN+PzwPT
         bik+1oGJ+lp8XC+di0EnWR7KndeGbqLNMrPDRylrxUsJw59FcbHR4XWhgwOIdnBrzlyz
         2hJMTO/VYNr6NPuqbNQ3kqqI1V1tki+OU18gGxJBKtMq/DNQAbesUSBCtYD0zXTHlCcP
         sPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=p93i/AFTrjXwN2zoZIuDRdtWDzC9WrD+rMR84tnPUqg=;
        b=hWq13fyddSIfdOgof0BHvij538eyFMGt88zvfTSF5/wjeSm3VBy/4yYFBxXij7jKUm
         UA2JzrXjr+X8lRcCv0R782VwpG2CPrc6n3VHzgOmnX+dZIl9UVYuZiQ27e15troFwI/p
         qSHD7VBu7pSu6CVBNeTyMXmbKZ6kHv3fK404CJYOqn7ptc670FPaW7Z2r6plniVBJOWn
         sr855FmfnLvlWXlrtCmaGwlEyrp20DTgzMjvrFT9UvuDrsvTeWz+lOUJuXjm6yozBkFj
         UME6YY8IMNBypXTm7/5pPRmU+d2e39t21jL7QpmUokuvawgnf0YYxAbtOvdj2/5IqSCY
         6/QQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2rY0Fr9fe+Ge7Qt+qE7QzGJjIcKnXIJt7Sr1xAud/MdU1Z78/
	5p4K3BcMrMNQYDJ0UgztoP4=
X-Google-Smtp-Source: APXvYqx0UQq87rlQZ546jrWaqHPQOwuXpFEG/zceyN0s8Fxf2Ltfa21ZHfm/pdu6OFaem7jWpcbQtg==
X-Received: by 2002:a05:600c:23c9:: with SMTP id p9mr34585328wmb.160.1578313201714;
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb4c:: with SMTP id u12ls12886173wrn.6.gmail; Mon, 06
 Jan 2020 04:20:00 -0800 (PST)
X-Received: by 2002:a5d:548e:: with SMTP id h14mr110951598wrv.380.1578313200883;
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313200; cv=none;
        d=google.com; s=arc-20160816;
        b=GM8gJoUYcL7GS1fP0QACGqVQUE7sL5tnT6zk/JLKfNRHZhYBQQ3Qq+JaeWW5G/Drag
         4iHnFnVQo1jNaa3Hy7GdMEcoUoTsTxb+PYVMBqZ3gdXV2K7KixZTdzs9kJbZeTl3O0x0
         VYnZW2LGpNQ66YIzV7wrFQi6hJw84hSrl9W2lAXbWPRonDMzz4UI/p4jgKnu+Y9omQ3P
         B7CvTpe7gzQxoyipfmoOg4ZIQWRfWtCDrcpkdWvyUgpiXfA5vHawLku/lFrz/AHIebHO
         D0YCpo3DSYIfsD693UcomFtmA6ijxj0149o8KFfFk9nGYcYdOfrQE93gxTi2nmyfrVT6
         kcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=YJpRy60/Ltzi98CmstIkunQ9/prq8BE+OHwvnDwiTys=;
        b=lnGvoCKMdsmpBGyTcHFWGpxLhcg1kPduQDK8dbkt5EOx7z9yJ18bfLWMQ9TIPt4P4r
         9R7Moh1n+zjzucD4HLjgkWti3ALKspdGoC64eIlL3Al/z822unJugZONcjxUdnbNKc34
         zSBFOKwNBRQkfoyfNEIOw1Qhc8OkIQP/lIPS13Jz27a6SiJbvt6E3CC/eoPLh44k94ZC
         I/95Zn8BK7eqX1rdEJTaJu7TPa7LVPZkx1/2YvV7bATe4kMPsspiqcQIPCfgvcKe1sBW
         NGdvsl6OLoLcFVOMQG7A9/yMZ67/V6KXMkAB9Yc6GWtDwKc63Yc577oyHZDJ6tY4i6w8
         iCtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id w11si972143wmk.0.2020.01.06.04.20.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK0Y9024906
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEs029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 20/38] core: ivshmem: Introduce link pointer to ivshmem_endpoint
Date: Mon,  6 Jan 2020 13:18:01 +0100
Message-Id: <ceecf6cee1c337e28cb259a23cce010c161c81c8.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/ivshmem.h |  3 +++
 hypervisor/ivshmem.c                   | 10 +++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index acf74834..b62564d8 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -27,11 +27,14 @@
  * @{
  */
 
+struct ivshmem_link;
+
 struct ivshmem_endpoint {
 	u32 cspace[IVSHMEM_CFG_SIZE / sizeof(u32)];
 	u32 state;
 	u32 ioregion[2];
 	struct pci_device *device;
+	struct ivshmem_link *link;
 	const struct jailhouse_memory *shmem;
 	struct ivshmem_endpoint *remote;
 	spinlock_t remote_lock;
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index b6f60d25..e048d136 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -368,6 +368,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 	remote = &link->eps[id ^ 1];
 
 	ive->device = device;
+	ive->link = link;
 	ive->shmem = mem;
 	device->ivshmem_endpoint = ive;
 	if (remote->device) {
@@ -426,7 +427,7 @@ void ivshmem_exit(struct pci_device *device)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
 	struct ivshmem_endpoint *remote = ive->remote;
-	struct ivshmem_link **linkp, *link;
+	struct ivshmem_link **linkp;
 
 	if (remote) {
 		/*
@@ -443,10 +444,9 @@ void ivshmem_exit(struct pci_device *device)
 		ive->device = NULL;
 	} else {
 		for (linkp = &ivshmem_links; *linkp; linkp = &(*linkp)->next) {
-			link = *linkp;
-			if (&link->eps[ive->device->info->shmem_dev_id] == ive) {
-				*linkp = link->next;
-				page_free(&mem_pool, link, 1);
+			if (*linkp == ive->link) {
+				*linkp = ive->link->next;
+				page_free(&mem_pool, ive->link, 1);
 				break;
 			}
 		}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ceecf6cee1c337e28cb259a23cce010c161c81c8.1578313099.git.jan.kiszka%40siemens.com.
