Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBL7B42KQMGQEBKNRY2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9697055B9ED
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id bp15-20020a056512158f00b0047f603e5f92sf4692498lfb.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336560; cv=pass;
        d=google.com; s=arc-20160816;
        b=KE3sG/S12sAPbZAwlXhzxdblIf+7Td+411j2ZzpX6DXmSG6LjsurNfvbJCTI54s7n/
         RsnmacGHwAopLMBZ5w3HPtw4paB8APUG5DH4xYN8mBXKAiD/Xgoss+pKSsD4bGR/DqNs
         j2Y2lwPKudeGts56Mt2orNjK9yTL1GBfD40Yh+2f8qVvxUjjiRElDKuco5UHGPnZtH5A
         +k+q2tv3zshekRNKjrncw+aWZpQR+i0oODTq//Zpq909jIrJnVnxiQI+sA5MC+fUGQaJ
         FUq+T5Xh7iqnROd+agYgkyGg9lSmjBU4+KDyA9l2Wxr5UmkfhldTsWXoWAsbfaXuyZzu
         wExA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=f0l8PTzEeG32g3RrkClWcia9uJKFEANr8CSLWTtpkNI=;
        b=kz2BvE3DkV+MwwguUVvJPLCKaEpQqFQC/W3+3B33xZJErsj+6TZ/g9gruZyVQfqeUy
         mpp6qy/6bN+3Sg7zqQgC13GQjKNVKuXwnImi1BiuCXAy5XgCyG/lSGrIM6LGC90aXaf0
         CcfmoDZ5Y84aAErWd1CMT7+v1HU938YlKyUsCgWm6MfV7z2Vtr9sB4qoEUJYbnxAzKhZ
         wrfV2luPYaaHGem5mHktmF8rdDmNmLcdE/qHpGHYRQrrTbF4NELJSxn4NTx/R63G8IZm
         phf7AonalJ/xq2vvgFbbPALlWcxyHU1P9yeopJicQBUJlb3iZUwg6DeOxxECFs4hCuuF
         sCHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=a5SGzk+e;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f0l8PTzEeG32g3RrkClWcia9uJKFEANr8CSLWTtpkNI=;
        b=QIm3jPWndfZpehiHlPZi3VxaFwzk3cyOWkvxQxzRIwmU3/NUBXrihH+NGVnbjE4mpa
         ZJ7p5xr/p09Wy9oifUWPHDit6szrrDx1XTYT1e9OA5WISpA7Vk+Rn+5sKNd/kbriY88M
         75IaJTwhkJ4z+dEHz857l51fY3VpWTqNKjS7amNiO2WMrgXcD0URiwkePeGeWCeLz3zx
         B/tMrYS5jGEmmrNqdXxykkd1CzhxG0q7QIPD0ga+ZUyFpPpekiYH66lqielpNm/cPfhj
         ocKShuHCmvnBwHfRbA1fEbD0h4W6qgsfQ3hm/IcqKeEppr1zxSMOlkZzkzCYrHicphVf
         nJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f0l8PTzEeG32g3RrkClWcia9uJKFEANr8CSLWTtpkNI=;
        b=rZIhvHLU5ZdmC6tPjfBNFiBY93mt6YjhouEfBkCO70P5UfIC4PcMnwhYjA3C7kQrKQ
         xRYIhwDDoq2AXGkpFQ5x+/MBNRTxZ7AotYpaESTareYT2X2qsy4a8f22SaG89WXrl3SY
         nNRqZDfCoqRyOBnp4aWVVr2YcM3S/7x1NAGGrJyt/sTqyhy48IWW1Rdy5Ka1K8Mc7XZ7
         i9gLBG8+4tAN95HUvTzr9z/akLzBIL8kwn2FBr0W1XCFtLGxvbtIVg3WEdv1Wwr8HbAa
         fWt4FamJBczHkxYlnK/sfsnRt6XUdtalOTqMY5u8FMK1fQ9V53XPdbo6MrknNxsVFiGV
         yeqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/utVgNlW0TIaXWMgQ7/FB92hONVbsGgeIWMJ3LAnx1UQ4D86NS
	+u6vqMEiDNJmWj5RfDoyXCI=
X-Google-Smtp-Source: AGRyM1uxLKzPTgKDpDhahA/ocNB79B5tNwzkvnnXqJXx7KwoYAa99mv43q80HIdDU0JtSkJc1LWnTA==
X-Received: by 2002:a05:6512:3491:b0:47f:6c96:c7d0 with SMTP id v17-20020a056512349100b0047f6c96c7d0mr8190432lfr.579.1656336560031;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:97:b0:25b:be22:345d with SMTP id
 23-20020a05651c009700b0025bbe22345dls460903ljq.8.gmail; Mon, 27 Jun 2022
 06:29:18 -0700 (PDT)
