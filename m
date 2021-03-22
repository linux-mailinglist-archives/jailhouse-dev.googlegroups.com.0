Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIPH4OBAMGQEUTMV2CI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83B345021
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:34 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id y5sf26615082wrp.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442274; cv=pass;
        d=google.com; s=arc-20160816;
        b=mu2lN9IG228VaB4xX5KIU/qPI/C08lKnSYg/eAj0Y5l6iiLDDs3tzArziWE2iZxnW4
         SzfOsHWgyYoDFjObHYn9HC/E79XsxRwyMxSx7cm7PPQdv7S3bKAzN3i6b8EFpkLyoUld
         YXY4IyextMuyilF6aEIYuHxTvapm/XGTy2+qGkk40xkbR3v1T3vhXl3NrrL38HcyoYKS
         ywSftnAJCk6hpgEMC4GkGlt8hfTMloGG95YamIvWeF8v4qthAqQM2wo6Gt5noh1xgFqA
         Meke0Vv6+VgXxIw3CKLcwpebDsnwAHZndhBo7Y78pnuJgHPn6CKC5Dves4KrxmIAMlWK
         Tbug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=K9mpzrJFG7FpQs8rrvO4ZZ49uHh+PIa52Ms5r1ysFws=;
        b=vCL+iy/2MlFsaCLnCbGnyX+NCk886jhxW6glNsfQkVY7JMM1GwFqXm2avONdhWAEAz
         oDHydF6xHVyQpKzfKLxMKhXeEa4+b1SpFBY/hd44h674oxVYlc69S7urjzCWm2DRY4CC
         8H1n4/fNel1JfWvL//ItczDDAssQVPMMMVC5hZbbpV3JE8+d1ta/2yeyyNekYUDWF8/O
         dS65XsqeLqTJ4Oh91HHWrYDyC9xD8gQRi7X/ErwgCrgURvalFphIpx/bmuce55q9xDSE
         TM7qx8TM7iF+R+Um82dlXwMhknJFOJDP/iSZ+iNJ7/YuvHAuMUgtgfuqhYVhPLQ63A3V
         sOVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=hh6MNapK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K9mpzrJFG7FpQs8rrvO4ZZ49uHh+PIa52Ms5r1ysFws=;
        b=A9vHPuSRkanFkG2399TkmFnWOps8KOWTnLSXe684IM/EKr19GanytqZL4SwbGwo2Xl
         77RXK2HUCnBzmqcQKAIUShPaFyLMhddDqYdtD0UcDp8u0elOfxAGQpgjnQXnZb0l9nBK
         KxHoBvxK+cu/2pIoz7Wcge+BYfGOX0wnH4v0FTD3Slt+4W7ooIXPcjkmelkZ9tVgnF1C
         wfTULLtFQz/R3JDF9knXOPpqqAW8SHfPU6ae0zDv4WNl7fx2kwlF8YIu7Z80UsKwv7Ce
         ikIX5XOd8NuiapWs+QJwasXI8GLY4KOfhFyevzmNlkocMvhJ8rOg8yrfulcRLK174Gcs
         dcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K9mpzrJFG7FpQs8rrvO4ZZ49uHh+PIa52Ms5r1ysFws=;
        b=aOPWcIaOB2PHutpo9GnM56ENSbOxMst3wNwW06PrhYOA0sxei4z9cEy08wIuvWsCXn
         74PcuXO5owOgAhOtFuxFpo3YrhCb10bQNajVltXeBSPeoJr0IRs8cni28pc+8a/NBM99
         TYLkOSyLMnRgqru3/9e/wtJB/4achXtn0kHjVgxMaI3VC4PZXKL+3wr8uR7bfgp/RvaK
         MYz+c09DkExrdmsy9qzFU4QdMrw+QiUphSXkJwroxfQpdG/0lnXPLG7MirLp818f7TYw
         oexWAI/x0AnS/k9u9VjGtxJv0MXGG686Txu84osWkibaJj0Xs+5l5MxuioiFqX/q/VHl
         hdtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KBdqN/jNKSydOlPkjBmQQtV2FUPgQVjwfbXnzYZASIVBCxACZ
	PuFb9MxVDwBEaap/li9Ddyk=
