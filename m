Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB65JX6KAMGQEVJ52NYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 416295353E9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 May 2022 21:29:02 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id u2-20020ac80502000000b002f94701339esf2583139qtg.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 May 2022 12:29:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653593340; cv=pass;
        d=google.com; s=arc-20160816;
        b=eBtctdnmpfed39PPHkKFn5lmcd6aUyT1iOJ0AxD2zASNmsXwtXSqakOlQQScjB2RzS
         OHhIVSOuZ7nmomT9dvfGZHaCD99LKq3PxIIuukqMzL4wihr8mL2alzzObhX9dgm/Rr9o
         K2v21itvWYUNVSsA2cRJKyE7tAf1MzJhfxh9eZB+1uqnG1JBxmwlNvZ3BrAv3r0TV/CZ
         UFG2VLYNI5WK8b5DH/RXb7dM2G+e6OfQQN0vopM0XeuV+CKX/NGS/x/WR4qtELzGJnzs
         p8hrAz9CLnbEmNt/8bkJL88yfigp5192fpkXolIvWZ5prI7q6xYKNZt+B/9MFql9KfZ/
         sO8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=769eXKdh05tqMDhB/Do3c/05Zb1sNsxJROBFD1FLwDw=;
        b=AbCSYeUZL3w74CmSeRSNnPSobCbUcM1F2bDMgUBht7wZZ65jHoxf9wPI1ll3VcZA3/
         ieSVJyyd6MXTQdKAe0a4ecTm13TzW+vj1vMElP6l4nVRY9C84ywpRA0ghebXU86hoqx/
         Pb7mloRhA/VLIcyNrgBb4TP+3XL6xG1u2a4KcX14UUornjOCzpxZOl26RzyUYT9Vv1U1
         FluWdN1WwCt5bjfD+idU7KEjld+7PPXfuzZitBte7E2G1RDC9yl4lfsfyYI0nHugNuh5
         C6zkD5xutA9ALbQG1bXT/EkwYrilf2fC/jgpPgogBQdWxo2ejUzO/WPbeEf7YHLKkLcR
         awBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y76LnQOP;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=769eXKdh05tqMDhB/Do3c/05Zb1sNsxJROBFD1FLwDw=;
        b=X8kewA340GFn3jemcVmZu9N0nzULOCMocHlpZTPN19PHWqwJdUlu9Q0tELw1vUG4os
         9JuCpi0xs5WNRUKFpqaVwNadqR7D/tBiSEiX/RR7SueyUhOuu43PYCjhwFJhXLxj6ylT
         68ziNoDX8CRWZxPES2MGC8wRLcsHtoB372nwlfQHwsVc7k7PhiKkso6njOdQZqv329M8
         22BKUQY18YJCLAB2OuQ2yQvrykCjtqYgEgsaAPAD6hNoxXKotFjWxmQ4R/7HcH+SfMXB
         eIr+7NZxbVCC1BFNk/7rY0IciJ6NZT35I9Fx9+BRnca5MvJ+n65flj8V+U4SKovCZ4ZY
         PN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=769eXKdh05tqMDhB/Do3c/05Zb1sNsxJROBFD1FLwDw=;
        b=aBlgYdjexkQu4u4tcoGZBsP7D9+FCbew2WIn0059/5iV4DCiucPu7Qy+v0d02Fnh1N
         toMGfBRTOiSOa9aDhUJo4RpikgMwb8fQaM67ewwqdLvwgoSag43P3ujiPQrzIkN26nJE
         WnjU9+cQxkviP9TyOAdO5XniZqN8Lrsj1bCXaRonKno82LGowC1OvZ737ndyz5c05a63
         kPLMn47QU1s8YwZc1pbLwkmkHbocIouqq21JT9g/dI1Vx1j0ak7LONCPOGHgJZURQ+BN
         zwkBBu68HEcDXcUHF38K0D2sJuEIAuUtV3DOE0PPPXNbOfzGEZBolYMunCV5DwYW/lFB
         muoA==
X-Gm-Message-State: AOAM5324IkY7FiXKSrqYcYhX+3KE/n/iJx4E779CKAh2rKcXzOoE+n5t
	wIqIJujVakqzVaSnCi5fk28=
X-Google-Smtp-Source: ABdhPJzWt75yXduTBrRHh3fIgLcbRTO8+bvehuu2JB3cNP/jn8DphBLZ/6vHLdC1RIat/JPGzOkHyw==
X-Received: by 2002:a37:9c55:0:b0:6a3:645f:91ac with SMTP id f82-20020a379c55000000b006a3645f91acmr18238835qke.616.1653593339935;
        Thu, 26 May 2022 12:28:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:d84:b0:699:fa7b:7d86 with SMTP id
 q4-20020a05620a0d8400b00699fa7b7d86ls12882189qkl.4.gmail; Thu, 26 May 2022
 12:28:59 -0700 (PDT)
