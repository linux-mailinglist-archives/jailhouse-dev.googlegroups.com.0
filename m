Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVEQY76AKGQEO5DAL7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FE296440
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:45 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id 202sf436486lfh.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389525; cv=pass;
        d=google.com; s=arc-20160816;
        b=XIZxyabekp6RNegWHOjBepyI5dCDhUk7WPr+2xmpZawnKyPrqa2pM8s6Lo6rCot8uy
         eaEINUNoBOUNGThtG7h5K/mWGJT/h495XNZLaalvCU364vrflpZ2IFnPEB1erTEJXUqC
         MgUTm6gfWQClkvtBonAIYKSEdUYsjjSp/PShanxAIWoNDzQfxD/Zgqnu4bqQpoi8AIyI
         8vWxC1AKQVc4ceJwX2JQOSDognDFaQSYk6l2iUTdSSrk/2P+WoAGF+nnt26HUNIIWwmn
         qKxXJTPMvMsYJMC1njyCKVIoNa8vNrIbN8qRPK+UII2fewvzM3PPOWjM3eldrW9SjBJr
         9/dQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=J3PNCj+rKGINcQ6D1ocU334kqrh7ysMqUDnzFBqcblM=;
        b=lTiRywm5FbkoXXfXYJTJlXLwwsE6HixeejZrVQYj0+QDeY2fW4WmEs/tzKITQYPA8m
         BOZHiErgRquwFVoi1jn61xKg6IfGCn9I38LdpdWF8YMGA52rkGImsoH06f6Y70Aot0HR
         3Yl7DoSlcOGgs6/JUPzGHYRGYT8eAIwlfAQYe1TrqDnemd0pkXplmJ6xx4YBCmwdg9v1
         Xq0Y7nc7cRLqsVXRM3qwJ+uKGcrOiAx3+v3Jtmkeo+G/Nw8JVcJx7iYiiyuhkX4xJodn
         45R1JsITnmVHFz8THi1tyOAgh6l+5TAr0KeKYi27jOEvbD5SPqB4Iug+2+H/5JpdPHUi
         xWog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=h80TbW0r;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J3PNCj+rKGINcQ6D1ocU334kqrh7ysMqUDnzFBqcblM=;
        b=AlfljkmNZDtH0q2mlH8F4B5z/6Yocjm4X7rxvwBRDdYnEIPkmp7F+qv7pJZ998JYmd
         4enNDotVa1egiQNoNKhESRa4Zb8QSp+wUuwaVvmLha2Vx5BNmxyUOiRAVULGjQ/lB6NX
         JFh4jJs6kMrktasIdlWhWnJzibuy2ClShCJgLvrq3idU6un44ErWjy0CIgixoQNIWxas
         JxLas5TgRF5l6qKo24h5m3AQIWzhpNb31UC//TUOn7dFqNaZknmXySPVsaHcZAshsYHO
         nNGTBr0xkxdEMgU+2C3o/yOQl7bhLs9Rr/ImuYbsMNmKAL/ODX0/M3RC0LUVoZdRVgXX
         EHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J3PNCj+rKGINcQ6D1ocU334kqrh7ysMqUDnzFBqcblM=;
        b=NRGrYgEMu1NmCH1WSgR6xi1dEm5RFyElUpoPjpLqt3EAfq5aaDkdvHFcDO/XJK1Zv3
         xgYeG9gjdy5l9jJ53U3mvEA6vaWImoO16wL9fr+PvqXENNbHYUy7YhfcJJEUyFIoc97u
         XpKh5ow4KbpvGXNZh+5BPJEtmUbJbQiEazO7/SOt8AC+oCx/NNQqWciXK0LULGfbVg3B
         MiU29Fl7jE1dmFLb0Pl6SQPRtUV5v0XX2SiFAg9v04LheFyr7F2z5HbpxNXrqE9rZS4x
         6DVSeADtNu5jNrEJLYbyeINt6nPuaRLiRm1AU1RjST4Oi46udrVLr0zxrqDO/c6Shory
         sGXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330v7TTi5pX4pGR1MDA+x9Dyp7sjdbj36KGVZeMES5ZrYh6ak3Q
	Cs0cp3RleFWbDNKoOX6OOYU=
