Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBOHGXKAAMGQEO4Y475A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95C30249F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:02:00 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id u9sf2718937lfm.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:02:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576120; cv=pass;
        d=google.com; s=arc-20160816;
        b=tFv3lZGcjIOOOtL5WR3xF6y7Nmh7eWSzvjhyntE2Z4FWsH4BMHtzKvyLsXUCIg7Ls3
         DFzhkw5sVmRPtEe+U9bDz0N/TQJM9GXb1mk8Hch5xMkmUSk2JtAFvEn2xH9SA7a5bvLy
         KIX9vfxCzOM5/oQmHe/rVtdv87oWWChJTUtNTHFcB2H8QkoxbFvy0Hg4qTXiAOtWh++3
         Au2BBkVESOJgL2CPrpPq3ue8AjnBGNrIm5r5WYKpout90d9w7oFNR4yppv+KZWPKQxYI
         rnf6Sn4i0Z2UwSBtqokMGOxznzKGJkQXmVKPo+37tVjA4Nl2sTYCy8J6o7zLyzxGrQR7
         ZHhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=l1a9wg2QXvUSPYAg9pTCuhbQxKrdgvC8uTzVn05e3YY=;
        b=OPjCLun8cjB3Ea7FZB84meH33vnCno/RruRf11aIVQ8l8L5W9qfL6pX6oA9xlBvCN9
         JTtVNofHPEV4YRQPmYMWBJVtLEwONSXn/ptMxROWvYSatkU3kvek1nlQ+AZdYE9tbZII
         BtEhaHfer441LW8/0sdZ/b2mnpZ4hCWTZHMAtJRBb7hupsOOcUkQ47GpBCVJBeEScNVb
         hRWfNTudNal5tmCRZ5UJGObO1b4/lytPFmSbLw0Wk47iGTep4CQGQ2ZTPR9cHaHR01IT
         MpsPwvtfQQIl1SF2vJLoRP6JFRq4GxstQIQVwkIcv+q0phv6htsoqStuvprHCA0WgZci
         23GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=B5n2+f1l;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l1a9wg2QXvUSPYAg9pTCuhbQxKrdgvC8uTzVn05e3YY=;
        b=pSAKu38UDfEv8JfP8TInQ+RLc6NYQTFZnxMvA/StjSrXc1XiRMKjHqw3qxhdbxiAxQ
         a2H4wjgEfXebd7IJgNnxYusVELWVj23Le1qeL6N8OMFQvAMlg8f4yntyh6Yo0H8Wi7Lf
         7w6df1pnyaevwtJwE/qBbIHmaeeNrPW3Ii9fBuNTkAyhTskbPexZmeT9Ut6rbIDvHMUw
         hKKVC8WISzN3CsrvWoVjPFDy9fsUWAHA+qY9fEYPZN7tZxw0iLXvJw3ib3CGI/pRW5a9
         EoUDr3mLMmXUn0/8VZK/NrgLbARHcKY1s43LpfdMS4DqLQT4GM8MEhT2kUf1nPGw6d8f
         HkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l1a9wg2QXvUSPYAg9pTCuhbQxKrdgvC8uTzVn05e3YY=;
        b=EeJXH0W0E84jjd6JNid8Jpc1Y5ZDzKPKoyvkF9cWWqpJx0s6zHi/3jB/9zyWPkYApZ
         G5y+kzRRZwnItzxCD2aIk7Fh5yuwCFWZ6QAJeLBgI6B6kuH5ZJZKZfuepJSwE1FJ8VCo
         K6MpVFWW5TyJbPuWhGXDGq8XShxXkESFHrpZV8Sxf1ERDTaNqS3MGMtJbdCv1qBiT7Y5
         PY/W8gSYZn3t6Z2RNCADZHLQn9+H2DG8GgobSmI6fV3IxgMOcdCl0mdpNeldc6gKEgUe
         rScPNky3nNmhBD7bmjR0kGL5arkyXkI/dg13SDHLPpwlKkCe1EIYWZ7xU/wwOXX73yDR
         HyFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531+PQXjC0V+JLEnYQd2BR5xfK/WyAhLZOKE7M4thupyIPT3CXGJ
	xraMVuK95eimqU4A+4PG2G4=
X-Google-Smtp-Source: ABdhPJw6jMrI/wc/V59q+RjhY6cRviBgf6IWZrxQFWspb2zqnFVb5O2B6Folm2qjnoXCOKSv3NhQ1A==
X-Received: by 2002:a05:6512:3194:: with SMTP id i20mr109415lfe.283.1611576120269;
        Mon, 25 Jan 2021 04:02:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls4216268lfu.3.gmail; Mon,
 25 Jan 2021 04:01:59 -0800 (PST)
