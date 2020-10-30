Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBN6U576AKGQEV4VGBTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B922A02C3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 11:26:00 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id f14sf2462985ljg.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 03:26:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604053560; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tm+2ndZjHxOOCyTBh5m8IOEMSrvmZ0RESu9ZSv7ZN47lv71HB9c+WDVi36uhOhkEvp
         sUEgy/sNz3F5BHuLagl9BE9GUZ6JtNli62sGPXM0I2NGmfl29jEgZDqAOtsg0XVZbn+w
         4w5IIl6WvAd1CSfhCcp0YoZkoEN/mSY12Tz1ObJoFFuQ2ciVAEcUwi6M34QdvRijy11g
         8DD9CU60mLPKJmamwobKOKUDO2/oXUTQnWAJQAAhE9Nd8DjMEjOkv7KOPcBy4CetW/sc
         wVgpltGEhZxPeRWQ/P4YzMrgelJjLb/2AS5dgl4v/xE2Gd1nLM3VTLqK/7UdWHli0w1J
         Ovfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=HmIPrSrujJvrY8VZKaT7jDkQHVZMPQmN0ZXZ3fxxHD0=;
        b=0sNFJdXjgJZvxMn8bPOY6H5pdt6nVGsV+zlAIxIu2/N1mLoypdNykyp2aHbBDboTep
         7+ZzGjI9YvKkjNrSS5StKNh/SrdBy0f2ryHzvM8sTVlMRhZeLEBoAfqLo4TlV1UrqlXk
         qADJxteTN2YEtlK20W88qadKCUbpOnGa1VLsU8oCFjU5wl9NyQh5SfucYZV1Ccpq5g7Y
         80w50L66onMFJPCnFTno4uoDu7SBDu6wPJkhzPsdmNq86TmWdXfNytMP1IOMJqOWUAfA
         X4zJm+WPAdiirz4BdnnHD6vJCxu2NdjF9iZ3NqhowlLTuHtpW9mBxJCU3o+vsQkobUDS
         1ydw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=FeFSAr5V;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HmIPrSrujJvrY8VZKaT7jDkQHVZMPQmN0ZXZ3fxxHD0=;
        b=ly6lF1ALoU9d2138VFxAiCOwIKkJqMW45TNeK+PG7lUvVbtD1q8I4UjNn6lmSsjCYV
         L8c55JUM25yWnh7WliDitteeiQ3VBhUVsvpO9qAKm0X8YJGoRyDLhuxn8wWYs1ICmE5K
         Zh7oogJ5WI7RCWaDW+5QlV80XNH6BXXWjwlqChDTOHfNFXoWh+fQbYezqCvLsMAHcz3i
         89HDql+laSNC1IBhexfRw9FHMIgzOrYWrw70QRY5ykO7OV86nwDfymxX0ksEki2PoPUe
         g2HgNjqcsWOkXWDUFiv3o885WZeQ5mTqH95PtvKskjanJiO6MddS+DzDFRK19vaFUyCn
         NZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HmIPrSrujJvrY8VZKaT7jDkQHVZMPQmN0ZXZ3fxxHD0=;
        b=Yb4vL+x0SMnJHWSCGZRGvOsmH8ii8OrMnegLq1F8XcunVfxT46OUFpTyDlzoK47SWa
         /ToNIqv9m+LwfLzp3r/dkm2WzOj3s7PJ05X/MlqRT/U7CJma9EYktSw7giHMpSJTXvBA
         vC+XO25fl2Fad6Z3JSaCCvQssMTqUWFHJQiMOK0vh1NARTDnsgx5QhFceq1tuWhraJcD
         6Ym5hDeg9ee9Bm0p1hPtPAd7les9Z2vNe+tnBB2fvB8DHIYusPKDLc/pgLeeSFi89AQ2
         bNB3Ll7+ru8Q8Gjb6bft5x/pTGuCjnOnDKIxkbH2GCMm4kC4htdlnyzzx9cgv/JQuKUY
         ZjqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532cR70KllJTUVhxZVCqnQk+kWOvcCZHUPQzN6lcZF7lNXNFpYX3
	AOPpLTAPslsEwZpkiW26wGE=
