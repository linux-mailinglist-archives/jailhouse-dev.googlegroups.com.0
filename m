Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJV4476AKGQEVSUPISI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD129D243
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:59 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id u15sf286633lja.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919399; cv=pass;
        d=google.com; s=arc-20160816;
        b=HyHWNn93Ygcde4D4HVR03emZQN1q7lry2JdhP+Pe2PuBvO8mAJBepIhuw8SCE6XNN3
         w+S/XV0txpx8OspaV0Ubdt6QfkA+qixxVKyusueJnVqwUgO/4KN7bBZ49QOyovfe+iZQ
         BzNN4nNaKvDQiwzaDC2aE0EkcRsIjDL+SnEudWvzBkDyM+XTnVuI6OTzDF6bONg/tQ+7
         1wbGL2Ca2uVj7ujhdPt8IrnQJ0pKmU/SDIwxNfmAd24yRLjt7Jut2NR83djgOP7BHdCA
         495JnAxUNnwEFxiDlsAorwyFNMoPxLGBgd9LmhklzZBE3TeK2buqvl13EUKQ4mUYQhWR
         CUWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=cO/OgvpzL+qja0xtUMhqIpBleMdJw6nKE8u2R9xjVwk=;
        b=PPqZHNeylCP+m+b6GgKEsSYK7G9xZrgW4g4iz7pvUtC96crBraB8RzKbEfHXCaUe3b
         ZHHCQTy6Lwy+Bwrc9zYXeq+ibpgd3uPthHNZPcmc9MjY+/yt7OXOV+yJ6ynWvFoOYOgE
         diiDV5dkGrwrKLEuDDge+ay8iJ5gDPRxgzfiovg+ZXZ8m46ilL4Eg47l761/AP3FXB+D
         trRA1AOTNYBBWqZJcp2pV4zV0gfSWUVAmzjRez+u7QMJLeDu76xec6b+E+V2XAv7ewRH
         BDmDhwFc3rBSnvQEyZiQXvtIrVOrm+7SrefAqhScjsnu6sz0XMF5lgHQXfk0P692rh1v
         Fgdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=LlF0i8qY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cO/OgvpzL+qja0xtUMhqIpBleMdJw6nKE8u2R9xjVwk=;
        b=o+qxPGIfBdGc52Fv5wMLI3iKi2YCWFAurFYSi8CKAA8ViJY9Iv63hxu1KXvOBSEY/X
         OnC3CYFjz1cnNq5C9zHo9IufY4cXRw1Fc66KoM+hCX3t1uugdmB+b4bTTRI30+pdV8jG
         2pKFZE8DKr0iVHvs4F1m7c577SvK/qKqwCaJ7ZTvLzSR+DmspCIMEpMzbHI/eivojGqF
         NZePM4zefmQw6i0ypktAX1DNkuGyMv5+CtlG7Rz9J26KsfVe3xmNzTLtKsLbhCZ9Hhk0
         QTWzHxNio05r4+DPiFKQriFZbv0MfHYsqMp5HwbZESiC7Y5v/WAfkDvfFaHrTUShQMYo
         ARAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cO/OgvpzL+qja0xtUMhqIpBleMdJw6nKE8u2R9xjVwk=;
        b=E8bJJVW0wCWL0Ba9DAtgRzAGQo4CC8iGX/Pz5x31z0oF1UAFZIrXJD0xjfxRMhxQIw
         Oamv2OcpTvPElCNWKmrfMhlK5Ptpcu9kYyAfrSw4DQ1eM5WBTMjDCyMVKCna2313O7hM
         t6j9onWSTTLXZ5wtoJmjkUCjG83IhToJBGt+exObaGQ511q7cnhQD9tXMefH5s5XC8Rp
         6Ax0QqdqB/eVT1h6RJj0Bfg0slNoDh88KffsVpxws7Eg/affx0b+dwiBjv2IOMhq7MHO
         BjOrRVfXIPnDHFO5+LWTibeX8keZue+0qzacUINxkbdSn9qgr2pAinURd3tnidafCbA/
         ffVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TNQX7FvmMllJhwscUbEizvbQG71UimqdWDYN3Pg9ALjBXz2jP
	3//9w4zuyrY3/fEr/WjaR9c=
X-Google-Smtp-Source: ABdhPJzawnVYRmWdwSTNy57zGRHQor8BvLOb6pIRy8eQXzJIqo6hKFIzJOLCYXtDppKwmQQKAcH8qA==
X-Received: by 2002:ac2:598d:: with SMTP id w13mr386030lfn.11.1603919398873;
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:546b:: with SMTP id e11ls276393lfn.0.gmail; Wed, 28 Oct
 2020 14:09:57 -0700 (PDT)
