Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBG4XYH6AKGQEYP2ZNHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id F0327294F26
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id m20sf2778481wrb.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292059; cv=pass;
        d=google.com; s=arc-20160816;
        b=0/0xgqAQh9sUWoDUFlUmDXNHV8aoGS1mEdN/c+U8k28lJmLpy1Vtgslev9WiCOqtso
         +7gJ+hKhP8v6pA3H3f9jvs7Vu3BX7ZcThZs0y+0hdCTAVJitUwGSljs97KZmbUA2J+L7
         UEhFnPyQfRcnv+7T7OBNN2u+bCL6x6LSBCSj+UO9RBv8kGIHZ7wgu8CjiiQFQtralgr1
         zYh2p2ykwOusVYM2gHRNB96emUkV30KiCfB5vtNtIagtSMVZioLL3ZOC80Ya7b01dqlW
         P+I07SKCTHG5OvqHemQMd7LD2Puyc+94pV4PwS5tQu+5zkFIvthPhe7oyxzdBoDdwDkT
         ydzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ZXg23dsxU4KmRaYi5QvWbwNWDWVU1eKxUk3MPbiuPCs=;
        b=vn8XZK3DmQIdNl58RtTnLs5CDLt+6kC6g/0GVaeiMktDImaX9vuCfZvQC58/Ulj9Ys
         fQuaZf4Tgof2btqtgWsc1za5Dg9Hdu/gorEVo2gaCzdqAeulgluwVxRRfTCmNXSrPZ3f
         e4AJR9xPSU9OJZKAk12T+5xQOhysuyf8blWhfUmaQ62pGoudV0/AI2Tai8xtsC320Zxs
         GsG5v8zFf3T0wjfyDybgA+7F+itk9ewsftKEpJc+9+AVf9hdQQZqHU0oefXIrluqnk/A
         PRz72Nhi4YHndJ0vRa2c2iSMDCh1TCcnfIrAnL2rjLUMsMWhV2Q4ehdXGYd0XCWrffRx
         bmvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Wcwf0ik7;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZXg23dsxU4KmRaYi5QvWbwNWDWVU1eKxUk3MPbiuPCs=;
        b=DejrFoi9TJwfxhTU608xXUWEVJS/nab7cn7GJyvSJ0CsoAmUQFKg4ZcjD2lQEQXWeu
         gsEHSBPqQ5gvmOg2f9aUXxdR3LE/qo2SwAusb9L5IQk/VGn6AZWU9PS1hWU19B40YDEo
         iOsQSRojy3qfSAa9S60a0t2QX24ZXbeUOP3XFfN7ziplylPFASE2ybECkSubzV6iB0tG
         1DemJnVZAQkb02AXuWhRhslWy48qrIQ92UnL8e3ZCtlnsjl9L08c26UPm3dsfQ7x92Y/
         J3LOVPhox5pHEzreRyuu+JSQjHa/bi5hP8MRa//yqwda7LvKUxHIhvVsdadyKtt2tAGS
         CXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZXg23dsxU4KmRaYi5QvWbwNWDWVU1eKxUk3MPbiuPCs=;
        b=uEikakyYto6TXo7NyRE+5Ittm2A4dw7lgi3X3dpHOVAkkRvGx6pbu7sz5nze3d+dZ0
         MWHsDJM4EoeezKgcI1fwPJAhJIs9Uc1pOnxhxcmct/0ezUgQ18XWGimcZmYf4eQ0ItxC
         LCMp6I06fOp6CqRcg3AnrLmnk17WFo41/rzYb/ZrYZd0G9BXj44Q1Fru2k4rx3PzID8h
         dWv5UEkNKfpK9A/Gl0Eve2ChdwuGmvFCyKGXlrHu4TKaHTWsEzWHhAnydzq20VAEgcL7
         O3ZNDf1OwVjWI2PejU7GmvMyGHPOMycWwOoBnzLd9EpWWgLAPQcXcC643IpW31g50sYN
         kwJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53041/vq5e6SMAlbTAkyfZCai/qBCoGVFM++JGGMDqzYsmTNHNu2
	kIZ4ocneX7pDSaJaYTYqIT8=
X-Google-Smtp-Source: ABdhPJxKS8WvLI4U0GgepxK0zORzEZJkJw9xG68VuC+YuQTa26q2TUPdo1QIaV8BfPxuxAlUGV17iQ==
X-Received: by 2002:a5d:4b10:: with SMTP id v16mr5546746wrq.178.1603292059761;
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1c2:: with SMTP id 185ls112567wmb.3.gmail; Wed, 21 Oct
 2020 07:54:18 -0700 (PDT)
