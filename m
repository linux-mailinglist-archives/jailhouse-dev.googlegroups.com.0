Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBT4QY76AKGQEBXPVRNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A56296439
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id 31sf915149wrg.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389519; cv=pass;
        d=google.com; s=arc-20160816;
        b=gs4udkHJJ9zHL+rc87dyUIOQqMYghcxJq8pFejBrAZL/gHAEKU8JB4bzUsY4bl56Q0
         OdhrWyUEz9lFLqrM4rqXkVCdsR3X4u4c+jpzggQ4YG6J0EMGzZCt2v1kl9LqETZ6RrEN
         vfpSI5ecKNfdKx6FUHT38+lP9NxjJMKEgJhVxcU4jlb3F+/LMkeX1iGzV80GciJiFERc
         ty3xomDJN0XkW1onEx7Y0mjziuoj1chPa/xRfokEVHnCMbfxdsdtYFuyu0KZb7n9kvzV
         GWrD1p/DNpsfNug0Ahv/ZVIdr8ClU2Z3PW34cWik2Q+Mecs/DrFHPumv3NSrTCQI7kSp
         R+kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=UhkdChwB9ZVKUqMaKsE7KRJqIciVxfCzK1mEdsEj1AQ=;
        b=aFdIb7jbrNncolTrRNJbOvDtPlN6/wIMxWzs91N2cpVOqLxAOmtphfW0GZWTdqAjoJ
         2FGOdQPRgrJsR4dhDIbozxohiwvuIw+AkfLOQ1bSooc3ojpzFJ/dUP++5QTQregLYfQt
         umiw25WvcljaXggNzddGTFGvvfxZQ0CC2ltzpP7gr0VT85q6tUrZk0BpEqhn1M1PaoGh
         50yTM9BsbdfAZKWyi2mrHE/ylJpoFZw25VMRmwhsdItGz0c3+Vdf5LTzJG+lanCNNx/o
         NBBe8yAo/Nz0wmMK01+7ns6PU2vQV3ulfv/LWsZ73XtdByt8ceEuIBbDjm3B9v4f90in
         LEoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="SeP/qwOu";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UhkdChwB9ZVKUqMaKsE7KRJqIciVxfCzK1mEdsEj1AQ=;
        b=tAPbBecLHhGgGP0h1Ya+X8jAuI69NYiaPtyD+CmYfaoZlILQKqIOsmxoH8okkdJbpU
         95UIvRiOBHH8Tdc0IyRmoEVCEQe7pueBogwXnwUMg+BdsEPmg/ddu6HiT7NFeEEDDGwn
         S73tSrpIoH8i1Gjnp3FlZGLy4nvrlv0kC7XLAuY72sXe55JixAeQMzQ1PgX7TTdqTtKx
         LL2b7tJtXOkYJR4mjop7HV9l+mjG4r3Ooe3lsqsgT4OalCrGaMv8vWhLHVFpvC8ShqjP
         TtA9awaGiJ/F4sHrMT3b8C5WNJhCiGxTsUpSleW34YCYbl5A11RJ3AQPCfWM5Kp0ZpOm
         6c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UhkdChwB9ZVKUqMaKsE7KRJqIciVxfCzK1mEdsEj1AQ=;
        b=R8L1eGyDDHJm6a+UKI6nAVma6aXZm3c9bN7lAhGejuQguwiwNVJKLkVb32L8MqJcij
         voMPbZdp7Giq13AwFC39OqpHaFiObGVBVIPXtUIOmdl33jEY7yLoUZyZ/qnDuhoZA1aJ
         tF3yZZ8mkj71Q64d/QOLUp1qQePJxK0dmbB3ZiVd+Qi2j076aFGgOEDqQJzF/TTotyxZ
         qjoIlS9V75WwxdLHZjt5l3eVZHCOosctj48rhyN9YRt1Hz6LMD8Bmb4SIylMiocNnLI+
         AcPf5Kbjd/dKVyVGMyiOQjUsBL8f6DmHte/bBbwLYCtXeNer0SHc6uUJDUr6IYAUfTx4
         R56g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ZQVz3MqbMD3/sS/iBFJqqznhlk6ZoCYJoVzq2JftV9pkorM1b
	gm+NU8Ymxk0FrxYwsa109I0=
X-Google-Smtp-Source: ABdhPJzbWhmej8St2I+cDHSA4kk94Lck1nlM/D+HA+F6Kk6liXuQWc6PDrl9kSlNvVZa3viYNWe6mQ==
X-Received: by 2002:a1c:20d0:: with SMTP id g199mr3871615wmg.38.1603389519378;
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls477542wrc.1.gmail; Thu, 22 Oct
 2020 10:58:38 -0700 (PDT)
X-Received: by 2002:adf:9793:: with SMTP id s19mr4085454wrb.139.1603389518461;
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389518; cv=none;
        d=google.com; s=arc-20160816;
        b=b6iC1Wyf2/N+h0w6yzPnPvGW7OueKKbwh+ie9azAxao7jQmILkCa+e9i/uqm7hNBHL
         0hBGz7CXxuzEf9czGAZdE3YR1w4HmU6jCDVtOKr2jCr1ovk8J/QU3IFGpLBiHVeLDTPY
         fQ9ir/Bh7QgH+FMi9lW2MhAEh9dz8zBrIsGU9JJ9vDkPF1qQK8nO23rRfoc7HA8v63I8
         vLCQ4BVe4LMwLNuBaH9gd64aIXh4qysOFI5d1/9feyhsYPRRPqBkgXjLQfI1M5OYBrWz
         vvuF1apejgZpDm3KUEJxi+dmp1C0n28yJaFD1QKvNuCmb7/ZsycsFDKF8nzjoyPJ+7Sa
         8lTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=9laOJ41OYtWTN1KyM8/ojEWMfHUdCqSm8nEYjXYSjSM=;
        b=I4Pcx5HwxzuCrPlhHEAi3Bs73kbzmqjIl5c20DXxyrH3uDylpLMju1bFD2kxDQhJY7
         dH9qs4c/pFoXR6/zukBOsHdueeTpVBacDX40ObaKcHS75u7974YEbRmG42qG01BAf6PI
         nDyXwyrWoG0/WNQyOUtBM181kDBeA312hiwT0L1s7sa1KOiQoaMy4ulCJhzyAHyPO2Bs
         3We0jOb7oxbnO92mtkhfdJKsgdf6dKHmbcWxFUjZp0bkhq3+gWHANIPu7Rag0ayhcS2N
         mLzTvMLcSfdr5g7GQXOQN2kJOYApBAi/uLDZsbbfklYjYRh+MgMQDj9ZnPhNzVwLakFO
         1tIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="SeP/qwOu";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id f144si51240wmf.0.2020.10.22.10.58.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTp22xrzyZp
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id g8NQRxWmuepO for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTn5ySKzyZr
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 13/33] hypervisor: mmio: fix Wsign-compare by casting index to u32.
Date: Thu, 22 Oct 2020 19:58:05 +0200
Message-Id: <20201022175826.199614-14-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="SeP/qwOu";       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-14-andrea.bastoni%40tum.de.
