Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYUGRGPQMGQEWKW3CTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF5968D67E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:11 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id a42-20020a05651c212a00b002924f5e061dsf3352066ljq.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772771; cv=pass;
        d=google.com; s=arc-20160816;
        b=FKWPfIrKqrDwiaZN6Fvli99yrHiChFs9kJZuj8ppbJQWJbDOxG6WBlMTLL8XyuhbJb
         Emh290W1yFLiz0j17M+YE2QcWt3gMU0TWryjncXiZvW5+HT0oqJTYNJ/PWHwQuM7FyJ/
         Drrpb7zgaf5G2dhZ9rUI71RRIMDud5kQk2dHYblrXL1/L4PaYO5hKxUZrcPpeLWEF7up
         TzN+vpEztpHo7lclsh+rLaMyyOH7oYqNYd72KyJkxw2bHFlZLLYKx7lpMjASduegSOfv
         B6WTLU6Ai3IARycxeb9kL3LqQaJLnjl3aP9C0EpJIXauDXiiv0EPC0jmDzZUM6orGBVJ
         bDLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=5+a6Qp+uqRyolgLT1UB3nLAM/B8a3m5Wwae9lHRPLNc=;
        b=qCXio4xN9FDrubPKD41AUzdA3qS22a+GnivR2mm9ysND5cyxXahc/zB6Eu4l6bI2qr
         d7QNXDZKwRCwLFcJtqWa1hX8K54VJNjnNSY29oqd7AM6J9aOI/T5IUIe8bLWEb8gMPqP
         MwuNKVRRwsrgWe7Ryt20c1LQMvS9E1jiPKagwYxZRYsqm4HE+AulyeIpmv6UMweUzg6f
         fIO5+oFZCFbSm5FeOnrCKH8qhrKuJ6LI4dEhG4LmzJ5C7lyBmE+tMAsswblY2RqWFFqP
         mIugtbqynwJFUKn3JcjnbsAaVDskcPZbA8B+chGQ07Ncuw7+pgRcw0o7i47eGDiDHpcJ
         kUyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+a6Qp+uqRyolgLT1UB3nLAM/B8a3m5Wwae9lHRPLNc=;
        b=eGv9Y8HdIvJYsFkzmOz+IRXL2Q1j4YFQOYUUIVsWnSC4E5p6O3UTJI+6P+XpS3coWA
         rJtJRkCiJcPJA05cr/Jl+Xya2zz/eoUHb7fXEvXKe5JSEsSAYiYmTGUWPw0KEC+oFPaw
         wYU9rFNx2ID2CprTo+x7u3iej9ZAxGNqUJ4HqP/vQubrx6kj6wzTygtOVB7qhzFt608L
         iGWCEmjzHHRzu1tFciI7FIgY/JRbwe27GIaJq2u3/XoxWc9iTbuFesCLoWo3iiEbBHCl
         TPPFpKWVLmuR+/pE/G5TMI9SEaoge0G/nndYQiXMk2jjKqDASYJV774JX4Y0pL+4ezwU
         wN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+a6Qp+uqRyolgLT1UB3nLAM/B8a3m5Wwae9lHRPLNc=;
        b=Zd2jymwGy6y8AgDGEFaGUBWETo/AbTeredpABELbt/PklZapw7edX6IjVu0SgEICUX
         9b3mA6klVRPC8EcAZIcv23DsIif9GpH/BbxH5JYHD4nbtoCqs0pQVX9mU/1vXZHrKk47
         0LlPZzI1stsZVwM7KXkukCu8d4g/T+7utswzj9T8fxxbdIAlYzoV2xuwvYDsFJKnOx32
         ik6/Jl3BRlsPclz3qJrv4zaflmMiABptVspxjaELlF4n6cewO/Ds1UsCNY910Jy3edwa
         R2yjgzzOh3RKfHMHe6M4Ovka8oliAB5DseNfwagbABNBamtSxLOy4cUfF7IEAWtyBkaT
         GfNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWwPDMVCG9W+FKSZQGbMBfdKCM1mez5c9vd+9BP+/S67MyoDX9e
	Mn57w1lcbJ9kV3q59epZTWI=
