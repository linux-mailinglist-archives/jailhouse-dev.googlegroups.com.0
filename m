Return-Path: <jailhouse-dev+bncBAABBSMUV6QQMGQER2OOULI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0606D5906
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Apr 2023 08:57:15 +0200 (CEST)
Received: by mail-ot1-x33f.google.com with SMTP id r17-20020a05683002f100b006a131178723sf9530212ote.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Apr 2023 23:57:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1680591434; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vd7QGwAvZ+g6B8N/ODIQrnl8Cfqya0uL4qEQ5hXzNyXDtp7xm8yJZUnv+9+2X+Q2cA
         NS+4iJA+xCHbh7jLHRcLLothmofRgWJD2onO/XaaUfRIFGhiv/ecMIl5EcFqIla4GV/Z
         d10yr3v/Oq79yV1vi9qq7T0nNd6LhQPdHRD5Dzz39iOB0uhdNliMkh5z8xbkMkGztNwv
         kOG19Ba1TirKCOhuZYlcONLeW+adU/laRC9CjxxD6qidmi6LjIYAVSFLO+FVj5JSazV/
         Td8Mfx7vVNHKbsbK1rclg8UMghKP3x5v6VNkbxfoOJy22C1hw48EUTE0rArAxR3LVQMJ
         Jynw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=l9frBmVCwrqYEWoaK1UIvInbcCv/q2WeMDNC9Xc3sO4=;
        b=h1jQYgCRuZVuE2tJg7QHCZbbP00OurQKRgFaCaX1YnXtKCKVuq65kcXsOOjOBHxTNY
         bvZm7h9MCZP8xIaYAtcdLoF8/iWLaO/PWC6++2v2X4TH4qAiikvQ/4liUsUEoYCBHqNd
         DOro84KustxnqmkpV7+dfz6IA9t7U2zOlWcn8xVUmNClNNqmyOYjLptGyVxAX2Fxahlo
         8L7CdeaMlsYUZObsSwok3J4yqkio444FYMPI5LXA2+3HXgrGYuvlMeUqH5sQxuvGttfM
         fLuLzCUnu+AnQbI4g3T53W0o7EXWpJmPHhdVSMIt00icl3E/+GZ53TrDUkv4CSmkmY4h
         7o6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of zhangyunfei@kylinos.cn designates 124.126.103.232 as permitted sender) smtp.mailfrom=zhangyunfei@kylinos.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1680591434;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l9frBmVCwrqYEWoaK1UIvInbcCv/q2WeMDNC9Xc3sO4=;
        b=WVWaPBvDp68rOdycbOjyRHosCwrprc1irmwXsd2KirAA/vXSOjv2cAWyrCKpfTE8RV
         I4uEJKCRq9vGxsSgVuqxDmgn2oBhtFou5HsHJgvr/6oluE16fVv5J6giqCj/OXTgI+r6
         nB2feL4rzH69kZVsaGd86JiUALTuz+54H+iBTq+mxRczjbJ1WKb0GHKcRX75JaOX5ck2
         nnCy4jpHcX7znjp+LJzWFZRE10pUJSQtEeyRhfkCRlKu/ihmzvFvFaCgtBTr4JYcJTOE
         cHl/74b4sC0MseXdKRRtygnyaExqdAFEJELMR7bpFAvo5cJJQsqprIWJeGnnEe8K37xz
         C7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680591434;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9frBmVCwrqYEWoaK1UIvInbcCv/q2WeMDNC9Xc3sO4=;
        b=XkVVORf6AdxP3ZQ/HCGf2HsbVB975b6T8mhQnmJ363dxxOOoGw9L4jupaZZwB05k5Y
         WEB+KD1zBHhOycribo6CfHQyDl+ttYV4fyucwPT6p79TfJ8gDbCROsbgc7JPF6NeLYOr
         ybk5/3QCVS08l5pXyRXDyzAhj5xZP43scaHcUhEvKmhKPFFa5JjjstF7Em/y7C1X488/
         7Z5MhHfY8oDGp3nGo6HlPqnjzOaC13cOBFiXi1CmbqwqaxSKk1KUzGpmHE0afgmxHpJt
         4sycV33XQbWBb6/vu11+lc8ePgwKVBNFdepgBNYQ7bJmhvE6tepvMJeGGpgaZUCnpa8j
         N2TA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9ftmGm/hlei+0LHll2gWsDeVuuS87U2gsJ33kIFUV4liOa0gd7D
	IIs4rCaYXVUtYJ4kNZhgzOE=
