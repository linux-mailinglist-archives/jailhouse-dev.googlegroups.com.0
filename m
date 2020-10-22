Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVMQY76AKGQEZJ57GSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EBE296444
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:46 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id f11sf911720wro.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389526; cv=pass;
        d=google.com; s=arc-20160816;
        b=SDlSliFG7YvdcgG8ogEE6kTH132GXcANfjm8P+yTTU3vQDRlg5ebgxlai5+7Cl1g56
         YQIsgb6abT0lWNVmvzKoDEaVDaKeTHzmD9wO3RV7vXf3EnJlqG8tZDATK7d8LjzVVC5u
         g0nCKgM14vKnVG8q9CJnK5KlXv9uGPLRsXVgrrfO1IyV43m9PGAZIwG3FcnxNcMEGbar
         ROwUHvAU8Rukn+FOG/pgypg/inLHhnIkj7bDDKXsoDEih2cr7NBOZYoHBcNd/Pgt937X
         3TgE5S8MVUchm2OAXXbqCbwGIQXt3tDdLaGZbLCJjt3Flyspb1rQaWJSz9hNLXNmlRMf
         2TjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=feyLoMrYXiEwwFfaq+IWgkl3qEcG9ylWhv32sd3DQr0=;
        b=ok99HMkSnbD15NPRvca+tJiAkgAe/tQcKrliMQAlVc+oOQ8Dyouh1dbZOexOrfVxNS
         ecWnxBKM1LismHMOdcoL9J7AbACdkMXKBR2+4mMky4O/C6tYuGryOp62y3nvV55Xomlx
         9vhvvH1XQ9mUAvheaPgeG3TJmLp6vLU2r/C/sZWRru6zsxzfCkCZJRnIVR1peV2j0e8B
         U1eNbWK3ADYtxIHj9uaGL37uAOHZ+l+NqrkN3ZGs2G2hZNXwFPC06BT0bC6ZAQaIqSgk
         Mab1UBKgA+hLN/eeykb245O3cqdVcYfHOcsFEEeN1gkwhPVt6ywq6ajPJKnorvN23LJY
         TC1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=BePXDiri;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=feyLoMrYXiEwwFfaq+IWgkl3qEcG9ylWhv32sd3DQr0=;
        b=j4mK5Ln6WGGdbZW6ra/bq4/S/4r/4KTg7P817Wqe6Jz7nKhxME5kGIPMBrZ/dULT7Y
         3i0yGQ3oIn3OgCFlHqmqtX+B3Yrc7CWSpWMfPvD1+jhBbcRbEg868ahNwn5IwKjXY+PM
         CKx2COLRTft7CeIjyiYSCjj6hYsjR474Z88BQ/2msmqJ2ETdJLQNIyf3rJTdbkABCOhQ
         msuowMkq87i0AtOVcfmn4HY2aEszkpLXt5qn8vPDgZNgYKo6wPK5BOIeOk8QLtfI5CQE
         KMe8uHX9w4iRB+ihz+y4upcX8ez07FAtSVWtonAwyUtkphXYAMp4bpLB8mzHAPaA+yyJ
         kBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=feyLoMrYXiEwwFfaq+IWgkl3qEcG9ylWhv32sd3DQr0=;
        b=f2KMjDXmB7asnI4mzXvoOrls/pPNGeESDv6etPRzxh8EjWefn/Bid1MO05sAOqYwcD
         3LJN2AocXj1nbvw6pg+utxyuXfkpYxNT1GxUMDSgRi9+it/c10GWwXg4jdZyfadgF1Ym
         PeJDFqLq/cKkHuLzQuVeXD6JmM320nQHep6dV0oWijiqLT2CuxOouRtVMS8jZ0NnFF78
         8dvisYMYuROrxtuzeJAqfcUzGjCtoxM/csYChculWGrshcR1KWJxLHWGtWlwJ3/Yrk22
         S92CwlrZqvIrHO2qj8ARXK3a5vn3L+Zs1ownVQOUE2FrdATJmPgmFUhMrkDfKVvYwLGS
         mIMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hUBaaXuL3NpOW3ssa5h/1qKLOFuB4EcPxXf4dm4hE7g/Qk7hJ
	JVpyVjTLJ+lX/wDqp+UBffg=
X-Google-Smtp-Source: ABdhPJy2vnoFu8z16lqVFrVZ1z/uljUeN1Sy/Se2l36opIS2rVeXG8q6dsBJFKbUIrps+D5Ezn4X9g==
X-Received: by 2002:a1c:4887:: with SMTP id v129mr3887258wma.13.1603389525905;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls477763wrc.1.gmail; Thu, 22 Oct
 2020 10:58:44 -0700 (PDT)
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr4283272wrg.166.1603389524747;
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389524; cv=none;
        d=google.com; s=arc-20160816;
        b=rs7tZqss7fXt0cThIMRH/ytj+22DH+CZWHhelJfY+fhS2DqSIUkCVyW2QUI6d52MFi
         sWjwfmMkYaXbo3szF9S5Z8EuRbeHAxBhPNLOmIMp7NSHP2aRUL/qMvTmb/zMoWl7Vles
         VBr0t5KI4BHSZ8wKpwDuZe/upU65DGdimyEECCxujpxDD3dh1WUJcck/zh8uOI3ki2Uk
         gSoXPO2rU1scHftIJqugP3njR+mT9BxfpK+4+GvGEtAcV49PNOxlkQmhy+U0YA33pQwK
         ZKmvS++qT/w0WOauAHUoQmrEbqokxHI8uAuB1MFyqG/8JRQfzJke9dPC0uI85K+84DFw
         kZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=RvXbhRvjYaWEtcny6ZsR6ynnLX2hte9nBLQ8CVVFQqY=;
        b=QIehAXI7e5ydypYk52grwEk1yeRJ9wJd/no7yyT0KDFBifjFN1LSl7nf+vN6T+JXMO
         sUvNng41i+hsZZbTxi2IXZWq5Y0wCN8hFx5jZFKlUj9HGmL+W0r+zEaYpTo+eo4+3MKt
         vlxs8HBISIV+2PIiYAH+WMGkIhm/uIqrXk+dty7oqeqheBCjvCDfUtUQi2jA9E615RMB
         zt+FK+8bdS9ytoVbEny7xEbJczpg83C4lHsqh3Q7NKRf3mefpu+V2r3HrBawXh79tQvh
         I6aKyyKVu9L+UCdemHNkQXA/Irpj7kKEmqFjudxlbFG4y/x916NM0cv7/gNeqrSvJRq7
         LiVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=BePXDiri;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id n19si95503wmk.1.2020.10.22.10.58.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTw41sYzyXR
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
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
	with LMTP id FxTKbC5mVN7c for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTw10r7zyXb
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 26/33] x86: vtd: fix Wsign-compare
Date: Thu, 22 Oct 2020 19:58:18 +0200
Message-Id: <20201022175826.199614-27-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=BePXDiri;       spf=pass
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

This is still not 100% clean, since the fix generate wrong
int-conversions on "n" when used as a return value (i.e.,
Wconversion would complain).

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-27-andrea.bastoni%40tum.de.