X-Google-Smtp-Source: ABdhPJy9VxDbGO0GE55BjF0o7wAMyGfFAs51anRKhrjz55CluA0a+rYbKWht8C9bITDuasErnjTZuA==
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr184086wra.103.1616442273957;
        Mon, 22 Mar 2021 12:44:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6a89:: with SMTP id s9ls894543wru.2.gmail; Mon, 22 Mar
 2021 12:44:33 -0700 (PDT)
X-Received: by 2002:a5d:554b:: with SMTP id g11mr153644wrw.411.1616442273162;
        Mon, 22 Mar 2021 12:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442273; cv=none;
        d=google.com; s=arc-20160816;
        b=fNlbZZTNvdScbXy2UqZhlrV+e41LCLiOG/rlNA0GC5pSd5kLpwD2pt0Ozv2ADqaGQP
         vLM98y7VNWwHk78M1HrxCkaZBzmBG/gBsgTaSy0lT1L9npBz5QkrYyAmSYnUraxskKAI
         mZCxpCuSeD7DOX7/974Gl6vHY6w4173WxCa4TXZIJNYomhxWLNg6EVIvwovCxBczRgFk
         JtY8TucLsjuysw9SHbP1ojNJIDM3EEtonIqB+avMYpLkEd91aVUPiUBxVOvPuQGbPzlP
         xA/S2zxwoqAmIlJFojRLhbi/nmwBN51CBpMDYl+CHBBjWW2izgIJGAsLUzlnwsWy03tU
         xRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XwS882UabW/qYNG5j0RPAqqJl5CFKRsiLUCpghrrNdM=;
        b=L9FatDxuXe4pDBdSEO0dZ7TRSh60xN6yla14cJY1bDqxFmnVXIcMpwSmdDjsSiS2gw
         FtTdX9NuuARAtrj8Audho8HnclwRnCtB/6Uzf1Rj1Sw1n7G5stj81X7bpruixoL4Ed7Y
         O30zU3BydIvaYZ+kUyy/pS1d6LtMfovkG1gSIl7JKCykRU6dWd23RqakPTEJiKpSSTs1
         YveuzlP+6KfQZ7k7YLhjm035HZLnm7/aC5wWYgEGJcek5CIpVFClNAnxFzn0yuPd+r8T
         3GUB5f6F7o5CHz3rRNHMFv50twzBtaogjx8xAmJbNBfR3U9lGWTpB/dFsZdvwGurIMqm
         wpNw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=hh6MNapK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id r11si619271wrm.1.2021.03.22.12.44.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hJ6tJBzyXh;
	Mon, 22 Mar 2021 20:44:32 +0100 (CET)
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
	with LMTP id TCsAcfzy15T7; Mon, 22 Mar 2021 20:44:32 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hJ2hKRzyWm;
	Mon, 22 Mar 2021 20:44:32 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 2/9] include: cache-partitioning via coloring, add configuration
Date: Mon, 22 Mar 2021 20:44:03 +0100
Message-Id: <20210322194411.82520-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=hh6MNapK;       spf=pass
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

Add the way_size configuration parameter for the coloring-based
cache-partitioning, and add a color bitmask + color-flags to specify
coloring within a jailhouse memory region.
---
 include/jailhouse/cell-config.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6b54e34b..79b67981 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -115,6 +115,7 @@ struct jailhouse_cell_desc {
 #define JAILHOUSE_MEM_LOADABLE		0x0040
 #define JAILHOUSE_MEM_ROOTSHARED	0x0080
 #define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
+#define JAILHOUSE_MEM_COLORED		0x0200
 #define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
 #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
 #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
@@ -127,6 +128,13 @@ struct jailhouse_memory {
 	__u64 virt_start;
 	__u64 size;
 	__u64 flags;
+	/* only meaningful with JAILHOUSE_MEM_COLORED */
+	__u64 colors;
+} __attribute__((packed));
+
+struct jailhouse_coloring {
+	/* Size of a way to use for coloring */
+	__u64 way_size;
 } __attribute__((packed));
 
 #define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)			\
@@ -333,6 +341,7 @@ struct jailhouse_system {
 		__u8 pci_is_virtual;
 		__u16 pci_domain;
 		struct jailhouse_iommu iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
+		struct jailhouse_coloring color;
 		union {
 			struct {
 				__u16 pm_timer_address;
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-3-andrea.bastoni%40tum.de.