X-Google-Smtp-Source: AKy350Za0zzhN8uuIil36Paw0xBM3cTnJVD0fa+kihFHfMDnrtnP8LQgjAW1yPFE2W270lDS4wWXyg==
X-Received: by 2002:a05:6870:5817:b0:180:1f9f:923e with SMTP id r23-20020a056870581700b001801f9f923emr859185oap.5.1680591434460;
        Mon, 03 Apr 2023 23:57:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:f228:b0:16d:c495:95f9 with SMTP id
 t40-20020a056870f22800b0016dc49595f9ls5019119oao.0.-pod-prod-gmail; Mon, 03
 Apr 2023 23:57:13 -0700 (PDT)
X-Received: by 2002:a05:6870:8a0d:b0:179:95f2:56e8 with SMTP id p13-20020a0568708a0d00b0017995f256e8mr1260451oaq.3.1680591433303;
        Mon, 03 Apr 2023 23:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680591433; cv=none;
        d=google.com; s=arc-20160816;
        b=mQ8yv35CDkMK2EpXSlidy4sai2OjG7SjCoiC0ddT0F1ZsZJrySPdJGXEWiMwz1UzAB
         o5vAUn9SqC94vU25ji2e1el9GP4AwwqSjoKf30Z7w3zEabEAH8TYOXlv8sQHp74KXWCw
         o1yqs861+8f9GZckMGRSZUZvtr80DaJUvXD8WB+aPIq/PVcm3dBpFMRjx2hECZ0Ux3JZ
         oCO+b9rVudneuRTCOwARQrgIbaOqRWZX9vjdudgANLzFWNQtq72iNyDETL2QZl2F0dQV
         rIAbAOizZcv2zMEzf32SsmjMg2hUS/UiNosXyNrNx5iNRYpEjdzcT7yAvu9uokHhu95q
         v+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=F9/OrjOc3bwhKCjxMXBE5xmbtSSZjbWHPd2tUZUJFmE=;
        b=wp2puav2OQl6mJj1mtcsARGrr7Xbc5EodQv9SYzmKoLr1r7EUi0tgbBOGg4v+TwIog
         ds7p3bRRcDu5cCFYAlRRkHBRT6+YJZtRxMmgzhg5CzLnkezm9hrvk0m2MNorj8Zr85u0
         V0qGIS1e9/+v6Vob9GYqgDtiVT3HE79Y+hRgtT0VFjYatMFmcJ/l6myY1E2zrQ5Z5j8m
         EnGxfx1M8ShlOLdgwgjRubuLzmiyfT9jWOqozuqTV2ldC1LycLbqWBwfUhP8mI3daF42
         dBveAz6sfxvZWC7LG8OL0m4azaow3MCSo19PziXjtAsg00R05yp/mI7+I+iM9X1aMVZi
         msqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of zhangyunfei@kylinos.cn designates 124.126.103.232 as permitted sender) smtp.mailfrom=zhangyunfei@kylinos.cn
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn. [124.126.103.232])
        by gmr-mx.google.com with ESMTPS id oq2-20020a0568707d8200b001723959e146si1234553oab.4.2023.04.03.23.57.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Apr 2023 23:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhangyunfei@kylinos.cn designates 124.126.103.232 as permitted sender) client-ip=124.126.103.232;
X-UUID: 0e5a0b16db0a49c0adb4b22db8692416-20230404
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:2e0280ba-290b-4b8c-b0ce-1329396029f2,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.22,REQID:2e0280ba-290b-4b8c-b0ce-1329396029f2,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:120426c,CLOUDID:4f2a542a-564d-42d9-9875-7c868ee415ec,B
	ulkID:23040414515960O46NSQ,BulkQuantity:1,Recheck:0,SF:24|17|19|44|102,TC:
	nil,Content:0,EDM:-3,IP:1,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 0e5a0b16db0a49c0adb4b22db8692416-20230404