X-Received: by 2002:a05:6512:989:: with SMTP id w9mr128278lft.246.1611576119402;
        Mon, 25 Jan 2021 04:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576119; cv=none;
        d=google.com; s=arc-20160816;
        b=1JV16M8xMQjXJhK6bGPGbRsEprgHIz6PqmNS49w9B+Kc+Rw+I3ow2YywIxbjaToc3c
         ijjdDfICBHddTDsXA6E87JoVWpBYcTtWIkV7Qi0cUEDIUG5rzq5OQfu7Cub3xkMCmLMZ
         WvCTy51IzMnD7DbH+QU65WEz+nWqCRW1fiLhPcSUyRjXozqaeu7CYQR/BN9fznJe8nVY
         FEpfcgxCPe407shNTQwSZu0Po8+A6CVctH24mkggAtpRT24Q1byUOrSYYI0ewTjPAwjn
         BT0l4OFk/02C6IrRyDO6WVqAynuKWIIEiPodwCZXhzE/vfiwvbuzynmiWl+02QgHjQTp
         M3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vQ0AEqX3UjhTrlBNneuwal2jKFZP837ztCSYlylxYWQ=;
        b=Q8g4KVUSV3xyqVv8Z5QCqvE0Ti4sOt8faa84hsoil3+cyw8Nz2gmKADYwfQmfw6xGI
         WnszYa2Pu8TQf/o5JFJAjZq2fjJwGNO/KzyvIqzo90/njLzHHITuJMktZGa8yEiDSFmy
         txrd5sbnnZUxyGoDj0OKBt1W0zBxSvidmeo7nqTWlXhH9jRpemTePqz0mJnM6ocpE4/8
         Ux5VPp5Ot2EEx+keZtqVm4ZSAI7AFkW6TvRJz5T6dsql1S/FEHYdC+0JL5ltcDs9WfY8
         vPWv+yQKpr4esoL6tR6LHfzHP0F1IlzOoC/wOn+F0SHvQf4nS8JlwMLqtIZbInhV7Jxf
         6FWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=B5n2+f1l;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id x8si762089ljh.5.2021.01.25.04.01.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:59 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT4Q6RxWzydg;
	Mon, 25 Jan 2021 13:01:58 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id z9YO-91smGEp; Mon, 25 Jan 2021 13:01:58 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4Q1YPQzydb;
	Mon, 25 Jan 2021 13:01:58 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 23/23] hypervisors: identify when using colored/non-colored (re/un)map for root cell
Date: Mon, 25 Jan 2021 13:00:44 +0100
Message-Id: <20210125120044.56794-24-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=B5n2+f1l;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/control.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index d6ede805..10f8a271 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -300,7 +300,7 @@ static bool address_in_region(unsigned long addr,
 	       addr < (region->phys_start + region->size);
 }
 
-static int unmap_from_root_cell(const struct jailhouse_memory *mem)
+static int unmap_from_root_cell(const struct jailhouse_memory *mem, bool create)
 {
 	/*
 	 * arch_unmap_memory_region and mmio_subpage_unregister use the
@@ -316,6 +316,11 @@ static int unmap_from_root_cell(const struct jailhouse_memory *mem)
 		return 0;
 	}
 
+	if (!create && (mem->flags & JAILHOUSE_MEM_COLORED)) {
+		assert(tmp.colors != 0);
+		return arch_color_unmap_from_root(&tmp);
+	}
+
 	return arch_unmap_memory_region(&root_cell, &tmp);
 }
 
@@ -347,10 +352,21 @@ int remap_to_root_cell(const struct jailhouse_memory *mem,
 			overlap.phys_start - root_mem->phys_start;
 		overlap.flags = root_mem->flags;
 
-		if (JAILHOUSE_MEMORY_IS_SUBPAGE(&overlap))
-			err = mmio_subpage_register(&root_cell, &overlap);
-		else
-			err = arch_map_memory_region(&root_cell, &overlap);
+		if ((mem->flags & JAILHOUSE_MEM_COLORED) &&
+		    (mode == ABORT_ON_ERROR)) {
+			/* ABORT_ON_ERROR signals that we're loading the
+			 * cell, WARN_ON_ERROR that we're deleting it.
+			 * On deletion, we're already taking the right colors
+			 * into account.
+			 */
+			overlap.colors = mem->colors;
+			err = arch_color_remap_to_root(&overlap);
+		} else {
+			if (JAILHOUSE_MEMORY_IS_SUBPAGE(&overlap))
+				err = mmio_subpage_register(&root_cell, &overlap);
+			else
+				err = arch_map_memory_region(&root_cell, &overlap);
+		}
 		if (err) {
 			if (mode == ABORT_ON_ERROR)
 				break;
@@ -532,7 +548,7 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 		 */
 		if (!(mem->flags & (JAILHOUSE_MEM_COMM_REGION |
 				    JAILHOUSE_MEM_ROOTSHARED))) {
-			err = unmap_from_root_cell(mem);
+			err = unmap_from_root_cell(mem, true);
 			if (err)
 				goto err_destroy_cell;
 		}
@@ -645,11 +661,7 @@ static int cell_start(struct per_cpu *cpu_data, unsigned long id)
 		/* unmap all loadable memory regions from the root cell */
 		for_each_mem_region(mem, cell->config, n)
 			if (mem->flags & JAILHOUSE_MEM_LOADABLE) {
-				if (mem->flags & JAILHOUSE_MEM_COLORED) {
-					err = arch_color_unmap_from_root(mem);
-				} else {
-					err = unmap_from_root_cell(mem);
-				}
+				err = unmap_from_root_cell(mem, false);
 				if (err)
 					goto out_resume;
 			}
@@ -727,11 +739,7 @@ static int cell_set_loadable(struct per_cpu *cpu_data, unsigned long id)
 	/* map all loadable memory regions into the root cell */
 	for_each_mem_region(mem, cell->config, n)
 		if (mem->flags & JAILHOUSE_MEM_LOADABLE) {
-			if (mem->flags & JAILHOUSE_MEM_COLORED) {
-				err = arch_color_remap_to_root(mem);
-			} else {
-				err = remap_to_root_cell(mem, ABORT_ON_ERROR);
-			}
+			err = remap_to_root_cell(mem, ABORT_ON_ERROR);
 			if (err)
 				goto out_resume;
 		}
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-24-andrea.bastoni%40tum.de.
