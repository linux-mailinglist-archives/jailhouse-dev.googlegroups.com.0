Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4OLZTYAKGQE4WG5QGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EF81311F5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:01 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id w3sf762237edt.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313201; cv=pass;
        d=google.com; s=arc-20160816;
        b=zLSetScdrsEbAvQUYXcH6LUkxFSAkKAqtu3WmEizCmKKdw9md/tl1b6jAaqAjqbTq9
         uWC3ltTxUCD1Ke9+hGM6WZ0BLiVHt7najykFa3keeHdGclR4An2E1oASmgLBqgIMiu2S
         cGdhOIfxqzXCDFBwJmqtzOAB0Yb2SCFAjUqofNkDKyTKBY0dQi1QA7y6gOfx0X1NZzqN
         X2i0mZUgenl/mzggYmdVG+1TXQSZjYUCoqZ7MCOSnrRCyHwHnV/SbiK2+XsWRuDCvw5z
         J/LN8vFyL+Iiqb4jaqCsmeFZ+DVWOZcTqwBSPkWlJWXIktZDvAzcz2NqOj9Dt4Q7mtCZ
         seqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=5jELpgXbF7a8M3mQiB6aMiqKRo04WFMbnxWCevvsOko=;
        b=xz4eqZgcd6NvR+rCeGqhz+U15o1k6bmi58hiyYTDEf4i5Susj7iEE7HqjqPeQoHkew
         lnFNeJ7mT9HgfSvlgqOpn1OPYrKQrqLr46DGItELpFEKX+eiKQkC9rwqLOh8v9qoT6uC
         cRI9JUDQXvaQ1auCnmpiDXt1UTvYYZi4zKMZU4fjsPCj3YXxTsk285aOpRM7ECIgl8KN
         zqVLIt9rXBF0PTWMcgsUkywUpxwRgF47vUFOvwzMf+vtlR2SbyH4Th0MEOFK9M7VFk+F
         0nsU4VoL/JEsYXrFVeH8bDj9l6IQ0BtpQ7IFjbfA8cWUOpqMzt7o5Tx1hf0X2djF2USW
         qkZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5jELpgXbF7a8M3mQiB6aMiqKRo04WFMbnxWCevvsOko=;
        b=QpD16jydm9DPzjLbh092f2uEUuPQLcN6fpCq6WLDbvt3TvDaysrLrVmhO/zl0wLqhr
         VblyBlfKPRJDQlKorYiAhH65nJ0R4sN7zUkgK2ld1hk5sPwtyf2AMfqLQX8OtuVio69E
         foT3zMUIvwZ5Z2B/oAv+0jcrlOl4EwdbASS3KyFgDvOmBVjY3hdmbrIQbMq5o0EptmEU
         v65adlPixYBvs9xa/xLn9W+JgOmLFyXQj2dBbFHk3KvO2MY1ELSQ44ZXQxQs4by9OMu/
         H9E/q5PUQ7AJkblQInmvkRqMKgCCC4dzB2JH6GZ6BMx/3aZicyHoIWbpb8dhsuqRYfkQ
         BadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5jELpgXbF7a8M3mQiB6aMiqKRo04WFMbnxWCevvsOko=;
        b=nwjazHKQhGwGjnq3aDdcyHsx6mQoRWNRRoiPWhMViDYKlOqWYyn8XBFwKBZy8ruYez
         9rzfSNxdcS5CACEO/4AuIhcsb0Y5vLxa1QnrGLapEjPdQYfxzIkfE/KCwfwzSkj2b4K2
         D7N3Xi2WGVb/Z77DQDzvQPzzjCe4PuAptXhtDNXjXhjENXIxuesDqkShvRoHsMJcnmRE
         D7Tx69UCvwW0iSdal3KUwox3b1sHG+JaZ1F+4u3TXx3wO3DLoqiv28IsgRFN2YMm2iP5
         u+2NumFrYcLYuF/pad0ZNp7bTYrV/h+otqjeZ4tKs5iRSlnkgxh1sTA03FkU+NynOSql
         lLoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX5Icmafqz2i0bI5OWnyQCAmiI4/wLi6mER4wEnD/zx7S1nMDUv
	KxKtk5C4AH1jvXGfcapLgug=
X-Google-Smtp-Source: APXvYqwxpL+ODzo9veayCOhRi11dpgz2M0KGiSrwNaJ2WL4ZxexLTe/zrxlc6nVT93QtIXMVikZ4qA==
X-Received: by 2002:a17:906:a48:: with SMTP id x8mr109999124ejf.188.1578313201167;
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bb47:: with SMTP id y65ls14008059ede.1.gmail; Mon, 06
 Jan 2020 04:20:00 -0800 (PST)
