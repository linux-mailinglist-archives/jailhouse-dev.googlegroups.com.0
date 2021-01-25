Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBLXGXKAAMGQE67QTOMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 178BA302499
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:51 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id b62sf745530wmc.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576110; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vnw74nw6kwWfn6yBlxZyzTpl0SNWZknbPnWzA8zIW3fj28GQcC00zgQRmbqOdOc46E
         qEDK0rNG/sHtfcg818TCThcltYROjl9CfajTzDMvf923Ww2nS2vmFAW4CWSmlt4zMyQw
         6GW3xnApAzouj4zmL5YMIvG0LzjuWvvXSksz+tnwOB/bWfhX4+p8wGjm2X+ozo5szel3
         M4w2Q753pQ6Fdaa65hcQHOZ2s0hJKWAKVisHI5lrcJy3lmeLVdUycL2ilX8bJ2aeAbJd
         HUl8taBe+gU9nXp/Lo8yEP46WHkTG88lfX7kIROs3+5Z4tZ7YOiZdVzlHc0JW3FTMpjv
         NULQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=j9G3H44Iy/pSEtrT9H+oMeLv7D6aw8mGUhEzT2Nj8R4=;
        b=qFyDej2NEXvShwbRqCWiRE4ih4wsE/N0iMxxATtFp96ZqO+g/euQvwNJcHrDzDn+NM
         zJj9kn9JgJ31dLKgeNM+e3LSOw5LBSPv2czupkVGo42Xodu4GRwBmLqwkcBd4cfeB+FM
         XK9fHrI7YbFAl+3q9hJlx0uiQAIzIkJifEo5So95fDy7RPPU3hE9olIkYsXIHX1xXrSi
         eTDPcAvjJ9ITIkxo1J3GndMc5kiaPtg3YJZZGd4/9XAiCo6m+TwsFsihdR6ZNkr10qTZ
         G/rhdtlxdmUJ0ZK/iPimbajeh8a+eJkZXcvEit8pQvxKuBq0aDdFPCFmHOivEJljbv4e
         tFmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ea4IWD91;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j9G3H44Iy/pSEtrT9H+oMeLv7D6aw8mGUhEzT2Nj8R4=;
        b=dlUd59BepOzmEh4SDRkJtSqmxiu3sskZMchpG+LXK0vyySgGhkKob82Ck5xTmSQR/t
         0hSd/X9zhlEGf2Wjy717Qxdam+BrMmPb/oWZeIviCKE9oALSF2zYLfjp5/3sbBnAxR0A
         QnqU4qnYEaikwCpimL6U5iNGuqrToqlMFHSFsnoKozyILMUWDbNV56R4RUP3SkocM+TN
         6ldzaXLrgYMhDtKh4kpqWoyjCzXK1Q056siWvB2gXipX68bsvAnQqK2f8GTdyEjSU7/B
         XXGhlNApsL4dCZgZgnPXGrxdzLM9p2p96aHiBjCsZPv+rvMpT0QyVohOWpt/om3IDFnE
         3YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j9G3H44Iy/pSEtrT9H+oMeLv7D6aw8mGUhEzT2Nj8R4=;
        b=CjfvY2y+DCnRL3af9ZfjmCKmDWWruFtVsPP7debrqeUFpJpQXtRiEECA7c/D99VBtI
         pnoKoD2cS2Q7PjedaO8s7adDtrBheAq6D/+7jwNesQMzPTEDxiW80eJOaYRsOKrLePTt
         WRvMP5ypm9GaUbLzWVXLxHzwJeffTVBg7+R7Qh/yXJsDi1TMZLEmvGd5oftzNaDGJr8D
         oDkL8r3wpcH8WJS46qdM8t21B1Oo6V6Rspks3RsvWIy+0jotMg0UlcHns04YQ8bKk/1w
         Lpq2KW/7knU5yQp+hYbrpaXutFyGB2iRu2r5wu03ihrk5jxE6080qAhrgJiDew1mCkWj
         sCug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WiYhU0mA3D7BBh5HHs8o5F7+hv0zTDcBdozqVXXvefurEgUKP
	ZWxvGUw/OsO70i8lwmLNd7I=
X-Google-Smtp-Source: ABdhPJxi6fQoEOCKn9K6UVY9dPvMR3O0ku95r+6BJf3P6NiSTSKs/omKPjjZUph3AN0wZDbR+tLwQQ==
X-Received: by 2002:adf:92a6:: with SMTP id 35mr545838wrn.193.1611576110794;
        Mon, 25 Jan 2021 04:01:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd41:: with SMTP id u1ls97130wrm.3.gmail; Mon, 25 Jan
 2021 04:01:50 -0800 (PST)
