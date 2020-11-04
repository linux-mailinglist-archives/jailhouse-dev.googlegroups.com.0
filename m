Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIEVRP6QKGQEQJJQAZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 425492A67CF
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Nov 2020 16:37:05 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id m17sf1439786ljb.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Nov 2020 07:37:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604504224; cv=pass;
        d=google.com; s=arc-20160816;
        b=k/Xu9+ylGbXEsX8a4ZEz8IvjV9Sc2inIAFWRl15oZwrUPsYuuojy4IhWD5dkPL+ILA
         swZCJF1n/WyjKpVuxvWrp0xdqtbycotPjFA//usZIdbH5qlg8VTJswhDFdvF09RPAM89
         MflgXCCcNBw8wsqk6py3e469d/ECiUgA/HfwnHk3m1L9Ez0/SJNPihlAjUQu1Hcemtx1
         o4Xqa1a6eDXcZiwjolbdBf+aYkStQFoO4EsIkWRqIeTBmphK+NO99+SK16c+HA3XSyDL
         X8tMLpq5cywrWhXlcss/pAFb5RDbljb1mRsUByCAHjvOIZCzeZo1i9QbXAg+5Cgpg91G
         X/Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Q68KfaPmr1jVQnd1ef/i5GbE2ya/WP7uNkBbN3AkYDs=;
        b=eBdZwAfO+ecYwMcvyzLvCTQKrPjDbKpK05HSxtQ6rnuJYZrPyqYFQDm55syo6B85XW
         0pPfkvOqzx4yYrthS02Tt98fqIQnwPxVeZ3SMzfDIM+AI/swSsyJquSKJnRjTns8fuwc
         1ITavs22VJ89Afns/VnAK+k4GBEJLwUUOhLvK2ltt+/yzDzfTv6VYTNLEf2O/xEzCCtx
         Y3K6nUvuWsqocwDW1hZRli2Dpf7oJfmx9duZMiCxTZFsNBw6vCiYMoZ/i8hwMV0+VrzO
         4w+iJ7v0kyfOCaLU49DE08o04i4MNJroqt2Zm+DUkXYA5Xu8vC8invfok0Z86yoYjGjr
         5bOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=fKefoUZZ;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q68KfaPmr1jVQnd1ef/i5GbE2ya/WP7uNkBbN3AkYDs=;
        b=iRTwfptxINA3ye1YV8oQx8RErKspkVaeb30K6e6oGyJsI1Sxd2r3E78JjSJmysvNt5
         TQSc3/dqcDimQR+hASQ6wIPhNukiIcRt63fti5ZP1Q/10xfAZ96hEWdBdHBvWo5h0Vdd
         FzrbA1DmiWvuSg8YaFqFtTZzkFsWoMoavg2bAswPVe8498f8X8hASLEPz16G27BIt1vd
         ybEWFAKrWJhkpTdobvdYuidY7HV5Jx50jm9R/PQe12hoSp9acduTiHvztpsH9EQyEg5S
         98fV0LZai5dWFAXD+WUlEvd5P+39M5gOUFSUxobI38oP0Be5VnHaCycu8PqBK7vZPyrO
         6TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Q68KfaPmr1jVQnd1ef/i5GbE2ya/WP7uNkBbN3AkYDs=;
        b=a1M923ORrmDkXewkJ/AKuMDIkfmnLkrIJjrKP5z2AonpHbkgwVWNv2x0vtbjddKajr
         JUkq45tCKR3xMq2o3rZV3nEvS7dEAeIGd4U17FKvlLH/t2gxAjmE0K9okNBxvq+DBLDO
         Gc7VRuYVAmh1qBmQmbUe+o5SvfVJGb3yiehBSkQ70mWv4tfxR/L2NXLzg6usEMGwX0rq
         9DNhC5WLR6G2DkF9MfVAcJjp/8uIDiR0WJIW1DHGdDdeOSlFJMXiFWoj+/SPruTm+4dU
         CgT2HU5O7sqVX1/XyYusMqybCKOpPp44Ec963aUvoHta8eAsZWODEth5JsqUbP1+iCOa
         IHWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531kVd5LafCNM5ROJLx6HCXTapV1oFj3zXq1CuTd6opWYmwkfObd
	LTqlYPacZmxZQ/kHKKCexjs=