X-Google-Smtp-Source: ABdhPJxAM22kplF1CUiHefcfdyUCZkm2vRR6vERhm/9EL7YlZ5tiw3j2OOZmn2c5Yi+cQqIO6vt+9w==
X-Received: by 2002:a2e:2c17:: with SMTP id s23mr753263ljs.436.1604053560286;
        Fri, 30 Oct 2020 03:26:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls437115lfd.3.gmail; Fri, 30 Oct
 2020 03:25:59 -0700 (PDT)
X-Received: by 2002:a19:408e:: with SMTP id n136mr696459lfa.417.1604053559045;
        Fri, 30 Oct 2020 03:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604053559; cv=none;
        d=google.com; s=arc-20160816;
        b=irMsYA31H46PvMr401HdJmvhBn0odkflr+7WN+sZVrwW2MCkugrXP6nE9YkBU6+kht
         rKCavxaOFhWiSDT5EZ5JlG5do5vGxuzEriTwGo5LyRuT+V5EENrEtTq6TdrQXxBDhRMB
         0lyjtkNZIdGDhlF9pxlu6JkFmpke+my1gxYhZ7Swy8E1JAfxfIPFsr6mHHUhLfAYesRJ
         wbAt3K7bki6Nc3SChhKKQN+xMWlnopoVe70v1k083tDAooGa/02BS0C3Bh4zQmdXyboJ
         rdVYirCohTie90ESxAyk9KBJQLvqKjJLfhswa/5c2eHczRPVZGC4+2Eh4EH1Onv/wEzy
         /tZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=/fF33cx7XkH5n/3pbcLPqOgQMy++ImAM40UQmG6uXLw=;
        b=aNAs4/2dpPzysZ1JOHseLGWBzx1NoLZhbzDoXpIdBHYjJqTVbgkBLDA72+4PsNFs7p
         /uiSMVKMRIST/Wuxon2yEpKMkwCh2joZ0RKXgioOdA2ChoITIvhdX5JQiLzRxSjBd7Gi
         pfg/PtLRxbQ4ZOzmdAmT+eKZIy4gL37GDvKlEeKRteE0udT5SaZW/VPPgi1Sz5VSsidi
         22aIKPptzyAU1+j9pqHgGK661dlio7++dbVSJPwE7IP82xglHAS1KfU1rZMuA7V5+3vZ
         1dOa25Q7jDdLSlD0xw0zREFqV0L9LxN4sRKbAaqVRL+b2cUMbPxpvnp1jGltyfvJuG41
         KfKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=FeFSAr5V;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id p1si137389ljc.0.2020.10.30.03.25.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 03:25:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CMz3p2t1HzyWm;
	Fri, 30 Oct 2020 11:25:58 +0100 (CET)
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id DDlqCTGP9sWs; Fri, 30 Oct 2020 11:25:58 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CMz3l1979zyT4;
	Fri, 30 Oct 2020 11:25:55 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH] configs: arm64: add SMMUv2 configuration for ZCU102
Date: Fri, 30 Oct 2020 11:25:40 +0100
Message-Id: <20201030102540.131429-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=FeFSAr5V;       spf=pass
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

Add SMMU support for: USB, SD, GEM. (See Table 16-3 + 16-11
Ultrascale+ TRM.)

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/zynqmp-zcu102.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 151285f0..bdcb04b3 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -23,6 +23,7 @@ struct {
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[8];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -44,6 +45,13 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = -1,
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_ARM_MMU500,
+					.base = 0xfd800000,
+					.size = 0x20000,
+				},
+			},
 			.arm = {
 				.gic_version = 2,
 				.gicd_base = 0xf9010000,
@@ -60,6 +68,7 @@ struct {
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 
 			.vpci_irq_base = 136-32,
 		},
@@ -136,4 +145,8 @@ struct {
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
+
+	.stream_ids = {
+		0x860, 0x861, 0x870, 0x871, 0x874, 0x875, 0x876, 0x877
+	},
 };
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201030102540.131429-1-andrea.bastoni%40tum.de.