X-Received: by 2002:a5d:524f:: with SMTP id k15mr608241wrc.16.1611576109984;
        Mon, 25 Jan 2021 04:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576109; cv=none;
        d=google.com; s=arc-20160816;
        b=voHgBsYB/8kOSPmwkmOidRQKUOplJU3m19lJd2+NlWDXShhpsrfH2BnPSM/X1+wyLQ
         kM8zqhStK55Qjx2mcDnSXnS8j/VGgFvUWnE78vQC5fXi+ob/yPveAr2e4j5+37vQVS/0
         yjw5cB2cxkYMLfsw8W5TdbE8jprDshGfduwV59zqsaudPrKWkneKXoGeYGoPBM0aY0Fe
         9WhjYSAEO40as43tb6fm3/gJR1lTQUe5REHl2D7iHL8ErJ2OES6n0DeT173mtEP9P1iP
         TaCmWI7R7+2l8pvNqm4CWr5BPckTGbd/Ea0p2Cb4Ifom0UJakh4TEuRaeAYT8E6i5cQS
         MzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CQuZsdLm1KIQK58I+wyM89mMFz9KrQ4iL1z+l1T6xUE=;
        b=Oeg4upUgNU2Bh0YoBi0ERVi1KM/hMGbH6vCAkCkEVL7mSDFZ+d7Ye39IFVvVVb3DOJ
         4oNtzd4e9UNdzJIIcO19AW+WK7torI9YIkyhVidoiB9/J1DydZAJ4QyYOqZibGR2Mlon
         rATm7MLesqLiJbA7KL//Vc9gb6p2H/a0OClfo5BbPwOZ71JJxtONlBLlRDA/uIsy7lqd
         YEN56n44k8mFz+dHIrr4UO1cd+3D3ghusQcOK6j60mlTAtqiKoNYeEbPdHc74tNikr5C
         /HgaGVpEGgLp96dKFusWXe8M/nl4riueo5cS5kKLVChZ2+qXlP6KbtdFpSF2DBBZQqDz
         iEvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ea4IWD91;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id 7si551523wrp.3.2021.01.25.04.01.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:49 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT4F5gBzz1082;
	Mon, 25 Jan 2021 13:01:49 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id A4SLqJxIU4SJ; Mon, 25 Jan 2021 13:01:49 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4F18XzzyjM;
	Mon, 25 Jan 2021 13:01:49 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 17/23] coloring: config: use u64 for the color bitmask
Date: Mon, 25 Jan 2021 13:00:38 +0100
Message-Id: <20210125120044.56794-18-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Ea4IWD91;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
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

As there, update and compact parameter names to later match the driver
ones.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/coloring.c | 19 ++++++++++---------
 include/jailhouse/cell-config.h  |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/coloring.c
index 123e191b..ff3b5a78 100644
--- a/hypervisor/arch/arm64/coloring.c
+++ b/hypervisor/arch/arm64/coloring.c
@@ -115,7 +115,7 @@ static int dispatch_op(struct cell *cell, struct jailhouse_memory *mr,
  *  The function assumes bitmask is not 0.
  */
 static inline void get_bit_range(
-	size_t *bitmask,
+	u64 *bitmask,
 	unsigned int *low,
 	unsigned int *size)
 {
@@ -137,16 +137,17 @@ int color_cell_op(struct cell *cell,
 		  const struct jailhouse_memory *col_mem,
 		  unsigned int op, unsigned int flags)
 {
-	size_t colors;
 	u64 phys_start = col_mem->phys_start;
 	u64 virt_start = col_mem->virt_start;
 	struct jailhouse_memory mr;
-	unsigned int start, low, size;
+	/* bit: start, low, contiguous bit range width */
+	unsigned int bs, bl, bw;
 	unsigned int n;
+	u64 colors;
 	int err = -EINVAL;
 
 	col_print("OP 0x%x: PHYS 0x%08llx -> VIRT 0x%08llx "
-			"(C: 0x%08lx, F: 0x%x)\n",
+			"(C: 0x%08llx, F: 0x%x)\n",
 			op, col_mem->phys_start,
 			col_mem->virt_start,
 			col_mem->colors, flags);
@@ -154,15 +155,15 @@ int color_cell_op(struct cell *cell,
 	n = 0;
 	mr.flags = col_mem->flags;
 	while (virt_start < col_mem->virt_start + col_mem->size) {
-		start = low = size = 0;
+		bs = bl = bw = 0;
 		colors = col_mem->colors;
 
 		while (colors != 0) {
 			/* update colors with next color-range */
-			get_bit_range(&colors, &low, &size);
-			start += low;
-			mr.size = size * PAGE_SIZE;
-			mr.phys_start = phys_start + (start * PAGE_SIZE) +
+			get_bit_range(&colors, &bl, &bw);
+			bs += bl;
+			mr.size = bw * PAGE_SIZE;
+			mr.phys_start = phys_start + (bs * PAGE_SIZE) +
 					(n * coloring_way_size);
 			mr.virt_start = virt_start;
 			/* update next round */
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 8934a1f2..af5b5098 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -129,7 +129,7 @@ struct jailhouse_memory {
 	__u64 size;
 	__u64 flags;
 	/* only meaningful with JAILHOUSE_MEM_COLORED */
-	size_t colors;
+	__u64 colors;
 } __attribute__((packed));
 
 struct jailhouse_coloring {
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-18-andrea.bastoni%40tum.de.
