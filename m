Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMHB42KQMGQEW7KDKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3AC55B9EE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id y18-20020adfdf12000000b0021b94ba4c37sf1206562wrl.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336560; cv=pass;
        d=google.com; s=arc-20160816;
        b=coap5R3UzH67jwPAthSS/LdTyfup8QPN/6QS2KozEb+93+ir8toiCPk/7j6NLdfHFz
         eHoLj441S8ckXahItUoOLPAJ+V/6M9mX8cSG/BY2tPpDirQzQ/itikpC/uLzl7lMxxXj
         DYePeLsrxy+v/IibpyTQ9CrVW+IgUR4R5LXIDhlfqRpsozhRcJUF9ptMXuC1MdbwX0jB
         0Y4v9D4jrRCSQVcNINeSKB9CUocAm60r90zu0dCBVbqy2naAnEwVtMD1NHZ65G+/BFug
         WrAI1bunO14FTXU24FjBNl3nGr1bZQFRnAklo3oMgNww1o//9fFl6Dduxm9Px+3VM0Qy
         Esuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/esdfxbMOE0FCEdzCylITZkTqCAjVowDsxQoRMcvFak=;
        b=oZwPddUKBy+BSibe72PVXMJZwkgnRfayr2VAhqQKX/+G5n2BmFY0BjorcXZ+DhYaXo
         591UFmOH9Z5sKkpHbdXM8cgFdLGWmeruSiBYEQnMIecclVght329HF9rpYthsZIaiQ9/
         T7V0x3qXwyCUMJdUycegsmg0iBhdrxE0tPyjvdbQxWauq1oc1u4fjF57TgACWSqUr1GU
         I90BeXo3CHan4mOFQbSKLh1W7ubW0Fwtu7lBEUrLkGD/Ib1wRJs7KejJNtEaAeVqQnra
         zUv9JYIc1hxzLlnoKed5/MemsXP2aamY0XsvQZeqaamfRYqHuQzvdZH0xf72520OGAUa
         UEMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=tbHZqgkH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/esdfxbMOE0FCEdzCylITZkTqCAjVowDsxQoRMcvFak=;
        b=CLigdRWX2tsSXLq+s4Mls94JD8CQBOIKYXA9kyQUP+DQDWE/2V8bRUUZnqF9WOQHFc
         Iv3vgIe6aQCRVfvwREhc/2YpYl1uXXM9DX9QsDE22jTBQs7YY/GqLxOm2kqwLaF3NkY5
         2O9t6cSB7H6Uma0e9xkNaqzRYUs/+6ipZmqYxLraN5wUnak2pfWiXFBZOLNfMELHxah6
         P0LeO6ILPnoYBCzzu5BVjdjRbmLXjS4A7GdLDUKlpeHggKC+FFnsUTTRldBnEc9XaR4P
         bBfpqcv66Xfl9D2nME3B6N66OjQpBni3cYtbp2JTYs2Eax62CJMbkhU/eHVKuLRLHbAg
         Isbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/esdfxbMOE0FCEdzCylITZkTqCAjVowDsxQoRMcvFak=;
        b=yqkRIiLsgTlVZVobwXDknfJrrdm57e9I44jmtIYTXcKwDoPbMaxxf7J5DmrXxgTtCD
         aGEEsR8ZiMS93f4HoOf4khLhE45sWv0E0OKTgACxwW0geXfqdAXR0fXZYZV6nJnlMN8f
         OEwsv72+9H8tzCd0ZsgwaOHjWW7+Cb2cD7WB0wo2wMhKKaLLBLmMR8GokDG/OzzZ9syC
         R6NDmHfOuzycdbfbc/y1hRFjoYiEveQwHMiGFjPdT+592IVGEnFX5aK8xF31sZS7O3/Q
         y6YLUJqZ0CbIgUr9OJQb3lc1swKZyjQdaazHgu3oGmtyDOTZucy6dTBNvJbkF+qE1pWL
         Z/6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/UirCUJmNaLDQY75ILgq1QPgzaDcTR43N+zTShp8KQ7pbJzn4s
	+sfF9eWzi2fcz37BMpLgFis=
