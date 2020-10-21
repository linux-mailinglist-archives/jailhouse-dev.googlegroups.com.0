Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBG4XYH6AKGQEYP2ZNHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E41F3294F29
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id q24sf1298452lfc.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292060; cv=pass;
        d=google.com; s=arc-20160816;
        b=BTiKzwo9d9AQKDsCSEUdC6f0yy2N5S29E0bEvwFpwMJbBzhhrRONMvx+D7pPsQca6D
         zn+mmwThAPMkSZRF1ghXQsVmBNNAYcqQpLSdlXtwdWfCNF2KHUM2Sx2Z5sa05BKo5dUk
         ylDwjAGfYfalYqPQxKbK2v+ToQ7e/0XbZqFd/XB1Bt/iTS0j8/g9ODcCy8ZqR0+A7pb2
         /lV5RrqSDL5YnP6oy1Eid3/1W8koXk/AuHYy29no57SPe8SbjLLALT4G7JMPtZ11AgPu
         0W52w4XodDxzS8hFO1xsIr0X1x8kVTc9CYbZ74wO87eTjjlW3xk0oZ8PBhkmfgOFW4BL
         gmdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=p+byPjYmyVBlEe7Gel2oDWF9+a7n0mRD2GXdV92IViM=;
        b=zB6CTlxgNw+jxZaFkpuA6vkb4euaA6yRN1xq4cV8mgWTqi1Hz7bE1gggsT2Lhp1lNL
         xBwZKAaCHSwRo17uPNfKo+lRrUOeJWAWbYTl1grIpVo1meaE7gjpL2srTgkpOqOwBQ5R
         0+LF1uwQKzLUAdQDZEVR2oPfBcrMtr90R7tNkKTOEfB/98uNSh5RKGtppModxb6MvKRo
         3pVFiPWzoiVyZQCm9vX3hj6kjlAdAxMVabwcZpisJjGxbYm91F5cgK+rfBEYz0mTK8VM
         WYDG1EoBRSxzjWJBEJZD/8H9pxI66G+4QWU8Xx0p4q1Wd7R1CZwXWjDs/G6cUjGFMQ71
         4PoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=IRhXbRnA;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p+byPjYmyVBlEe7Gel2oDWF9+a7n0mRD2GXdV92IViM=;
        b=WDHTonqoAH96k3xp6BUZ4FYM+QZq5x5Y1nHHwLIiidMn45COM0YeruZauPZh5Nb8pr
         I6lSVyuHpqqECs3+i827TnCID+yUI3zxbZdlz0n26kxsY84Hajh/42AZKdfah/DoURx2
         WtPa6JisrtmTwyRznZ8x+eE3IoHQDoabCCDP5Yw8v2gqjyVdgXOboXnl9gLNgpcsm6hL
         4/NO+VqwdSjNTjORo95wWLBs73+Zi6qyEu788EWpj1j9cxF1MqenaSjJbc2VbNc9lQD+
         327IubIzXLRLdXj0a7T461ZBj7OHHm7y/ia2wjQcIrSoUu3elsMvWBOXK+3vEQSayEeq
         0twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p+byPjYmyVBlEe7Gel2oDWF9+a7n0mRD2GXdV92IViM=;
        b=E0KrW1ujTmwhyJX0i3cf8I/EnW5rk6Cr42upr+1KGc2E8DMy1X29UStgunDKFblGD2
         irYma5Hzo2NO7yECRPfFi1CKzPie3MzCQuNOOsmMwDhJUkjwSZGBI2oFkyu3hYWgjhck
         lmJTvChf2DAX3SBwlWYe8Ci3usiRgl4i1j3TUwlqHqGe+meFDN1FovSN4wT2JEIi11jt
         brQLK33+UAfkNyT4pJFtPc0HF0YqMHq9arCTwfnkmZTIE2EsHJTae/qQZ6WlgAdQlVzs
         349Xpc15rJCJ+VOrfmdK0X8W2yvcl3NxQDU8D1d0IYa1T1i19sgxwwHnrdV1JSaSBidI
         jLQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318Gq5WvsK8M0qA77jewhBxcwC1KKUvC8Y8WOdw0yhkRLt9A3G3
	8R5cPNo4ikNTn79sTMYrwNY=
