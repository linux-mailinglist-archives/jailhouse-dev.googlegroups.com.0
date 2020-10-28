Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHN4476AKGQETCLXIQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5252D29D239
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:50 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id m4sf330016wrq.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919390; cv=pass;
        d=google.com; s=arc-20160816;
        b=Cw3pN+BVwKUbeff3yCjxe2bD09TdRSmvLM32UWWLZFEdlUNvICRp34KkfAFnPkWVkL
         fOXsa9OutDN662vWDfpqGRM4dCLoRWdIOJbPJsUGKOyc/wzxHauqQC5vKyy6s7Pig4Ji
         na2m1+j+f6jgijM1SBmX0xbfLWMuMPtjLfQ1cOJkoRtF1l/9eQfUJdauLYFUyBjtj586
         /LSn8oidn5LVIm+faR+D1hocWZjkk+npw03KaTneL/KDis+PTWWshYplUt/YCWh/dD3c
         cudMb+TgH7OxUseeEB5HvoIZ/0lyakQ33GNw1133obx0EZbllZgxGgETdE6RR+LzGHIS
         6UuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=pjIqEMDfI6jNedtdKhdtx+RxMH5q625jWxpJdpJBMw8=;
        b=fHT5pJMTNSTVQHOUe8UM2K/v0OW/QzpT72HPKaDlkqoKb3bRGiFsZWhAd8//BjMtXv
         JgSMGzhEpEYCVmqyBcFBTpQgRNQECoivEQaiJnDmmr4BLV5LzNMEoHhHuS5M8TiFV0mw
         E8hTaeQ3/+x8VaiMEpaqFYzceEnnbuuGt5ovg/bLEl5hdPH3MR7y3PlEohxoe1fb8mOy
         NlF1SeaDI2MNEMfvpAnkZsAgOAv4uMkQ003LgoRafsYorLgUXJj+cg5Mz+2V4AZ47soc
         iCWqu/q7r5ZFVjuho6UWIcUVddUIaUqf3V0Jz0juCblXgGrFoG4RJc7LSwp9BnA6+xNI
         4Xpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=joOTb+VR;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pjIqEMDfI6jNedtdKhdtx+RxMH5q625jWxpJdpJBMw8=;
        b=Q2lFKZPoorRicM2/GqOZzJoa5oQTJoTYKrgW9AlcM6l6Ah5Na7WVliLVP5KPv5I1Xe
         9+x2Td8hBcyhRVKl3JN6kC4ratOWY4xMqYrHSvEAMVE57++jIecYf5aoaAHE/0yDf4I8
         R84DcP7kW8LMrMPlf5RcowkdazBBElpyayIawpCwA/6VIF3VPjDFGiSXymHIP7q5aU0A
         QoUArNgyUuxI8t8HKuZl4WdPy+wa8dofYXStGklZRIGOIamoouvbsz02qmUXD5EQ2ac/
         Tl2t/WNFRtBTYeD91nihf178d5639lBZ1ytQHDbZNNCh6wdKtB9buJynYG6nH7VGzWOz
         7wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pjIqEMDfI6jNedtdKhdtx+RxMH5q625jWxpJdpJBMw8=;
        b=YHu/04IrAPX4yqzBnrcDRsPgPX2jXiAV7XzpcJsKPyCirrX4aX0hZQRYdNVIUz/KUq
         //zeR3tuMqpcAhGDfZM5b5eISnYCnyzSXMMt72EqQ9TOH1teoAP7Kl1WldHA3d0TIOO+
         VY7BuCCMbsLw/F+FeRJ4VNVmvOuhWVJQJjmynLHMNohgGheg/xYjtD9I8MpR/2v28m7t
         nMzVdtulGd0iUTSfuGktcRFDvBtu1Dal4sxzLhHnE5LWeHilkBbirOGisu8WPCjPRQeu
         5NGXLqK4k37hxbwCyG0TPSxP5X1V5to32cCXK3MEi84BJiPUUoe5lldbFCpMt5kuEij0
         V4ZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532EpVEpjgqra86vIn25DRSKWBkDF6CXD+KhESpZFBbIyaH3uuG9
	8GBeP7Jk0MaEAQJ6rn5j3Fs=
X-Google-Smtp-Source: ABdhPJzd26iWmmVhNiNjYStKiv77b9ZR3TaP/Zx1808frl9H2Vstn0CD/D/ifQIPGnjqWnT8wMU5vQ==
X-Received: by 2002:a1c:e283:: with SMTP id z125mr754975wmg.137.1603919390043;
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2c84:: with SMTP id s126ls211346wms.1.canary-gmail; Wed,
 28 Oct 2020 14:09:49 -0700 (PDT)
X-Received: by 2002:a1c:f612:: with SMTP id w18mr777281wmc.11.1603919389044;
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919389; cv=none;
        d=google.com; s=arc-20160816;
        b=0NAv/qoVB3EsQtVoy1HewPWtvesfXKS10KotyvyBGwoG3CRhP/o8C8uC15rBj0jHvK
         kJFlsI+58sq1scA2gYWkpMNKSQdPv85638lQ+K2NzSwz5OPeVF7jwmswE7fnAPlg0SSV
         vfEBK8CwfJPzg89L2Sp2T4sPJ/9gq9um6ThI0PhwMwK4JWMuwtATnG9tbaHhSINUemai
         jBx7awY+6BbVkGct1cS+Zv6XtFO2Fl8v6D1Paj5HiO1XADGy8PqawDh0loT+v+y//9EU
         aoS4UFouV72PeUyz3cM4+Kqhb1Nnbeypg5dmczkWQ7Tv7eQ8vFbpKKa8R1CjzTQRsMee
         pOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=9laOJ41OYtWTN1KyM8/ojEWMfHUdCqSm8nEYjXYSjSM=;
        b=t/z4O5aCj+OHrf8eM+UHQ9daOiOlLB7LO74jI872GNUN0Xi9PJcB2KJr28ooQu5u0r
         WhtuPCr1daL+svPd23U9LXDkrPpRpveCvC9vP3RhE/zVVTYWWrAEYTbbfRU01sDByjfn
         nySOWj/UcBS7t0tzUw9W4+iovmW2bJHEVQxx/szBw1N2J2drmyTPj26NjTFUANyVQnP3
         y+mrzHuJbAFzvwzsPB3Omr7aRialo3JxvRHLQMj8V4LN55Krhil4ZcXuM8Im/5U2MFAm
         twalbcDBmNTiuDeEDf1A4vushDYSWF/VHZrhisv15eYGvQf7jyHlmetAE4MLX/tyWBF2
         4AjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=joOTb+VR;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id o4si13723wrx.4.2020.10.28.14.09.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rc69xRzyWs
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:48 +0100 (CET)
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
	with LMTP id xrdpEizuutCN for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:48 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rc3GyKzyWq
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:48 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 04/22] hypervisor: mmio: fix Wsign-compare by casting index to u32.
Date: Wed, 28 Oct 2020 22:09:15 +0100
Message-Id: <20201028210933.138379-5-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=joOTb+VR;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-5-andrea.bastoni%40tum.de.