X-Received: by 2002:ac2:5e38:: with SMTP id o24mr405078lfg.18.1603919397726;
        Wed, 28 Oct 2020 14:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919397; cv=none;
        d=google.com; s=arc-20160816;
        b=gE2uIPweYn8Mch3019iOGhKLgAZzuzqm8hFbfgneHvOsLmfsJF7DauPPF1RKDCgJuE
         R9wtPK2a2DTz4PZ6vvuNSZ4AGss0Jixmy/uURi5POjUj8/MZYDsGkozXjLBydGifWDEM
         FCG/JTiNu2YARdrdbsd9hHl1tkGkim3XMB7prv7C7QFWKUZOgr9UFoCJhlng1M1RjGRS
         UrBfyPdjWE0mQEvBQkkzzwVjQCcu/+n47x4SqK2q9QWdSUU6vaZ+vWuQPYRickWcLncX
         KdrjTo0NrosUnOrW1rk13m7sj3KEOexCi+V1nHCmpyl4YS7yVN34+MAoquMoSM0qYPWz
         et2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=OlMSJXKSaV6ZrLUfn2vtrHkO/OmFe2VXl8tBl4cPwqc=;
        b=cFbp/g7yGt9kxg1f7SqBY6785XBs3/MKhdZ/6z0uUjnyJq9XiiE1r1xbJRiKsWuYp3
         B3+2VvNUKbphaYncDq5WL1ylY39UAhHvt0FFO31gBbz746YWzmayB3qqlWgZ6QsS/elu
         0orCafk46+e5VRcC70QjZ1HhD0L5BmwV6bKo9Y5VWpGxDOI4xKXGjXbFfKUNXPL92YJu
         ALgw2dd5xgFyfnDN0zstqyIgzV1OmwoW2fpPFvJaf2fgFTNZfLTXTrA4s9yf28MdvAYJ
         hNu5YMYL0MtSyhtutJA7QYsOLrc4m1v7j+L4Mq5J/QdK2EwkLYBfoJ5YNYGxoxdOBBX0
         i4TA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=LlF0i8qY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id i16si21369ljj.3.2020.10.28.14.09.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rn1mtjzyT2
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:57 +0100 (CET)
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
	with LMTP id Vo1qLtHVGnwP for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:57 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rm5kXmzySy
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:56 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 10/22] arm-common: gic*: use uint instead of int when needed (Wsign-compare)
Date: Wed, 28 Oct 2020 22:09:21 +0100
Message-Id: <20201028210933.138379-11-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=LlF0i8qY;       spf=pass
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

And similarly to gicv2_handle_irq_target(), rename "i" to "n" to avoid
suggesting that "i" is an integer. For gic-v2, fix it consistently also
in gicv2_read_lr() and gicv2_write_lr().

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/gic-v2.c | 18 +++++++++---------
 hypervisor/arch/arm-common/gic-v3.c | 10 +++++-----
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index c5ad0607..4b69f74b 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -23,14 +23,14 @@ static unsigned int gic_num_lr;
 static void *gicc_base;
 static void *gich_base;
 
-static u32 gicv2_read_lr(unsigned int i)
+static u32 gicv2_read_lr(unsigned int n)
 {
-	return mmio_read32(gich_base + GICH_LR_BASE + i * 4);
+	return mmio_read32(gich_base + GICH_LR_BASE + n * 4);
 }
 
-static void gicv2_write_lr(unsigned int i, u32 value)
+static void gicv2_write_lr(unsigned int n, u32 value)
 {
-	mmio_write32(gich_base + GICH_LR_BASE + i * 4, value);
+	mmio_write32(gich_base + GICH_LR_BASE + n * 4, value);
 }
 
 /* Check that the targeted interface belongs to the cell */
@@ -277,23 +277,23 @@ static void gicv2_send_sgi(struct sgi *sgi)
 
 static int gicv2_inject_irq(u16 irq_id, u16 sender)
 {
-	int i;
+	unsigned int n;
 	int first_free = -1;
 	u32 lr;
 	unsigned long elsr[2];
 
 	elsr[0] = mmio_read32(gich_base + GICH_ELSR0);
 	elsr[1] = mmio_read32(gich_base + GICH_ELSR1);
-	for (i = 0; i < gic_num_lr; i++) {
-		if (test_bit(i, elsr)) {
+	for (n = 0; n < gic_num_lr; n++) {
+		if (test_bit(n, elsr)) {
 			/* Entry is available */
 			if (first_free == -1)
-				first_free = i;
+				first_free = n;
 			continue;
 		}
 
 		/* Check that there is no overlapping */
-		lr = gicv2_read_lr(i);
+		lr = gicv2_read_lr(n);
 		if ((lr & GICH_LR_VIRT_ID_MASK) == irq_id)
 			return -EEXIST;
 	}
diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 949c4598..126f4524 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -529,17 +529,17 @@ static void gicv3_eoi_irq(u32 irq_id, bool deactivate)
 
 static int gicv3_inject_irq(u16 irq_id, u16 sender)
 {
-	int i;
+	unsigned int n;
 	int free_lr = -1;
 	u32 elsr;
 	u64 lr;
 
 	arm_read_sysreg(ICH_ELSR_EL2, elsr);
-	for (i = 0; i < gic_num_lr; i++) {
-		if ((elsr >> i) & 1) {
+	for (n = 0; n < gic_num_lr; n++) {
+		if ((elsr >> n) & 1) {
 			/* Entry is invalid, candidate for injection */
 			if (free_lr == -1)
-				free_lr = i;
+				free_lr = n;
 			continue;
 		}
 
@@ -547,7 +547,7 @@ static int gicv3_inject_irq(u16 irq_id, u16 sender)
 		 * Entry is in use, check that it doesn't match the one we want
 		 * to inject.
 		 */
-		lr = gicv3_read_lr(i);
+		lr = gicv3_read_lr(n);
 
 		/*
 		 * A strict phys->virt id mapping is used for SPIs, so this test
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-11-andrea.bastoni%40tum.de.
