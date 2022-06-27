Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMXB42KQMGQEMEWMDAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA4455B9FE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id m17-20020a05600c3b1100b003a04a2f4936sf1579854wms.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336563; cv=pass;
        d=google.com; s=arc-20160816;
        b=fDlx+i6GPmX2YBsTR9rqHDrRJjsNNh6BMEmjGa0SMDkERLG/0bX1kTrtnYtX2G5I59
         vAwigK6BmibmJRCS0YEm/TYNSHRymnzrCr+FLboCYC7s5Zosd8cU/s2sw/Nz+gzAo4PZ
         eR+dI6N38vbRh2ErkGb9lkPg7a4j9X+H5j11JTlrlN2cEfHvlvVhNifgXmJa9HyIkH4d
         kNzRM9oi3jNefo8VSt+2iTu8/oQeM3rmOA7q/FQjk+XeWG5exbSrZ+yYiinjrgY4fTgT
         8fRtJvJNgakyZn++YyLBL8ac/tK6px+HueXp+oFOTnZ0LkoG9aqKtFYtf3cGS+EztzsN
         +J2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=MPGLHXI7QVHW7nrfKe6HCDA7204yS1UWqLY61dyCTDc=;
        b=OYqaDSXsIvXnOQV14CQ60NK35SxqR85RRmFpopa10iZ9kaRu9g3OcYmsTou89GfQfG
         WzP9KsjsRv7VY0YqUKcIPESJ+Sg7r8U1ei3WDlL/myY9bPDQpDQx+IxO0AdlDgYvW/T9
         OAsTaQwEVtsUUkWaYQGVJPysNEDy8lJk998zyPIcAt5pAjKHBWDlSyJIHZuYUhQ8lNLH
         GN5zaGhgcVAxqbW3ejuIgOcYsvWgsJ2qWnjYXgTLcV8IFRsaYbed5JA48+eTTWB3/jQH
         f01RzLSba84ZwRoEcEctmrJZ5ust7DLD3WnxySIMgEzkrQcCJirduFQ73198tVC7uJ/c
         beOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=nKBcAgVL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MPGLHXI7QVHW7nrfKe6HCDA7204yS1UWqLY61dyCTDc=;
        b=FsN8Uf4qdu2ESpdtDvthhSz+DDygZQZKwt4eO220VVw1O1LyR5RDKOJ/Vq53LYw4BM
         zvOX6g9I/ZhZOPQqBvGrzoFtMv+c3RXa/ukcvs1ZsHDq0G8bEnQZhIjYlx00vXxwt5do
         SohmbIEphjg0xDYP2CdwdYAHSkaUsj/aJgLrmW0s1Bxp1qpsj0xMibRiooRMsuBwlzVO
         7l9RU4zlKkWw/3fhC/JwivTcAZmXbUDhu1Z8zXb1p96FYo7EGKbuDZ14+Oq1kW4RWANd
         ISNPXnmJh5X4GUbAqWOGLXyHC4WUvtH6lavGZVGb3BsiFLR8QOPan4luAu9rCXVYbNIm
         qprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MPGLHXI7QVHW7nrfKe6HCDA7204yS1UWqLY61dyCTDc=;
        b=DBPBgSOeJWRjBirb5dRnR+cRfD+4+MpT2NOsfCI9MFOV7DhpS5azw35w5s33YNqoy5
         5yPoR9EQq16ZRcaCYnARBrUrYY7iQB1odqV89E9H/CEfUYskgy1lCbjN/fGxPnGZKe8t
         ayem0bBv3rYSjIYjVTqjH8QqRBrMtYyY7kTSoMua2qODYE9O5bo0qQk80y9iVcJv8TBR
         b+iLVim4sVpeUEJjPYRdg8Gb7mLstqEzxuWQAVZcdMOE2Mcx68bcHOm+nDe0TW0G6QKQ
         fu6v/7QjRXmyBBpI03STXZfWGzR8htmiaieBVaH7PY8+U8RCLnZ+4mSsCoOuUnrWrUiu
         CVjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/1CcsNwI2l3rP5dzQUa/briFG3oD6m4+hN4WDKDv9tAH8zrtO9
	Gv0/Ym/dbkELsOku6mfGx0Q=