X-User: zhangyunfei@kylinos.cn
Received: from localhost.localdomain.localdomain [(123.150.8.42)] by mailgw
	(envelope-from <zhangyunfei@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1172300046; Tue, 04 Apr 2023 14:57:07 +0800
From: zhangyunfei <zhangyunfei@kylinos.cn>
To: jailhouse-dev@googlegroups.com
Cc: Zhang Yunfei <zhangyunfei@kylinos.cn>
Subject: [PATCH] hypervisor:mmio: Optimize subpage Optimize the access process of subpage and improve the real-time access of subpages.When subpage is accessed, a temporary page table needs to be established,which is too time-consuming and reduces real-time performance.So we choose to create a permanent page table from the remap_pool when the subpage is registered. In this way, every time it falls into subpage processing, it directly queries the established page table, and then adds the address offset. This saves the time of creating page tables each time.
Date: Mon,  3 Apr 2023 23:57:04 -0700
Message-Id: <20230404065704.92082-1-zhangyunfei@kylinos.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Original-Sender: zhangyunfei@kylinos.cn
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of zhangyunfei@kylinos.cn designates 124.126.103.232 as
 permitted sender) smtp.mailfrom=zhangyunfei@kylinos.cn
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

From: Zhang Yunfei <zhangyunfei@kylinos.cn>

By making a contribution to this project, I certify that:

    (a) The contribution was created in whole or in part by me and I
        have the right to submit it under the open source license
        indicated in the file; or

    (b) The contribution is based upon previous work that, to the best
        of my knowledge, is covered under an appropriate open source
        license and I have the right under that license to submit that
        work with modifications, whether created in whole or in part
        by me, under the same open source license (unless I am
        permitted to submit under a different license), as indicated
        in the file; or

    (c) The contribution was provided directly to me by some other
        person who certified (a), (b) or (c) and I have not modified
        it.

    (d) I understand and agree that this project and the contribution
        are public and that a record of the contribution (including all
        personal information I submit with it, including my sign-off) is
        maintained indefinitely and may be redistributed consistent with
        this project or the open source license(s) involved.
Signed-off-by: Zhang Yunfei <zhangyunfei@kylinos.cn>
---
 hypervisor/mmio.c | 91 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 75 insertions(+), 16 deletions(-)

diff --git a/hypervisor/mmio.c b/hypervisor/mmio.c
index 3747bf6f..489c849c 100644
--- a/hypervisor/mmio.c
+++ b/hypervisor/mmio.c
@@ -18,6 +18,23 @@
 #include <jailhouse/unit.h>
 #include <jailhouse/percpu.h>
 
+#define JAILHOUSE_MAX_SUBPAGE_DEVICES 32
+
+struct subpage_device {
+
+	u32 id;
+	bool used_flag;
+	void *mapping_base;
+	u64 phys_start;
+};
+
+/* Considering that there maybe fewer subpage devices,it is currently
+implemented with an array, and a linked list can be considered in the future */
+static struct subpage_device subpage_devices[JAILHOUSE_MAX_SUBPAGE_DEVICES];
+#define for_each_subpage(subpage, counter)                                     \
+	for((subpage) = &subpage_devices[0], (counter) = 0;                        \
+	    (counter) < JAILHOUSE_MAX_SUBPAGE_DEVICES; (subpage)++, (counter)++)
+
 /**
  * Perform MMIO-specific initialization for a new cell.
  * @param cell		Cell to be initialized.
@@ -308,11 +325,9 @@ static enum mmio_result mmio_handle_subpage(void *arg, struct mmio_access *mmio)
 {
 	const struct jailhouse_memory *mem = arg;
 	u64 perm = mmio->is_write ? JAILHOUSE_MEM_WRITE : JAILHOUSE_MEM_READ;
-	unsigned long page_phys =
-		((unsigned long)mem->phys_start + mmio->address) & PAGE_MASK;
-	unsigned long virt_base;
-	int err;
-
+	void *virt_base = NULL;
+	struct subpage_device *subpage;
+	u32 dev;
 	/* check read/write access permissions */
 	if (!(mem->flags & perm))
 		goto invalid_access;