X-Google-Smtp-Source: ABdhPJx7uqegHeDE+kSOq8cuybBi5KyQhDuzzSbqdtvajOrZPwydmRNCeV+LOvO9FFMmQTx9zBDZVg==
X-Received: by 2002:a2e:9a46:: with SMTP id k6mr1723153ljj.310.1603292059500;
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls122834lfr.2.gmail; Wed, 21 Oct
 2020 07:54:17 -0700 (PDT)
X-Received: by 2002:ac2:4550:: with SMTP id j16mr1308149lfm.567.1603292057001;
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292056; cv=none;
        d=google.com; s=arc-20160816;
        b=GmlBJ7gE7NrmCAqYu2gFquFxo4j/3fay6HDZ/reqvQnSxlOJre8knGALZi2bYmZL5W
         N3RjOdjpkkZMkzzdig1QEnpiS+8BUFyobh8OP1lKL7Wu6PSRZegjeza/qltRqdMT8s+U
         tZvSajczraaN3s/9WYv7tHPySA078xyhCZ9RG4ybPRU9WFyap5NqvdIUpW3NQEN0VwP8
         2jg2d6RitOWfcmqw+Nwu12FzldVg5w/WWLu0Q1n0lFr/OvxJsC/hIIr5nQbxdSm76k0t
         Sux3HMRY6aEn2DhS1nCzfNKdsyQ8GDEB5WhqwGtf9corV6iTGBHo3YhEMvGt226p9weB
         85nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=9laOJ41OYtWTN1KyM8/ojEWMfHUdCqSm8nEYjXYSjSM=;
        b=CmcoIqzNrCuKTdGhSeBH1zuTO4H6/+iUSzBVdjGbnBWHQpbhchJDqmr/3fTDUYcBhl
         LroiDcuNShXiApB/DTohlaNcnV6DPSBAMVQN7+2HT/jlHtZ+qpFX2mJGHePRYtEJ3pqv
         DuuRPOEAdoHgvU+J+S63vvJScTsHOJphBHAmJA2NZ9IGLVpo+n9r1Bw8us5PsfO1/kb6
         upH1ks2XThQUvaty6jZ/Q2g+5xvCZpxWNWp1kHlA2Qozy1akIdhB4rmihg77UW2onSLp
         n+EUF/cJq1a6pSWZow/PNcH6lWGjHA5ZXTFtJPDoPZ4+0G0/GAxjlvEnZ/Vd762UMAJi
         wQ9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=IRhXbRnA;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id o4si79405lfn.12.2020.10.21.07.54.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRX3fn7zyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
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
	with LMTP id a-O4PFWxIA3G for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRX0lzTzyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 10/26] hypervisor: mmio: fix Wsign-compare by casting index to u32.
Date: Wed, 21 Oct 2020 16:53:48 +0200
Message-Id: <20201021145404.100463-11-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=IRhXbRnA;       spf=pass
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

In the branch, index is 0 or positive, and num_mmio_regions is less than
max s32.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/mmio.c b/hypervisor/mmio.c
index b7915eae..3747bf6f 100644
--- a/hypervisor/mmio.c
+++ b/hypervisor/mmio.c
@@ -209,7 +209,7 @@ void mmio_region_unregister(struct cell *cell, unsigned long start)
 		cell->mmio_generation++;
 		memory_barrier();
 
-		for (/* empty */; index < cell->num_mmio_regions; index++)
+		for (/* empty */; (u32)index < cell->num_mmio_regions; index++)
 			copy_region(cell, index + 1, index);
 
 		cell->num_mmio_regions--;
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-11-andrea.bastoni%40tum.de.