X-Google-Smtp-Source: ABdhPJzazMFsV1YE2yOyZD8He6w5LAay5mLKq+3xO1R+O6bwqVXW1b0j+lL/NyzZteCWnP8hAirvIA==
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr6110243ljg.26.1604504224776;
        Wed, 04 Nov 2020 07:37:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c15:: with SMTP id x21ls474928ljc.8.gmail; Wed, 04 Nov
 2020 07:37:03 -0800 (PST)
X-Received: by 2002:a2e:819a:: with SMTP id e26mr11522584ljg.469.1604504223327;
        Wed, 04 Nov 2020 07:37:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604504223; cv=none;
        d=google.com; s=arc-20160816;
        b=O0RHeZ8ufDJAt9ADSX/EyVWBZdk82ByIC3qbRIjiczVsCUHhDNSjhr73Bq4jxLDqCE
         vCKKR8//OS5DWq3gOo4hscsoylyDQ/CJX6UGclf7Xv5FyssQWxqhancFpAGrB+1tk8jW
         uA3OlQc7OE5rUR+Q8JunNEGi8VmJrydRD6UchnKNsexnNeCIwDQder3U6GkAiNLYgtEx
         FVN3UCsb3XjY5O9tZPe+LHbbcerKIh6ax4jWsWH+iGvS0tsNwHLAvd8kd0KIL70OwoRS
         shHxV17o8qW16JT7m19xZ/ZnghzWUbYhamrvzmJAFbsW8ExKXnqvdSWFoHMmw+P0o07W
         KpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=RwAg8fgvVxRSZ09LpiVVpgYhkLYKySRsKd0INB+rZhc=;
        b=wCJpQYmK+QDzH7myE2YwrdKx5QZ8sS/savAcC89lLczyIypKEebqvCILbjNFdZElw2
         H/TStK3mgefw245ip3CRql/T1VlSqmt3S/43DmmtMRqiMpQS1E0CzKHlplhQhn/KQlRx
         GyQ4TXFVkXUMynb3/OwTIbK4zm9TyTqmJDukcS1z+8lC+STbUSa/k/kxGIPL06Y9PvoX
         LL6YOI6MrNua8lG6k4XtRMnXl/yQqp9pkb5eskeQceudS6hpVXAmmXt4MaefgjAMbuBZ
         YKpMlNE0x76/JmUsW6UnL8BdN7zNmMQauOhysgWyLTnwzD6yOekNNWLLl+lBj/OiCbW3
         Cj/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=fKefoUZZ;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id h4si61735ljl.1.2020.11.04.07.37.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 07:37:03 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CR9kQ4RlRzyT9;
	Wed,  4 Nov 2020 16:37:02 +0100 (CET)
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 2fVRlr8OwAvx; Wed,  4 Nov 2020 16:37:02 +0100 (CET)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CR9kQ1gNWzySP;
	Wed,  4 Nov 2020 16:37:02 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	jan.kiszka@siemens.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 0/3] RFC: SMMUv2 encode mask into stream_id
Date: Wed,  4 Nov 2020 16:36:45 +0100
Message-Id: <20201104153648.35076-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=fKefoUZZ;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
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

See patch 1 for the description. The patches apply on top of the
previous "configs: arm64: add SMMUv2 configuration for ZCU102".

I don't have a imx8qm to test if the translation of the sid_mask into
stream_ids is correctly working.

Andrea Bastoni (3):
  arm64: SMMUv2: Directly encode mask and id into a configuration
    stream_id
  configs: arm64: Compact ZCU SMMU IDs using the mask-id stream
    specification
  hypervisor, configs: remove arm_mmu500 sid_mask and update imx8qm
    config

 configs/arm64/imx8qm.c          |  6 ++--
 configs/arm64/zynqmp-zcu102.c   |  7 ++--
 hypervisor/arch/arm64/smmu.c    | 57 +++++++++++++++++++++------------
 include/jailhouse/cell-config.h |  4 ---
 4 files changed, 45 insertions(+), 29 deletions(-)

-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201104153648.35076-1-andrea.bastoni%40tum.de.
