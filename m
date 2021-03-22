Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBKPH4OBAMGQEHNGAFEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E36345028
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:42 +0100 (CET)
Received: by mail-ej1-x640.google.com with SMTP id di5sf20312162ejc.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442282; cv=pass;
        d=google.com; s=arc-20160816;
        b=coxrmRdvW6nhAU5pp0X7n05AVBYfoubckW7FefAdaFS18IPZQgER0pV+zj/iHCR6tW
         2SRpTEHqz/fnQXB4jMHLPPdY5QqXBhgEsAfIX3VLo/+sV9UC2M00oMyKaFd0njuz1a/O
         TV+4WR49DXkBUNaRa153AFkhjGW5DCoaejN7W4/3ZpyYxBfn2ujvAEgJ5ypqMyRENuFu
         AJdlOB0g+lk9zV5tYCa6JfM7i7tPOLDqq1TWVNMTOOPWvugSQZ8LTUrQ9bmUU8pKsbbP
         D5wTfrGoH2ED1XiLb6auPNUroT/fduHKO/y2OJbLlGsncCE9iV7S1Eg+pkOaD5eJQxto
         dfcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=yFjOJNf7gOTFXepNKWUNMtvmNNuIPVvXKmpdVvyZgRs=;
        b=lKaI2SkWga8qYKM/MKTNx8hM0OP1p49T+BX/9RVLkPKf/9kUJ6a33rDvkOfxWvc29n
         rOpBbT3mgAi6N8m4/V8i02CJTPkykmZhVg1iHI77fcnREeQYGr9cM/+N0axtLM6qLt9c
         coG5W+Pes20Nj4q5wkj+L8BsPHP3OLQH1ejTm8j+7cm4KX9YiNAgDTSFRFfcirHe0cFK
         Yc6Ty7Y3IuZoDFWWzgrD/NSE8iEbRk2txk35gFXAJCZwmpN+6H4xX4P0mP3R/ItMwqWn
         872bvP3yJHH9BmcYMBEZ/+H2WKh1qPCCiepXOr5gjY5+6xJtvokfeFDgheWUMohVgscy
         v4Tw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Yzc334je;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yFjOJNf7gOTFXepNKWUNMtvmNNuIPVvXKmpdVvyZgRs=;
        b=GmvriDLViMvED6iHhya8W2bQQM9FS8vUAYtPQaLz1eycAMFV8bKSMJ7ucAGkcCl53E
         lh/5MKrVCChBNTDtgZBQjclZ2dOE8zowKtJrri1VcfgPvB+zR8MzBPidjEBHI324vYPp
         rd9Gmjktif4bGeh2VHn/wxt2J9qZERiVlmxDz7RJLY8htr2RXu1ttTUWn3G7gNYk5a7D
         L7hBx2o4g5LlOE2DYEvWWzI0iOg6EboLxbN7LGnkaF5cRaveQTfpM2IgErSMs89Q/R7X
         61OOWP4SwrX9eGC9Qtk5252OGuTbnBO4vUO/sjwi4qFf54mFTABEnYdYN17iQfZiori0
         ZyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yFjOJNf7gOTFXepNKWUNMtvmNNuIPVvXKmpdVvyZgRs=;
        b=eWrh5TMUXQIg7TzRebRTZjT/y3KyoNgYb6LmIcCVJbLtIYINn/UTrRfUAmADc4sTq1
         KsTl/NGYKuiJg2lk307LelPxF7RW2t6FkneT1REwYU7qzSvWTxvpPQ0REsSJbtrkLl9R
         13qIUwldpxPeelVdskqxX8J1pzrm7dYyq2XlyONJ9jvggkIuh9X60wHXLvhKKX0NRHej
         Eac/ouEdIcYP5Qa1CdvUp+0RzeS4Mj9SKPGD1ps72QBAfHtAZ7ycJCDHuPnZuDUSREOi
         mczvfWiHWZyEZOs29rcmYfp9F1mqGQv/HLaPJqZaolHW573+ZT1Ew4piYeLZt/4KXBWV
         INEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533iNXk+8YybAO8/CfkYTM2gx/JcNRjpo+x60HQzzqefuoyvyLMy
	c+SPhUK9kasl1eQsCXmKf30=