X-Received: by 2002:a1c:bc06:: with SMTP id m6mr2839756wmf.68.1603292058916;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292058; cv=none;
        d=google.com; s=arc-20160816;
        b=GwTRLn6mpCTp/zAjiGqgE1Rgg9Do/B9gbjHPjBmxlYYn7JLMeZepy12jsoYzjUhZQI
         F0ll49qjZcLk6Iw00KG9GqzCyYLfR+mBK9uMCsmUZridk27kASEUuyf/Kc0q7JF1bqwA
         LnL2roTQLRIGeVfZkcfFuey0w8qQTtscOn6KqVqK1532fiZRVS5Cj6Kbh+IioN9pzOMZ
         6FCFgYh7/mPAjzr0SfEGmXcrnsQ1bZ5NLUaB4H2pIZEyymKGpyYKvHDTY/X4+lkDqbNX
         9ZtPArtz47/ssruk6zI5Q5R3zrcJCsrMFzurjJER6hhwfhdaJQ66+JGZHQWXUvoOuyFh
         HTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=5iIyoSRZZWYnG2RMXmEQ9+AitfuNnhNPhLopy3Skz0c=;
        b=dtLYM3+RvuRCYH/XSYWQRz8M+U0dYC4wCHHRUUL1on4K7GZ7rdtL1ULLNfjJestC8+
         BuKxBDLaMWyhKlaX6/IhvRCF2d8b8AHic+6xzKoWRs3h7zGpqztZd/9m1HT4zRdZx1Rm
         8Qhx84rGvLhq/WceukLEDbDQqvQ/U0qlwP0jIkjwWvoqgA9KC33sLU4He2xUwcsmlXh/
         RGW6xByn00KxzT87KwDmLiq9gPjvL9K3fzQuNfyljD1LAwg5qBiV9UL6Q35LZI85L2qL
         kXGiFqAluyi1LL5MbagyeZUDbP/MAKoWnwYY2eyh/H6n47Wg6pqtBz1YXvq3kT2Yjpfj
         Rbrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Wcwf0ik7;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id f144si91670wmf.0.2020.10.21.07.54.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRZ5BJpzyWw
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id tw7KCIUBvOhB for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRZ26PCzySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 18/26] x86: vtd: fix Wsign-compare
Date: Wed, 21 Oct 2020 16:53:56 +0200
Message-Id: <20201021145404.100463-19-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Wcwf0ik7;       spf=pass
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

Fixes only one side of the "problem" because the fix generate wrong
int-conversions on the return value.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/vtd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index c072ba3a..9bef599c 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -595,7 +595,7 @@ static void vtd_update_irte(unsigned int index, union vtd_irte content)
 
 static int vtd_find_int_remap_region(u16 device_id)
 {
-	int n;
+	unsigned int n;
 
 	/* VTD_INTERRUPT_LIMIT() is < 2^16, see vtd_init */
 	for (n = 0; n < VTD_INTERRUPT_LIMIT(); n++)
@@ -608,7 +608,8 @@ static int vtd_find_int_remap_region(u16 device_id)
 
 static int vtd_reserve_int_remap_region(u16 device_id, unsigned int length)
 {
-	int n, start = -E2BIG;
+	unsigned int n;
+	int start = -E2BIG;
 
 	if (length == 0 || vtd_find_int_remap_region(device_id) >= 0)
 		return 0;
@@ -833,8 +834,8 @@ int iommu_map_interrupt(struct cell *cell, u16 device_id, unsigned int vector,
 	if (base_index < 0)
 		return base_index;
 
-	if (vector >= VTD_INTERRUPT_LIMIT() ||
-	    base_index >= VTD_INTERRUPT_LIMIT() - vector)
+	if ((vector >= VTD_INTERRUPT_LIMIT()) ||
+	    ((u32)base_index >= VTD_INTERRUPT_LIMIT() - vector))
 		return -ERANGE;
 
 	irte = int_remap_table[base_index + vector];
@@ -888,7 +889,7 @@ void iommu_config_commit(struct cell *cell_added_removed)
 {
 	void *inv_queue = unit_inv_queue;
 	void *reg_base = dmar_reg_base;
-	int n;
+	unsigned int n;
 
 	if (cell_added_removed)
 		vtd_init_fault_nmi();
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-19-andrea.bastoni%40tum.de.