X-Google-Smtp-Source: AGRyM1uBD0djTxKctGVznqFa1vC07qeMdcx0/UhFj7y2TJQtTNwcLehKvXDzLqdsejIafDofQ6ivVQ==
X-Received: by 2002:a5d:48cf:0:b0:210:1229:2e7 with SMTP id p15-20020a5d48cf000000b00210122902e7mr12374723wrs.567.1656336563251;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:350f:b0:397:475d:b954 with SMTP id
 h15-20020a05600c350f00b00397475db954ls3229382wmq.0.canary-gmail; Mon, 27 Jun
 2022 06:29:21 -0700 (PDT)
X-Received: by 2002:a1c:f213:0:b0:39b:ad32:5e51 with SMTP id s19-20020a1cf213000000b0039bad325e51mr15467266wmc.72.1656336561839;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336561; cv=none;
        d=google.com; s=arc-20160816;
        b=s7TvRpq28cFjFGk8pnzBEzvERzAegYLCV0vL7pa5cEr273VlxWkzjwzS0+CJ8W+qnC
         KxvYV2T3dXbS8SKtlK/kjLi7ifnS6es8qG+AXGJZb+b+y3ahQOZl3vWsZzKOVh3GA7pC
         S6v314wRWqI7SRk/CAsgnOiOo53JURe30R8rwyhB4z9O1zxQTsMHaPdKh1pK0lqyUPwh
         RcIxSePSGc/P/FSilfEkfOnyS9wXkaOr8PXWghlza+ruxznhnv2gqcBJDH4w8OVgRRz2
         0iPMfRSTF8HmsKwgxUSK7E7fenJyVI6pBDdqu/5FPUkziv3xzEwXd2/2ULIE7W+RFRfE
         P4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QFCdIlUjQNdiofl4x1E6/W7AHsV88GtMwCn0aXEySbc=;
        b=OYL/W5gqXLXrbzW2FrgCSQ4XK2NA16WVqC61XIe7cQLitQ9QX9uhDvHMU3yf2VaJLr
         XdqQ4tAYrTN7obbBTyF1p77saP/l4KlgRnH6Pe9cf8uXHaM61128HVL88mii5AR5SqAC
         wpvcUoXwXPBEd1ohV72LFPCMcXeEJtb2riRBk08sDcn+XFDQn+PYhsfkvRdVH6qataCp
         nhcaG89j89vO3hAMovYmrehUoOEhTY8iaUIa3tnh6NY/nKkX2DIdO+KXknI9g1G9g3Yh
         Mt0P32Z4h8BD7DQwiR6k5rStqh4yUtFEe1Vl0NNNGEFECTvxpjKB4gXsJYjfXa6QV0SA
         W4Vg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=nKBcAgVL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id f17-20020a5d58f1000000b002102a7531cesi342606wrd.2.2022.06.27.06.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV947JHzy0y;
	Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:21 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 27/42] arm-common: export for_each_irqchip-macro
Date: Mon, 27 Jun 2022 15:28:50 +0200
Message-ID: <20220627132905.4338-28-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=nKBcAgVL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

We need this macro on RISC-V.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/arm-common/irqchip.c   | 5 -----
 hypervisor/include/jailhouse/control.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 59e5dd53..c93117d1 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -24,11 +24,6 @@
 #include <asm/irqchip.h>
 #include <asm/smccc.h>
 
-#define for_each_irqchip(chip, config, counter)				\
-	for ((chip) = jailhouse_cell_irqchips(config), (counter) = 0;	\
-	     (counter) < (config)->num_irqchips;			\
-	     (chip)++, (counter)++)
-
 spinlock_t dist_lock;
 
 void *gicd_base;
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 2e2446f0..ddb9d039 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -106,6 +106,11 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
 	     (counter) < (config)->num_memory_regions;			\
 	     (mem)++, (counter)++)
 
+#define for_each_irqchip(chip, config, counter)				\
+	for ((chip) = jailhouse_cell_irqchips(config), (counter) = 0;	\
+	     (counter) < (config)->num_irqchips;			\
+	     (chip)++, (counter)++)
+
 /**
  * Check if the CPU is assigned to the specified cell.
  * @param cell		Cell the CPU may belong to.
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-28-ralf.ramsauer%40oth-regensburg.de.