@@ -326,11 +341,14 @@ static enum mmio_result mmio_handle_subpage(void *arg, struct mmio_access *mmio)
 	    !(mem->flags & JAILHOUSE_MEM_IO_UNALIGNED))
 		goto invalid_access;
 
-	err = paging_create(&this_cpu_data()->pg_structs, page_phys, PAGE_SIZE,
-			    TEMPORARY_MAPPING_BASE,
-			    PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
-			    PAGING_NON_COHERENT | PAGING_NO_HUGE);
-	if (err)
+	for_each_subpage(subpage, dev)
+	{
+		if(subpage->phys_start == mem->phys_start) {
+			virt_base = subpage->mapping_base;
+			break;
+		}
+	}
+	if (dev == JAILHOUSE_MAX_SUBPAGE_DEVICES)
 		goto invalid_access;
 
 	/*
@@ -342,9 +360,9 @@ static enum mmio_result mmio_handle_subpage(void *arg, struct mmio_access *mmio)
 	 *
 	 * Reason: mmio_perform_access does addr = base + mmio->address.
 	 */
-	virt_base = TEMPORARY_MAPPING_BASE + (mem->phys_start & PAGE_OFFS_MASK)
-		- (mmio->address & PAGE_MASK);
-	mmio_perform_access((void *)virt_base, mmio);
+	virt_base = (void *)((u64)virt_base + (mem->phys_start & PAGE_OFFS_MASK) -
+	                     (mmio->address & PAGE_MASK));
+	mmio_perform_access(virt_base, mmio);
 	return MMIO_HANDLED;
 
 invalid_access:
@@ -357,13 +375,54 @@ invalid_access:
 
 int mmio_subpage_register(struct cell *cell, const struct jailhouse_memory *mem)
 {
-	mmio_region_register(cell, mem->virt_start, mem->size,
-			     mmio_handle_subpage, (void *)mem);
+	unsigned long page_phys;
+	struct subpage_device *subpage;
+	u32 dev;
+	mmio_region_register(cell, mem->virt_start, mem->size, mmio_handle_subpage,
+	                     (void *)mem);
+	for_each_subpage(subpage, dev)
+	{
+		if(!subpage->used_flag) {
+			subpage->id         = dev;
+			subpage->used_flag  = true;
+			subpage->phys_start = mem->phys_start;
+			page_phys = ((unsigned long)mem->phys_start) & PAGE_MASK;
+			break;
+		}	
+	}
+	if(dev == JAILHOUSE_MAX_SUBPAGE_DEVICES) {
+		panic_printk("FATAL: Subpage_devices is full\n");
+		return MMIO_ERROR;
+	}
+	subpage->mapping_base = paging_map_device(page_phys, PAGE_SIZE);
+	if(!subpage->mapping_base) {
+		goto invalid_pagemap;
+	}
+	
 	return 0;
+
+invalid_pagemap:
+	panic_printk("FATAL: Subpage_devices paging_map_device error\n");
+
+	return MMIO_ERROR;
 }
 
 void mmio_subpage_unregister(struct cell *cell,
-			     const struct jailhouse_memory *mem)
+                             const struct jailhouse_memory *mem)
 {
+	struct subpage_device *subpage;
+	u32 dev;
 	mmio_region_unregister(cell, mem->virt_start);
+	for_each_subpage(subpage, dev)
+	{
+		if(subpage->phys_start == mem->phys_start) {
+			subpage->id        = 0;
+			subpage->used_flag = false;
+			paging_unmap_device(subpage->phys_start, subpage->mapping_base,
+			                    PAGE_SIZE);
+			subpage->phys_start   = 0;
+			subpage->mapping_base = 0;
+			break;
+		}
+	}
 }
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230404065704.92082-1-zhangyunfei%40kylinos.cn.