X-Received: by 2002:a37:f511:0:b0:699:d2af:7ac1 with SMTP id l17-20020a37f511000000b00699d2af7ac1mr25661548qkk.221.1653593339214;
        Thu, 26 May 2022 12:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653593339; cv=none;
        d=google.com; s=arc-20160816;
        b=h8mRB40pGTH5otC3a9ZhZRKL+bf7W9lHf+PCkOeeQ4JiX9kefZ5A9ec7APrvN4UoqT
         qtewIyaGTlpmDggsZKT/nZZQfTrKAEV+BhYHzr/3NexdJLvBVD/4sW/fvztqyK1KR0x1
         NJOR2LmaD90OY9PS5a2CzybAwoGK38IuLeFRhJFYufDjNdUax0sssms/8DKE25HBvPBa
         qN4XNAX3eaSxXJ8wMDi59BOGRx9bTY+Bw7PQcvQkqbH/vJUh+AV73OIM4xpfNoMRK41i
         g8ywSMCsIsicHo9yvM+67d/IoLh7F8vxxvUG6zP3AX7rqwLF2MGYVWb6p7dCCgmBO0wf
         UNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=dmxWRofESItkiHiyXdqYdIKa9Mnx//30nqRyR7qiq30=;
        b=lchtk5TlDLhXd1vpxtZXT0xnfm9EKK2CiAkM51rbx5T6LuL86AgjABxlFtbedZi4N7
         CMYAQ5Z1+9hD/x0JrE9lW8E+wE5nM/PT30JHFOW86+rSCY7VFdERfbcjX2llKOnV4iYT
         FoAl08mRkKBpXInCPdLI0f5Qvgfw3Nr7to0AEI12anz7xQwm+orb96kXX0LSsFeuSWXs
         aIbcePteYVILFtua/2SYKyr4cdn66KfryhjRWFmVcbHKNSY5tUmXva8aAsWp2G0JEuDK
         bKG/J/7eReANBD6UPiUseizGMvdGSgR8e0tUQ5cSkxhi/0yxTkmLZ8m4KHwK1xGrdSwk
         r0Hw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y76LnQOP;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id 1-20020a05620a078100b006a585be8750si150661qka.3.2022.05.26.12.28.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 May 2022 12:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24QJSw4L025598;
	Thu, 26 May 2022 14:28:58 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24QJSw8u035749
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 May 2022 14:28:58 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 26
 May 2022 14:28:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 26 May 2022 14:28:58 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24QJSso4003770;
	Thu, 26 May 2022 14:28:55 -0500
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jan.kiszka@siemens.com>
CC: <jailhouse-dev@googlegroups.com>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH] configs: arm64: k3-am625-sk: fix UART reference comments
Date: Thu, 26 May 2022 12:28:47 -0700
Message-ID: <20220526192847.77340-1-mranostay@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=y76LnQOP;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

Fixed incorrect comments that referenced the UART as connected to MCU.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 configs/arm64/k3-am625-sk-inmate-demo.c | 4 ++--
 configs/arm64/k3-am625-sk-linux-demo.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arm64/k3-am625-sk-inmate-demo.c b/configs/arm64/k3-am625-sk-inmate-demo.c
index 65cf4a7f..49edd62d 100644
--- a/configs/arm64/k3-am625-sk-inmate-demo.c
+++ b/configs/arm64/k3-am625-sk-inmate-demo.c
@@ -2,7 +2,7 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Configuration for demo inmate on K3 based platforms.
- * 1CPU, 64K RAM, 1 serial port(MCU UART 0).
+ * 1CPU, 64K RAM, 1 serial port(MAIN UART 1).
  *
  * Copyright (c) 2019, 2022 Texas Instruments Incorporated - http://www.ti.com/
  *
@@ -48,7 +48,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* MCU UART0 */ {
+		/* MAIN UART1 */ {
 			.phys_start = 0x02810000,
 			.virt_start = 0x02810000,
 			.size = 0x10000,
diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
index 81f4e880..a3385efc 100644
--- a/configs/arm64/k3-am625-sk-linux-demo.c
+++ b/configs/arm64/k3-am625-sk-linux-demo.c
@@ -105,7 +105,7 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* MCU UART0 */ {
+		/* MAIN UART1 */ {
 			.phys_start = 0x02810000,
 			.virt_start = 0x02810000,
 			.size = 0x10000,
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220526192847.77340-1-mranostay%40ti.com.
