Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTHUT3ZQKGQEDT37SYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF941802B8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 17:03:25 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id f3sf1450438lfm.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 09:03:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583856204; cv=pass;
        d=google.com; s=arc-20160816;
        b=SSdF0+DGIlL5l2fyy9AsvXupKtghaX/BcEd7uINgpOGirDdJ3y+K0U2aoepsDQmAht
         SeBJXGqqlTr5AkQqejRErWbPItf/zfT3QNMY6pxK8xlcfxydVwKh2UADZ5BCI9U2ypm3
         vN7U3c+rGNUIexiJTqiRxqIm5EIXMRYGgiVLE1fBgKDS364HsJLtTgDu6vITe43S/XH1
         a2ShFCnubli5SpHoWE33V69GsoqkcRaNi/zDpCls1hSiaBSo/omeyfNqkfiiC/NgcFu3
         F3/WT0OlqqGDoiXI7hxTxjrWpWeRsGoONpS2fp510d+11yj2bWZcrxyiVRwCFTxHlUQ0
         ULiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=ba4JGt4gOI6yZqPC+L792yt3JEeOHnYsr3A3AyJJcck=;
        b=vRGFC7ye0Q6nEZPbD0WEfrtpzR/OjkPFUj6w8/JWatViA2jWswvLaYMobmW+oagmTN
         SrtmkQHfYdG9UVo/0p5JtOkQVT9nu0XwUFcgPsMk5Z27cMGpLo7GsUFgGW2LQdtkrFje
         kbSi7864qF1Wr6p8N1nGl3T2DpdSEr3azF34zfc6UYQquMYR+UfYAmAHUnek81jgMLVT
         70JIY6npOt5sgFJT3wYY5S8RczJOZUveAo3OeRHA++eQBVFwf3wQ05+b/gqQInBuCl9j
         EkgZL5/LAERilKHMXu9mMpIQ8LS3uSBn2Nbq/07HV+Wf4ppPwmcy8yie7sXoLHmR0pQm
         jvvw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ba4JGt4gOI6yZqPC+L792yt3JEeOHnYsr3A3AyJJcck=;
        b=AMRE6jiNSRRMg4o5TPUzRLwY85LpEvjG/7flqQm66/pr0XY/aiGJ9w2GbN0xS3yT1w
         t7W5FVQ5WuE0PblfxyAxVn8gszttuacf70W43oAdILN5IiGnwpQqQ/OmGkBUGBvjgK1+
         00ow/wOOmdIaa8R8Nz4DbRqyzEWEMvoIi7dATRPS4ZGBQogD9VEeq6QnUoHWMP+8BKkt
         5OrsXSU2cODTAsUsv64cBCxCJdZK5NM78UDnChhPmbiiTDYXtv52KNRE5LewPiSQ9PWV
         RWHdjPuc3FinJRUpMc67u1T6z7wh+iuqN5EMxOXD2YQYMi8vV0p7wUzFf2rxqn1xotHG
         7WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ba4JGt4gOI6yZqPC+L792yt3JEeOHnYsr3A3AyJJcck=;
        b=iJrfEYrwReD/Vh8JCP6P0OhnHcmO2g+wGY2wgRC9G4Nv8n9jP2Y8ypd9dHQqchUvnL
         OyNG2DXpDuT1FFnC1eA7ux9yed0PLnw3igJHwwIx0OK7qpTRyQ8KMSZNPFy4saT+3+yz
         9kgCQFsM6CgS+DUYby7rIWwyT/gR8ZLW3u+x7mk0gyhlgrlkn7pXA41W0UxsCSjtXq04
         MWiTrRFvqNpCvZ08+q9FietWPEkRzF0GfbxC+70q++NhmhjBogjuomRboVKDdk4fk3ru
         hmxz+w4M2A7oX22w5VQaCi6qUUL01WilBsogB7cq9ETj3Cfnnd4qGOkpvZVKu7+spzDW
         Khxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1M2JHjK5YiZnTMvZueHSq87J7cIZCBuG/0btCJgpZ32Ymx9RGk
	edaZ4o7fOgWZR6zMTPxHPpE=
X-Google-Smtp-Source: ADFU+vvY9UPAhSUKgLqpqnj//EMm/omDiVdZfkKbuQykIqMqTrn6KvqvG1vJBvV5dAOlpTXGBrW4Ag==
X-Received: by 2002:ac2:50cc:: with SMTP id h12mr12069456lfm.128.1583856204637;
        Tue, 10 Mar 2020 09:03:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8583:: with SMTP id h125ls1862824lfd.9.gmail; Tue, 10
 Mar 2020 09:03:23 -0700 (PDT)