X-Received: by 2002:a2e:860e:0:b0:25a:6dbe:abb5 with SMTP id a14-20020a2e860e000000b0025a6dbeabb5mr6905405lji.474.1656336558447;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336558; cv=none;
        d=google.com; s=arc-20160816;
        b=aoRIadClwpIqNhcBfKAPCUGvAxviafn/rQ1Zujw2IzOD/o4J6LJ8lqG2SDNZM7yLgB
         wIdvclykYBcRPBAwIW1a+mn5bKnWU2z8hV3yoGfCXSEs4hn5veL6/gKLaS8CUO04DWT+
         Hk7oVVp7RzZom7WymleUiS1jrO0W3DIWKko0njA5lHoL77nAWiB3UfNxi7z2HOLTo0v0
         h+MVm47fkImWbJbrSRn91es0vHAKliS5r2F/owyLzk03635D/UulCdexBc1oJvdNKxgl
         tq/4dCZpp+rZf/xnXrJwkAXPFPrcARwU0r6ml/SdYWDTaD1V6/+iO3h6gmr0Fi3H5t/z
         P6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nYwodWu/n5bFSVGRWDYn/01U+z3FAMoo6fnH8MFCaCg=;
        b=v4kyFXP0fOXVaPttiB9BDoLNYPQBGlkiXZn3K+otU7RXPa3JkfuclZdeXjTjHj4e0b
         dk52w9IyjwPiKmAJUhqR4BVoUa97qFxqneJojfQiNyDhtjULqN3xu219vmpht3BuAy96
         18jVP+zEc29xX4IbqyeWLGJFoW0z0n9SQ380RuBXg2TdP8y1MeFEAZrfkYEWyiVh4aEi
         5HAM8dgyl3bn81SWE70Ldp+heewLcwDOgtqHtYSlAumSeQhVK2ULHXjmvM8LyPfQBLEH
         8LReD8KEn/+BZSYc6PYquTfcN6bGO+aOmnk06njgSsFP8HUzwMeZw1rHrL6dQPqosW8I
         suQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=a5SGzk+e;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id cf26-20020a056512281a00b0047fb02e889fsi442380lfb.2.2022.06.27.06.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV56Pnxzxpy;
	Mon, 27 Jun 2022 15:29:17 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:17 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 07/42] core: riscv: Define percpu fields
Date: Mon, 27 Jun 2022 15:28:30 +0200
Message-ID: <20220627132905.4338-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=a5SGzk+e;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Nothing special, but two important things: the ipi_cause and the hsm
field.

There's only one single IPI, and we can't differentiate between
different IPI causes. That makes things hard: if an IPI arrives at a
HART, we don't know if it is a management IPI or if the IPI is for our
guest. Hence, store the cause of the ipi for a CPU in the public per CPU
fields.

Simple protocol:
- The sender must wait until ipi_cause is IPI_CAUSE_NONE.
- The sender must set the cause before sending the IPI.
- The receiver must clear the cause before after finishing the IPI
  handling

HSM stands for "HART State Management". Refer to
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#hart-state-management-extension-eid-0x48534d-hsm

We will understand and support HSM for CPU On/Offlining.

For Onlining CPU, we need some data, which is stored in the hsm field.
Besides that, the state of the current hart is stored in hart_state.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/percpu.h | 37 ++++++++++++++++++----
 hypervisor/arch/riscv/include/asm/plic.h   | 18 +++++++++++
 2 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 hypervisor/arch/riscv/include/asm/plic.h

diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
index fce6c052..4eda15b6 100644
--- a/hypervisor/arch/riscv/include/asm/percpu.h
+++ b/hypervisor/arch/riscv/include/asm/percpu.h
@@ -2,22 +2,47 @@
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
  */
 
-// this shouldn't be here
+#include <asm/plic.h>
 #include <asm/processor.h>
+#include <asm/spinlock.h>
 
-#define STACK_SIZE			PAGE_SIZE
+#define STACK_SIZE	(PAGE_SIZE << 2)
+
+enum sbi_hart_state {
+	STARTED		= 0,
+	STOPPED		= 1,
+	START_PENDING	= 2,
+	STOP_PENDING	= 3,
+	SUSPENDED	= 4,
+	SUSPEND_PENDING = 5,
+	RESUME_PENDING	= 6,
+};
 
 #define ARCH_PUBLIC_PERCPU_FIELDS					\
+	unsigned long phys_id;						\
+	enum {								\
+		IPI_CAUSE_NONE,						\
+		IPI_CAUSE_GUEST,					\
+		IPI_CAUSE_MGMT,						\
+	} ipi_cause;							\
 	spinlock_t control_lock;					\
-	;
+	struct {							\
+		enum sbi_hart_state state;				\
+		unsigned long start_addr;				\
+		unsigned long opaque;					\
+	} hsm;								\
+	bool wait_for_power_on; 					\
+	bool reset;							\
+	bool park;
 
-#define ARCH_PERCPU_FIELDS						\
-	;
+#define ARCH_PERCPU_FIELDS
diff --git a/hypervisor/arch/riscv/include/asm/plic.h b/hypervisor/arch/riscv/include/asm/plic.h
new file mode 100644
index 00000000..04cdfa63
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/plic.h
@@ -0,0 +1,18 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _PLIC_H
+#define _PLIC_H
+
+#define PLIC_MAX_IRQS	1024
+
+#endif /* _PLIC_H */
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-8-ralf.ramsauer%40oth-regensburg.de.
