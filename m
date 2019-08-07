Return-Path: <jailhouse-dev+bncBCB7D7MXMMIKTCFK5ICRUBGJUD6EE@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x638.google.com (mail-pl1-x638.google.com [IPv6:2607:f8b0:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11384674
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Aug 2019 09:56:26 +0200 (CEST)
Received: by mail-pl1-x638.google.com with SMTP id m2sf1433826pll.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 07 Aug 2019 00:56:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565164585; cv=pass;
        d=google.com; s=arc-20160816;
        b=zvy5Ez2yWeVKGXscw143rN9vaFjS/HNvvW5FgpWF+Uk18jjvCFH+6vInzUeK+swwL8
         mhtm15lmbG2qk5+DBaGsRbpwuj4dVsU0Wal/U/J2IlGtFTESdlirVaL/JwL9ats4KBY9
         +keO4QiprZmrOsY5vB/7NTBrdmGdC3fiHPYV1jJYJ56Yq8RWPuvSUrj1x9IVc0iL0iQb
         10kh3dWfN6xl94DAh/g/nngfntJzj58BgqGCtGpp00+jXS8Ea6rIuAemeYupcd7/1/DF
         yIM56SGmq/V+NFZBvU5Gvsyn2PF/qe6cbhipgOURx6Fs6Vq1i3BTspkF1zs92e/QaitG
         WFBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rdu1OZxZ9mxe3yHUPs4/9O8fk3H+ETtbSbBxvqf3GrI=;
        b=y6CBTzJ1OK0y9zXVOV5bYuCPCT3jKz4oquJpDfx6WWrPpOE8kE56ZPhaBzP439Numn
         c2ofP5P7Fk58gYJXjC2s3pcyAbn1oSoM8jMzGWELAf/Ft7SRfKLmLwnQBMEf2oLqvy3n
         zxc80AsW5ZZSopMX91RKfAeI6MlDUIEfei9hu2ybYtZ/Bkr+2/+ygiwT7CgGWnw5O4nV
         3w6Zzy5EJW3w2Z29JH2HRRxRsXYKE8W4piALywUAAWqGexdNAk4vyq9prhfdR2lVj+O7
         hk8rekDI3bkCrcEhR+X93hg+Gu/kjCurtj+KEtBtgR3qCyMfWDpwWS0u8gaE9TLs6o5F
         YYrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YJhMWMMy;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Rdu1OZxZ9mxe3yHUPs4/9O8fk3H+ETtbSbBxvqf3GrI=;
        b=ECoKh7KhlocYLtJnhjoF039XnTnXG1+V5r83X1hOzdOwvW6BtqGYhxjY5rUxUIya+v
         aaProicrC7ssf8o+nhKyAfgsWogRD0AHwazAqlfntE20kB6kprGuEgdUefwFzQKH+Ji6
         p5v/XfEOrXE1M7qFCW6pRfksxbr6oX0BiNfohnyQBNz23Jv4y9kcdbLdfMyE3fVAxaQL
         94Twsz4f621X1mHD1573WK1U5sRSt6Z4SY35OzgS40NMeRdYIlxWAXSYT8AG/WhMdyE4
         gq9mL0hcx8WjzUp7vb/FxoinCODvEJypXAIsw6U+SCkGZpv6BCFaFLeGkxwjqFDqUu4F
         bfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Rdu1OZxZ9mxe3yHUPs4/9O8fk3H+ETtbSbBxvqf3GrI=;
        b=cqeUndY1Bp/MNSa2ay+9tJdVs7x71m+Jm2VHQesIUKZQzDsnsw9fRR/StJlchw4YzU
         AyY0J7L7IG2x70TcD3Oo0SPlXsnQ3t0jp1ZRoGdadwFwYRAgBNeP0CNrnBOT7xN5JK7f
         jYgChGdZx6w/km7S9g4ZjLj3q5vkKTg9qJo1klNMnrmpXcSGaQHO79l5E5g6fjwe/U6t
         ZpvV7rpSqMSSi0hixwzwv9fH2deg8eF6QSC1ZFd7c++LJdD8UqPg0bPBoRHlv1QNl/jQ
         G94hEShmoavaY/cEt5UdiJ8Ip98pGcRXiC5192yzTBeDu4knejQQjsjuJ5xkOCz+Kx/K
         Jz1w==
X-Gm-Message-State: APjAAAULIqP8nidhP2fdhfKvZEl/dDGnyJVdgkP28GfSFdyYu5/cWD0y
	Ik7S/zrJYblJltSTQIES39M=
X-Google-Smtp-Source: APXvYqxF+ojMDB9P7+cng3JmQfJF/kYENBjWgdAVDlMPmFSSEkNs/+Zc2M9b1qmSAtSFKevKzkXETA==
X-Received: by 2002:a17:902:9a82:: with SMTP id w2mr6903147plp.291.1565164585337;
        Wed, 07 Aug 2019 00:56:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:4302:: with SMTP id j2ls11753951pgq.6.gmail; Wed, 07 Aug
 2019 00:56:25 -0700 (PDT)
X-Received: by 2002:a65:6415:: with SMTP id a21mr6234228pgv.98.1565164584868;
        Wed, 07 Aug 2019 00:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565164584; cv=none;
        d=google.com; s=arc-20160816;
        b=wxu+uAkF1ZemjCfIM28B8V7RIV3rD2cs+RQJyME62ehilCmrOU77x/RtXDJlw9Rxr6
         Lj7hSy842X5cuDmhUiqqI+/+KI2TnrVMu3z/ogTbUFD26cwBvFv3yljytSZZrbM6u6l/
         J30VLHZY8B3a8V/0r4PPAP9yfP0d9vw6imeLcEp0aF4xG3DHBTHqZUSV/w4xXbnT63ju
         UApD5kLFxOGOK4zaiqx3J7Q4xW17V4Th75IWfuKDY4o80AZi5ZNXihM78nv1Bd8brIoy
         +XSdgsWUIrsZg7IncAeuxSP4g8h/rz6YIQF+OvyR+vfwe3Q5kA3PokVcrRubmTqbf+Fq
         RBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5xSxI2aJJjhLwG3KyYjTrXeLHfjstddAy4TsLbkz9x0=;
        b=oSDhn02TrW3eQg6bvhepRuyEQ/Fa6ZZ9j16BH3LDtJRObzF0e+4miKq58lCZv7h6JU
         vEVVGoAvH5bar0Qj00CyCgVNSjtLYiiejvGC7Z/2ok31oiFhsPDtXh0EoSnpuzQzJwlX
         oMuTlLeL1F8pLTlCcexYVx4oLF3SCFtTRDIJ3r4okt+HQvb7Ocl1JNf26rPHhdk4VilO
         V/KGmH9CJnXZgWeObWJPtKriTP418a6e6oBmxOaclEMTaTyPRdZR34qkrbUGRqe0WfAs
         ueSGPHtfVpQco6JamrUmceLH3gLFdORyjiZZAK8h4lQ+zX8BgoUW9yIgjFXYgaI+UYBl
         Gieg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YJhMWMMy;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id f125si4291065pgc.4.2019.08.07.00.56.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 00:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x777uOEp126337;
	Wed, 7 Aug 2019 02:56:24 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x777uOIo085206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2019 02:56:24 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 02:56:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 02:56:23 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x777uBmW128703;
	Wed, 7 Aug 2019 02:56:21 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Tero Kristo
	<t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 4/6] arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files
Date: Wed, 7 Aug 2019 13:25:28 +0530
Message-ID: <20190807075530.30444-5-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807075530.30444-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190807075530.30444-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=YJhMWMMy;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

Add SMMU v3 type to jailhouse_iommu_type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index d43800fb..d435b9f7 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -202,6 +202,7 @@ struct jailhouse_pci_capability {
 
 #define JAILHOUSE_IOMMU_AMD		1
 #define JAILHOUSE_IOMMU_INTEL		2
+#define JAILHOUSE_IOMMU_SMMUV3		3
 
 struct jailhouse_iommu {
 	__u32 type;
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190807075530.30444-5-lokeshvutla%40ti.com.