X-Received: by 2002:ac2:42d9:: with SMTP id n25mr12811236lfl.97.1583856203557;
        Tue, 10 Mar 2020 09:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583856203; cv=none;
        d=google.com; s=arc-20160816;
        b=qrVWmJFd0ZLTx4sfgKzwM2Bu6cQdOw+ajmDDhO67VL6Z4ofU/H8nINRfyAm4iLb1fT
         jsJ5LZyuLgs0RMlFuYKpu6vGh29QJCgznnrfNP9uCbMm0Tku8AwQ2dFCGQJVcjpOy1On
         TKmAWYMzQAlbW+N9ASWLuueaXLde2nfBRniql2fodKVg0F8BEdPXPZDcV3Pl3mWP62qC
         KcL9J+3ib6VZOZbd90amiqtMt7hjxG0ad/sAT8f1iZoyXBtVa0jG3+7T44S/M2bJSXxC
         jgRgakws7oUwcD1RvCgeBvacjP52RQ+UWWMJdpvfEmQZhy9XOPRmwiWOUJQmhmQpmkF5
         ITtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=xDItGrkh2vY+YpgGvu1aXIcHSBf/uWfDwWTpUfHyD2Q=;
        b=bBNXseDFwy55A/cYZBjsKoMaMUZCvqvmdTgA4Cu2s+7d/HVIGDi6D5VBAgWKsq9xwM
         p/Bn0mG/EDraq48iddzX8bpNi+l1Zq4Tge0dLsHHrVvhbbZjkcg1M9M6HyWpqXUtQ1zR
         2205iactJpgiAIPfjnHj9F/fj53EeEic8AaKRJrL0Osh9AH8XA0ArM8AigD7fSL064BX
         b7BUKeWHg5gwYIfZ6Tl6vrOt3LiBGZD0Kyn8R3aKpXsss6bCZ8SKQ7aMK3kvb9hNPZhb
         PCT2adKNWaKDOCsO8zo1yXYaOXw37cIwvbIjuGG/BD5PM1E8hrlyej+ishR5gXfTVsdq
         LcLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d12si572961lfi.2.2020.03.10.09.03.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 02AG3MmI000880
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 17:03:22 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02AG3ME5021594
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 17:03:22 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] core: ivshmem: Clear state table on first peer setup
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <f9552a2c-a972-3e6d-b803-6f3a9913c1d9@siemens.com>
Date: Tue, 10 Mar 2020 17:03:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

So far we only reset the state of the added device of a link, not that
of to-be added ones. This could expose random state value of upcoming
peers until their cells were actually created.

Fix this by clearing the complete state table when the first peer is
initialized.

Reported-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 22283a85..084c233c 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -101,13 +101,8 @@ static void ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
 	spin_unlock(&ive->irq_lock);
 }
 
-static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
+static u32 *ivshmem_map_state_table(struct ivshmem_endpoint *ive)
 {
-	const struct jailhouse_pci_device *dev_info = ive->device->info;
-	u32 *state_table = (u32 *)TEMPORARY_MAPPING_BASE;
-	struct ivshmem_endpoint *target_ive;
-	unsigned int id;
-
 	/*
 	 * Cannot fail: upper levels of page table were already created by
 	 * paging_init, and we always map single pages, thus only update the
@@ -115,9 +110,20 @@ static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
 	 */
 	paging_create(&this_cpu_data()->pg_structs,
 		      ive->shmem[0].phys_start, PAGE_SIZE,
-		      (unsigned long)state_table, PAGE_DEFAULT_FLAGS,
+		      TEMPORARY_MAPPING_BASE, PAGE_DEFAULT_FLAGS,
 		      PAGING_NON_COHERENT | PAGING_NO_HUGE);
 
+	return (u32 *)TEMPORARY_MAPPING_BASE;
+}
+
+
+static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
+{
+	const struct jailhouse_pci_device *dev_info = ive->device->info;
+	u32 *state_table = ivshmem_map_state_table(ive);
+	struct ivshmem_endpoint *target_ive;
+	unsigned int id;
+
 	state_table[dev_info->shmem_dev_id] = new_state;
 	memory_barrier();
 
@@ -441,6 +447,9 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 	ive->link = link;
 	ive->shmem = jailhouse_cell_mem_regions(cell->config) +
 		dev_info->shmem_regions_start;
+	if (link->peers == 1)
+		memset(ivshmem_map_state_table(ive), 0,
+		       dev_info->shmem_peers * sizeof(u32));
 	device->ivshmem_endpoint = ive;
 
 	device->cell = cell;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f9552a2c-a972-3e6d-b803-6f3a9913c1d9%40siemens.com.