X-Google-Smtp-Source: ABdhPJzBW2gZ4OkZyGbZrKYb/4w7lavu7+tV2QTvhC/Vx8EFCLDZ8x+utvHdZc43hJbvT3MMJ9+PwQ==
X-Received: by 2002:a17:907:76b3:: with SMTP id jw19mr1377508ejc.202.1616442282036;
        Mon, 22 Mar 2021 12:44:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:d06:: with SMTP id gn6ls7894705ejc.0.gmail; Mon, 22
 Mar 2021 12:44:41 -0700 (PDT)
X-Received: by 2002:a17:906:524f:: with SMTP id y15mr1356898ejm.65.1616442281030;
        Mon, 22 Mar 2021 12:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442281; cv=none;
        d=google.com; s=arc-20160816;
        b=Ou3V2z0JQB2PArSjEXQO6t0sdnOKjMuQfGRFIu190T5eZ7zNvE284nDSY0RPIO4do+
         nDuKFBHVElXlIVkWt62C45mUy5geppcdv52RvN4kITxeout885w68iXv1JfD/xfwMy0N
         4+wBtlwxuBqR6+8yv4PhGWmpIFAj+wOrqNhsFv0yQL+6LMW+8+gvKKKS3NYI7QIn/DiV
         xBWRWDxTkxuRd7nmsDnJ1sVZmEq6DygZJxYwDraYUyf5gR7cEFj5qvnLFFZJlVdfuU+L
         LyGlec97WVlSR0B1NZ/V2J/c1J3l7O+Ixdqv8/NUUHsdA+ymEINt7YIS3giJT2gGiWwq
         3BdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ttrofVygBV7WT66jpWuQJrtC625QpDNN/qc9DnIfaaA=;
        b=cO+7kbf3AEhEdM+/qjEPuUZB+Oj8KVi81F7/S/eLKbxPUy8bAar8gSej+CNhS/3K+1
         G1mJYTGEhD8D+cTE2c8NFwSUNSW9IPDKMaFlyPB5l1gw7Op4R+U3XLjpV+IIOLohYTLW
         mpHA6pHkbSZQWz5M9fvjRK+Z6ZOukkKCVRXz7VUuDsxIgffWvMMHEQpscDH3kOfsIltE
         c6RVuSy7HV0bzhakx0hNWViz9QTV57HQ9Hm7ZaBfp+PZUwGZOLoy+ugSBf59DnNzCya3
         2SK7N0bn+ayydpJ/q+dkgZ7V00lAb3c/vPJVQnFXv3jb7bAPuAmm4q2uqB2LONwhe9UT
         TGkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Yzc334je;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id f25si601624edx.4.2021.03.22.12.44.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hS5PxBzyXh;
	Mon, 22 Mar 2021 20:44:40 +0100 (CET)
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
	with LMTP id mTbO_LCdyIpK; Mon, 22 Mar 2021 20:44:40 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hS1M0pzyXl;
	Mon, 22 Mar 2021 20:44:40 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 9/9] configs: arm64: hook-in coloring parameters for ZCU102
Date: Mon, 22 Mar 2021 20:44:10 +0100
Message-Id: <20210322194411.82520-10-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Yzc334je;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/zynqmp-zcu102.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 492dc566..2095762a 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -45,6 +45,9 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = -1,
+			.color = {
+				.way_size = 0x10000,
+			},
 			.iommu_units = {
 				{
 					.type = JAILHOUSE_IOMMU_ARM_MMU500,
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-10-andrea.bastoni%40tum.de.