X-Google-Smtp-Source: AGRyM1swlER2zdJQAFv4t/bBvy+7ZcPSbZ0gUJ+S3YB+miWp9Vnqk0PgkssyKgmCYDKah01CBOgmqQ==
X-Received: by 2002:a05:6000:cb:b0:21b:921f:9aba with SMTP id q11-20020a05600000cb00b0021b921f9abamr12606886wrx.554.1656336560492;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1da7:b0:3a0:3b20:d119 with SMTP id
 p39-20020a05600c1da700b003a03b20d119ls3226556wms.1.canary-gmail; Mon, 27 Jun
 2022 06:29:19 -0700 (PDT)
X-Received: by 2002:a05:600c:4ca7:b0:3a0:3905:d441 with SMTP id g39-20020a05600c4ca700b003a03905d441mr15313733wmp.159.1656336558955;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336558; cv=none;
        d=google.com; s=arc-20160816;
        b=AfwIqgpklH3+qWuc2VYWmlgwF0z1C+Tghy+0Oym1ZkMIngk0TCUQ38tkHebGtiBNy1
         wqJcfnb5e1/RKJf4KjDhUEkKeqehFFaazH6+XtyAhpBwUfngdahijExSMQy45wkRBkUX
         lG+X795smRY8dGbKvmZ/C9cEWL8eKdqkkDPUmAhIVeQoGlscfEJDWAFVwURmYDKp1gne
         oxmtZD1kegzGKWMCbLhv2i93graqdWdsUccRCvJ9poqMyCMfSyMeBRC3OpTQFn/FOjIT
         b1+eM85qvPPxy7o3NRjyPA+sjkyv3kFbTPLL0MR+xFkDD5UK5VOuzEUnAl/v8FnQ+xLg
         YtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6Qr0F3GHH2oYYJ21F+iKDGw73bTvSTf8j7nyvXnLpDY=;
        b=zS6tFLW0TFxukCq7qgEy12Q1FyQKtluoKIh/SC95fR/ZZkHXfZNYzpdCOZqzVtN099
         LepOxQrFgCt++V5NyN0CeS3uc1uIiaBiot9AaEwdYt9jI4UqjgGcCQxpGqJ3VYWeaJcc
         GsGgCL2CtD3+cZB0YB68I8rF6LQBQEUcMJEENcq9oZKT4k6dHITQyQuCAL63jh75uvMe
         ac3Xz5pdK5/JHCluBzIrXTPgZu41eGPQ/u9AtaSnHysOyL2XTu4vJS9DTye9cLXczFq7
         9iD5GFQuKBVL2vubHDd8GPOR+jPbIqtn6tLo5rfsWCpU7tk2MfxWHcbkJlagHCAh0WGT
         2lsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=tbHZqgkH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id x11-20020adfdccb000000b0021bbdc3209asi246495wrm.1.2022.06.27.06.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV64y5qzy0y;
	Mon, 27 Jun 2022 15:29:18 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:18 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 12/42] core: riscv: introduce cell-specific fields
Date: Mon, 27 Jun 2022 15:28:35 +0200
Message-ID: <20220627132905.4338-13-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=tbHZqgkH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Add RISC-V cell-specific fields.

Unlike ARM, for example, the PLIC doesn't support hardware injection of
external IRQs. So we need to do it in software, sigh...

Prepare the fields that are needed for software injection. The
irq_bitmap, just like on ARM, denotes physical IRQs that the cell is
allowed to manage.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/cell.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index 63ba43ce..58412414 100644
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
@@ -13,12 +15,14 @@
 #ifndef _JAILHOUSE_ASM_CELL_H
 #define _JAILHOUSE_ASM_CELL_H
 
+#include <jailhouse/paging.h>
 #include <jailhouse/types.h>
-
-// this shouldn't be here
-#include <jailhouse/cell-config.h>
+#include <asm/plic.h>
 
 struct arch_cell {
+	struct paging_structures mm;
+
+	u32 irq_bitmap[PLIC_MAX_IRQS / (sizeof(u32) * 8)];
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-13-ralf.ramsauer%40oth-regensburg.de.
