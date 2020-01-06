Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4OLZTYAKGQE4WG5QGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0F1311F7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:01 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id u12sf27042448wrt.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313201; cv=pass;
        d=google.com; s=arc-20160816;
        b=V8Sb1KCzArXzWeLNv/IKjaENSI1iNQymYBiDQZho+5bfAPjlJNH98bSET0xDq0h0/y
         5LB4ajn1+CnHKmDFgpgjwgoa6Onkb/L/g4vr8vsPBItagDJPzDGEiKBEp6NXOjSFheyl
         S5kc1oAt//J6OYkW31RYF08cxdE5Ol7Bu9u7jN3zbI3eYjIfWktawhYgB0oIvNGjZ19c
         HizJG9ND2mzIRy+BZAmVAyccWyO1GJgHpdIKHAyrkrSnZrL6QN2nkaumtjgqjdT9y/LT
         W2zmWIr3434wwoPTBB5ZuBRkKkO1HGA5U0KN0pN7jUaB8UEB0ovxCVDjXu7WMqw1J7kq
         +bGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=r3dSATxvsPwaCzkdCIhR2ttL6vZtTksYSAJEUeVMROM=;
        b=bn8rmhpTPAnlxHbrGmAOpRZyBYsRV1EEkn2vOB/iz6ptJOdAHxhvosygbOo4Z7lVGb
         sRmMhuVDjCz3rqX4YqL0439HVL7rVn9gZsAFt0KxnIoRBVx4JVzeNdguJ7IS0C/Jho/p
         hbo0HVvuDpikPeRCS26oRgN85xoJRYwJdlnYbcuzo33rfieiT5ihWoR+jTOI4CoWqYlX
         9nIshEL9d5FbbHVCRJ8z69DL8yaCBsnjZvXKIJk1UKZJHV2VusMvMdl9MYYks2UQLTVi
         jYwlkGiyZ38GZl7sCOdgesA9XecpHc3tpvM2Vfs+tGlVqLp2Y2CQu2suEXl8h8PjksYX
         9YIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r3dSATxvsPwaCzkdCIhR2ttL6vZtTksYSAJEUeVMROM=;
        b=TznNXR33dtA/Q7pP0gFe6bUzzHMsqFIV3ixA9bK7RS+iBn8ahuebBfbjiPogfAQlUP
         dlfBNtF9gv0kINmPS7zZndQoZuu8ku4iOI9Ys9Frj4BsdjayQDBHLW7zg2mU/VfhgH29
         DE1ILC68hda/Y9VhlxlKnQ/zBM3yJArTaXjc4PhmTMK3m5GR/so/kD5ZLqadFTaSZD5Q
         dD/tJ2/r7Z7HGR0PTxkDMTsFtH5htf4Nk4ktUmD+NwvtDJrFe3Ef7Js0Zt8p8q63WYbk
         AredqJ76WkRBt/pWphtFBxk8ByU3K9f08yPOIXCSzyzKVeRmD0/bbwegBU5WlXRGv7wu
         gdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=r3dSATxvsPwaCzkdCIhR2ttL6vZtTksYSAJEUeVMROM=;
        b=UWkftscOYexLaRqjd6XZlQVlwuGqASEh2cXvE9KfEehwIdesYNwPvJnyqv23Ft2+fa
         GSwH+Q3LKFwio1hgyPWD7UTfu0PZ7I8CjmqodofkV9yseNgnXXfbVCJkrciuwg4c8tEb
         CNharPbFEY8e5QbSNyyrQrFz8VyD62eocn9kqrFlCf5/3wxKeLRWMsNpbXMyNpbcSyWx
         n3Sh3nqe4Yq3Mme81iOKP+Jggr5N7H5qbdpnvSSWvimqspDBlhdhPhhjIJgbfztsUtyc
         LjOFzLfFKoYbtjOPl+7WrH68pN7dupQJd7ZHF+MFfO7VaaYJqtIIKunuyTrL8t0FD/YB
         BpRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUIJpzFjMmqcelPBsA8x/3rK5aA+PupEdq31b0DV1dNxNwzuqsU
	0LUmC3YbwDvzwajIM/n0brQ=
X-Google-Smtp-Source: APXvYqwYaANP32YqAMu8vmKtRk4VxTbRCB6DiYD696lsHxditZ+VPMRQ3xLRl5XR3j2BRY992WDgFQ==
X-Received: by 2002:a1c:720a:: with SMTP id n10mr3252771wmc.74.1578313201341;
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ecc5:: with SMTP id s5ls12868269wro.12.gmail; Mon, 06
 Jan 2020 04:20:00 -0800 (PST)
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr32099257wrj.357.1578313200644;
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313200; cv=none;
        d=google.com; s=arc-20160816;
        b=NgmMOLo/8kBYTvo5Y4Mmu03ZkOXZmyjqjDBX2AIgVcex0NFp7lXncDErWaENigCMEG
         eMtbez0GUrYSBfNT3qQ9BIFbFG7KzdhIUfQyPEDoQrKEOVZAP4MNUJ89mTrF0e21EjXG
         tLoZyt/DwC2ljOKFATkwdCWONlUMXLC3ZkSSr5Arje0CChrzAQT7GDPvs3CHRd/+Cvep
         Th8980ZDfurR9QMv+6psq1n9c++C2ArxwEu3wP9b+x6gT3FNhYCDqVr6A5PlAlgWncqz
         /2F+leyF4dVjri4QVw9G5m8kLQgp+shvIBdC4FKjKK2vCY1BAN4NFDAMUPEY9v6ozYQA
         WlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=h8pnZM3Cfq+1+MtXzR9Y1XE9Hr50eR+SEcfaFwRF5ZE=;
        b=lhAtS7EoTAvYqCcLIera3TdVACZ1o3KWTu0ffNwJDF/pSXnq5U6t5cWw4fOHMitmgl
         2chK/koHcjkaiuCjn2hjypa3/e/i8AYwruVx5q8gjk6sOrwrIkotzDUpmVULw7wSM+WV
         wIGprUeSsv49FfFZVJwbJNgSAntnBrBjAMs1lLvUvtmuYhOldMOeTDZ/wzmZaxqID/1H
         qd5iWtuVjBWFy3DJ8A4HOjc/U6Dqh6Ig8unJGb01ym9V99f9cldQ1A/Kxe3r7lOwDs2B
         DRLgyWVoAV7kPZHbb2RAxyzy0m+xVNicJ5p5DnTgNjcs/+7h974DhNc0yNqhjB4iqunm
         YrEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id o139si842729wme.1.2020.01.06.04.20.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CK0oC011099
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEr029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 19/38] core: ivshmem: Avoid assumption about size of ivshmem_link
Date: Mon,  6 Jan 2020 13:18:00 +0100
Message-Id: <37226ed0867dcc416dab440370814d543a632a27.1578313099.git.jan.kiszka@siemens.com>
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

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index ded50a20..b6f60d25 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -355,7 +355,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 		       "\"%s\" <--> \"%s\"\n",
 		       cell->config->name, peer_dev->cell->config->name);
 	} else {
-		link = page_alloc(&mem_pool, 1);
+		link = page_alloc(&mem_pool, PAGES(sizeof(*link)));
 		if (!link)
 			return -ENOMEM;
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/37226ed0867dcc416dab440370814d543a632a27.1578313099.git.jan.kiszka%40siemens.com.