X-Google-Smtp-Source: AK7set9z06Qy6y8h3qDfxbWn6JPLhJWlZehr84P6nmhc95vhwRnCxraP5v0PFtlWHg+EAJwwARD83g==
X-Received: by 2002:ac2:5d72:0:b0:4b5:92f2:96a5 with SMTP id h18-20020ac25d72000000b004b592f296a5mr460857lft.147.1675772770866;
        Tue, 07 Feb 2023 04:26:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:4006:b0:4cf:ff9f:bbfd with SMTP id
 br6-20020a056512400600b004cfff9fbbfdls72240lfb.1.-pod-prod-gmail; Tue, 07 Feb
 2023 04:26:09 -0800 (PST)
X-Received: by 2002:ac2:5448:0:b0:4db:56e:427c with SMTP id d8-20020ac25448000000b004db056e427cmr507212lfn.56.1675772768935;
        Tue, 07 Feb 2023 04:26:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772768; cv=none;
        d=google.com; s=arc-20160816;
        b=Zazr189vXc7cAnlpdYv+wiiTN5LcA6/bYQPoMXi6+FH4sNC5VJtOlQTQFODxDRaTXx
         KEMbfMah4gqod8beBDFqNagT+TbIUcGQf9pt7rIiupWkfAZum3VholvHPAGN7DBqLSGl
         vGrLqw25A4vckBW9GMqhqNkiXGC1+eb7KF5LFJEkqQvUsdJXC3jZMIIGzHx3DNTDMR2W
         UIKvUmty4+CqgEPA+g45Er/5P8b558RozMa1eyewmE8vSa6JkxjVRdr1WxJbVeioS0ye
         riPJyTyq4nFEJyuHdWTvh5XImGCgFsHVPno+kz4x1XBgMjqvM3dBE8agoCWqSUDpknOz
         u7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vOomGGyW9NaR3mPzM36VPSTUijqSTzwW4dkgDXe2aJE=;
        b=q361clMOADzCnVmdj2jaV+BJg7Gtm9q1fViaTSLLMOqNg+NdQv/RSA4GNW+OjEYIfu
         V6KCuCteWugFUgfq/tOu4awlxS7EjLkuVdt6J4oGeQdsBvU3Y9d1L0NlHvF7ciRZtUh+
         8VGggNQ+amptHUu0dwAfmtE94uwT8u9ssfdjWN/ml+1BrsB8itk/pobYt+DI9M8GM9SV
         TU5x/LwMLoc89SKU2kcRJEk1t7QnMuVRGmL6Qhoj63Vwa0toO4CT08MAlWgx5/4jsviZ
         HJQ5gaHeDrttqjYIcCc8MIOiDkDelBXGVyS/qMfGS1xBddGsRAnW1rlRnrnf9MtDJTqo
         ytAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id i8-20020a0565123e0800b004d5e038aba2si609541lfv.7.2023.02.07.04.26.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:08 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RM5ZlMzxvr;
	Tue,  7 Feb 2023 13:26:07 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 13/47] core: riscv: introduce cell-specific fields
Date: Tue,  7 Feb 2023 13:25:09 +0100
Message-Id: <20230207122543.1128638-14-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Add RISC-V cell-specific fields.

Unlike ARM, for example, the PLIC doesn't support hardware injection of
external IRQs. So we need to do it in software, sigh...

Prepare the fields that are needed for software injection. The
irq_bitmap, just like on ARM, denotes physical IRQs that the cell is
allowed to manage.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/cell.h  | 11 +++++++----
 hypervisor/arch/riscv/include/asm/types.h |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index 63ba43ce..9da228d4 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -2,9 +2,11 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -13,12 +15,13 @@
 #ifndef _JAILHOUSE_ASM_CELL_H
 #define _JAILHOUSE_ASM_CELL_H
 
+#include <jailhouse/paging.h>
 #include <jailhouse/types.h>
 
-// this shouldn't be here
-#include <jailhouse/cell-config.h>
-
 struct arch_cell {
+	struct paging_structures mm;
+
+	u32 irq_bitmap[MAX_IRQS / (sizeof(u32) * 8)];
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/riscv/include/asm/types.h b/hypervisor/arch/riscv/include/asm/types.h
index 120859e0..adf58120 100644
--- a/hypervisor/arch/riscv/include/asm/types.h
+++ b/hypervisor/arch/riscv/include/asm/types.h
@@ -11,4 +11,5 @@
  */
 
 #define MAX_CPUS	__riscv_xlen
+#define MAX_IRQS	1024
 #define BITS_PER_LONG	64
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-14-ralf.ramsauer%40oth-regensburg.de.