X-Received: by 2002:a05:6402:1558:: with SMTP id p24mr107279906edx.120.1578313200527;
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313200; cv=none;
        d=google.com; s=arc-20160816;
        b=tgxGeIm4ytNR6SuKtIfNLSJqcvrOfCgDDyqJHDSfr600NnbFjg2a+xL5asGWk7NR6p
         jybC3SJN0YpqxPSm0v2odKiEgNuJKiiG47s5sC7sA6NLdk7KdINhtx9xOWbO2tYKbU9G
         7npgS2yoPvbmi9/4QFbg3t4GRqdbYcdCVdSK1YPsLb0qYDG7TfNfAxnSQ96UL8MUk13V
         xTolEZsh4R00hY6hnk62+tu4Owc7SKdIVuDVA7A49hQGcpYvKC4xqKG7G91qdgt0rafL
         xS8Q/pRCu2zxPONXXMHTBNTdfNf9TDY5WsKJsMGNdnyBUOYSuYQaNf/1crA+LL6X2D4D
         VY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=8+tRjSkwd96mF+mCFU3KYAC7LXgnPCPTogG5eVOOOMA=;
        b=JCd3Z/r7KyEDN7THdXfQWdJ5r6dvyixW5o2nAHI3w5UEthqqBUQvjvWrK8OO3g8A88
         d4KXTiO+jihoa/OhJYgFJ1LqZMA34lm4pYwv7kXO/m9p54R8KbA+hS0/Zz+RXPE7R0dW
         E9xnhhMgbWe/DYW+pXl//z1Ik0dwp/7QeeY/Ao2fg0vLRUXOneTzRVTyYIntfeXX0m6y
         z0JJOaIr5ot2pUCNFok8KZUhTTYWqIplniCOcceXVHq+SrlBsUqskXaMoueEvICDElCQ
         3Qyy8iVE5qE51O8yhU6ePpyv0db6/gZzpX62caB92kHKZ+RWDrC6ewUc+GtskRGzwH+6
         QyoA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z20si2123811ejx.1.2020.01.06.04.20.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CK0pc011091
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEq029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:59 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 18/38] core: ivshmem: Rename ivshmem_data to ivshmem_link
Date: Mon,  6 Jan 2020 13:17:59 +0100
Message-Id: <b39cefdd3d37de18bd854c70d4872f75e9f214da.1578313099.git.jan.kiszka@siemens.com>
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

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index e270582d..ded50a20 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -57,13 +57,13 @@
 #define IVSHMEM_REG_LSTATE		0x10
 #define IVSHMEM_REG_RSTATE		0x14
 
-struct ivshmem_data {
+struct ivshmem_link {
 	struct ivshmem_endpoint eps[IVSHMEM_MAX_PEERS];
 	u16 bdf;
-	struct ivshmem_data *next;
+	struct ivshmem_link *next;
 };
 
-static struct ivshmem_data *ivshmem_list;
+static struct ivshmem_link *ivshmem_links;
 
 static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
 	[0x00/4] = (IVSHMEM_DEVICE_ID << 16) | PCI_VENDOR_ID_SIEMENS,
@@ -317,7 +317,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 	const struct jailhouse_memory *mem, *peer_mem;
 	struct ivshmem_endpoint *ive, *remote;
 	struct pci_device *peer_dev;
-	struct ivshmem_data *iv;
+	struct ivshmem_link *link;
 	unsigned int id;
 
 	printk("Adding virtual PCI device %02x:%02x.%x to cell \"%s\"\n",
@@ -328,20 +328,20 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 
 	mem = jailhouse_cell_mem_regions(cell->config) + dev_info->shmem_region;
 
-	for (iv = ivshmem_list; iv; iv = iv->next)
-		if (iv->bdf == dev_info->bdf)
+	for (link = ivshmem_links; link; link = link->next)
+		if (link->bdf == dev_info->bdf)
 			break;
 
 	id = dev_info->shmem_dev_id;
 
-	if (iv) {
+	if (link) {
 		if (id >= IVSHMEM_MAX_PEERS)
 			return trace_error(-EINVAL);
 
-		if (iv->eps[id].device)
+		if (link->eps[id].device)
 			return trace_error(-EBUSY);
 
-		peer_dev = iv->eps[id ^ 1].device;
+		peer_dev = link->eps[id ^ 1].device;
 		peer_mem = jailhouse_cell_mem_regions(peer_dev->cell->config) +
 			peer_dev->info->shmem_region;
 
@@ -355,17 +355,17 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 		       "\"%s\" <--> \"%s\"\n",
 		       cell->config->name, peer_dev->cell->config->name);
 	} else {
-		iv = page_alloc(&mem_pool, 1);
-		if (!iv)
+		link = page_alloc(&mem_pool, 1);
+		if (!link)
 			return -ENOMEM;
 
-		iv->bdf = dev_info->bdf;
-		iv->next = ivshmem_list;
-		ivshmem_list = iv;
+		link->bdf = dev_info->bdf;
+		link->next = ivshmem_links;
+		ivshmem_links = link;
 	}
 
-	ive = &iv->eps[id];
-	remote = &iv->eps[id ^ 1];
+	ive = &link->eps[id];
+	remote = &link->eps[id ^ 1];
 
 	ive->device = device;
 	ive->shmem = mem;
@@ -426,7 +426,7 @@ void ivshmem_exit(struct pci_device *device)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
 	struct ivshmem_endpoint *remote = ive->remote;
-	struct ivshmem_data **ivp, *iv;
+	struct ivshmem_link **linkp, *link;
 
 	if (remote) {
 		/*
@@ -442,11 +442,11 @@ void ivshmem_exit(struct pci_device *device)
 
 		ive->device = NULL;
 	} else {
-		for (ivp = &ivshmem_list; *ivp; ivp = &(*ivp)->next) {
-			iv = *ivp;
-			if (&iv->eps[ive->device->info->shmem_dev_id] == ive) {
-				*ivp = iv->next;
-				page_free(&mem_pool, iv, 1);
+		for (linkp = &ivshmem_links; *linkp; linkp = &(*linkp)->next) {
+			link = *linkp;
+			if (&link->eps[ive->device->info->shmem_dev_id] == ive) {
+				*linkp = link->next;
+				page_free(&mem_pool, link, 1);
 				break;
 			}
 		}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b39cefdd3d37de18bd854c70d4872f75e9f214da.1578313099.git.jan.kiszka%40siemens.com.