X-Google-Smtp-Source: ABdhPJxQwDCj44b093sxI9ON6GtOm10IgNiqdLjqYQvoxBIJdXNzAW5+hBk+S/BXwvbDZBkm30AmNQ==
X-Received: by 2002:a2e:b531:: with SMTP id z17mr1562104ljm.28.1603389524852;
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1749871lfd.3.gmail; Thu, 22
 Oct 2020 10:58:43 -0700 (PDT)
X-Received: by 2002:a19:cb52:: with SMTP id b79mr1152955lfg.34.1603389523858;
        Thu, 22 Oct 2020 10:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389523; cv=none;
        d=google.com; s=arc-20160816;
        b=QWQ9HxwHZPE6YI96t2cTGCLBEwfKJ+D4fcoKu1+FIPzJ9zB1ufpQTMWevxuYN37juG
         aAYHwOJB+eOEat9/rgLJHkgCXf+B08uw6rjobLx7UXo8XKLDMGvav3ktLufZU1uR6Fgp
         hu719e4Af2G/+0lkkDoGGl+bKFkwDm8s6syHHxiOH1EIiynum8CAqZ+VmV5KuR1Vkbti
         k6qHAj5al+lPdXSjsYqX3UyiTCRuLB1LxK/iJOTgAJYqO5Hk1BVvGVUdHyvyQY+kQzap
         MaaIUdZyPaIb/mkm6Tpucz6DxOyJhqHAW3rtq7lDy/jpF4R5z3xT6ReVDsvCjwQiJmYp
         fLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=AAh3YQynFBBhRvmI8W3I0yaIGOxTCRSxdIJZBUhLJA8=;
        b=rqcRFFp06uDodwFQp3zUQpR0WEQ6eLrxuU64O/tCiJHVnOMKpjsMdIJxm12g6SYOlj
         vGuK7qznOQ4iBMdhYIqkoYXYpeKDzyvhU7m37131lT/OzJPL83QTafkz1L+bLIxMLHtY
         OGDPcbBR+Ya7oO1nHwIpkN3AbkNLKwaHtewQpLHYi0YvYNBaPXy/AInt87yjLsdoAJM9
         WOg5kS9b8LL/GDz9f840UeXToptwYJzRfOsgwdvIyWnI6lj0ifh4lH6z8OeijpKOkijC
         KTKhV7IM8zdQqKK0AB/JtMdxim6izFc3NUqE7KEO7ctN6WSW1mh/uZMAEJbh5fXZ11GF
         Noeg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=h80TbW0r;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id l28si85060lfp.11.2020.10.22.10.58.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTv2fMwzyXW
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
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
	with LMTP id IhXWidH7mU6B for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTt4mgTzyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:42 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 20/33] arm64: smmu-v3: use uint instead of int when needed (Wsign-compare)
Date: Thu, 22 Oct 2020 19:58:12 +0200
Message-Id: <20201022175826.199614-21-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=h80TbW0r;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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
 hypervisor/arch/arm64/smmu-v3.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 3b5117ba..1f83e389 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -405,7 +405,7 @@ static void queue_inc_prod(struct arm_smmu_queue *q)
 
 static void queue_write(u64 *dst, u64 *src, u32 n_dwords)
 {
-	int i;
+	u32 i;
 
 	for (i = 0; i < n_dwords; ++i)
 		*dst++ = *src++;
@@ -1044,7 +1044,8 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 {
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int ret, i, j, sid;
+	int ret, sid;
+	unsigned int i, j;
 	struct arm_smmu_device *smmu = the_smmu;
 
 	if (!iommu_count_units())
@@ -1074,7 +1075,8 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 {
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int i, j, sid;
+	int sid;
+	unsigned int i, j;
 	struct arm_smmu_device *smmu = the_smmu;
 
 	if (!iommu_count_units())
@@ -1099,7 +1101,8 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 static int arm_smmuv3_init(void)
 {
 	struct jailhouse_iommu *iommu;
-	int ret, i;
+	int ret;
+	unsigned int i;
 	struct arm_smmu_device *smmu = the_smmu;
 
 	iommu = &system_config->platform_info.iommu_units[0];
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-21-andrea.bastoni%40tum.de.
