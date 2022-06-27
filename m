Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAW242KQMGQEIDHAOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4E955B9B6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id e10-20020a19674a000000b0047f8d95f43csf4703976lfj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335619; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ebv1t3SaEUB9ofziBkkJvhzW9pGbaZxDwUR7GrXqZ8xcf7eokQxQ/lZin6AUQIK6gt
         KP1LjhldueCoyZABzhXWkembLNUWNSSaaq8pvgXv1kpgUyEBponB0dGrYsXNil2VxRBC
         CEnWwF0eeej6xH20xmAMAa6OV8dMmg184szsn/hmYyn7PjFICaDeWobuIamnQkmORNyS
         3wHYQvBUFNsUshBUy+9jhS602bKg1qMT+I5qZJ3P7/gxg0s0OhfzUXhFMRNbKT7Zl91L
         mc/HBP8ALDr+O3ypm43KfopzpnsBJRCNjmcG652CVA2hL0ZGkoC1EoT+tWOrJkKW418E
         HhWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ra0HXvOb/d9bx4pBnHp3b0LFS8bbNobcDLXls8OPY5w=;
        b=fGCkVfLWx9S433V+0b+3ksI38dChed23RyNDJ+etRLMO9ee4gCCbXeWc52WOXrblJv
         aU1/2CdyriL9rkiGcPiHfx5sXRY8levQjon7XVGCbAEz49GJ1zTsafUsihqUFDdqNc/P
         OgJXCSYPEl/nhlp2bFDNgtV6/IFE5Pdq2XnU2b2hxub3hpLIQ83dOyZZiz8rlnn6unfd
         9XQWmMrfzRPTHf26XVzQ7A+Wtsyl8njh3/6lpVIBQajPdK7+00X83S9iehLO58rFLOVj
         b7j5vM0bajRy5lsJkwxR90UEbgdaLX3WGO+vbwW+62pVjY3vPSTT61cJu0qjUyHJBxmN
         pOpA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=KbP9Ek9z;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ra0HXvOb/d9bx4pBnHp3b0LFS8bbNobcDLXls8OPY5w=;
        b=SES9CoETTOM4nmWIc85DP6DBldEC1d32oxr4JrkdPMW67GJpECS2PfqApUhxWHrecw
         OWADREG9Jj6GfxkrBeYk3TZI6++JNeUpKYVtUK5wIlWNbaEbcf/Zj+J3dvHwTsAgLsok
         LsZpORH+La6F78wI1mbnI0EPNvkRTZIb51IQqvLirJqfjN/5FE0xtJkPxI/6bK48V0Nw
         n7WSqxp0VGEOa3WSkqQz/KKWF2BdkJI1cR8aS5+LAo+I3LchmfLNGgPEvj9OauZ1QhnF
         oBlkkIuqilXTICc7gV3WwIgAgKf0UhqlAkeZ3GVQMUNbhzwkRJjgW1CesRkG+8vjGIby
         FopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ra0HXvOb/d9bx4pBnHp3b0LFS8bbNobcDLXls8OPY5w=;
        b=S3fXD3hE+xxCHbHbSAAt0sfPcduL1G4Lq79xPumkMBjSoeYI9ta/Oi3fvbysmrBB3w
         D/U29WNXjKGw/1jyYt+55BvvWxxBnyqxEm+lxjJmzitcMvOMXy6O0aFgE64xmxvLDA8Z
         17fhNH2VG84Q5dXNe/3ZHRK7qcogiuZ6mm6tt77mDUlCptDGUvkVkXJJRDTuLldUe3LN
         Sbo5C+ArBRhmEMkabnMqwzKT1SfcfbEsokSBTUqylS2Rqfx9aQPD5s82d2kkqozWpSTj
         KfSKkb847RS1/JqWkoYoeDqFeAXvvj+1aHMimO1wWz9oWv/Mx1Im5O7wSr6bxXGaOP5n
         c9nQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8xEvJRk1l3A3GU80qEnHf2hPf6+6Yy38Qa+UsTRtfoK5wzUDcI
	865W24LP9cQnfzo33+eVS18=
X-Google-Smtp-Source: AGRyM1vrLbLkZwqemaXm7pPEzZ+zf5cfxEoXU4vmSNv1biuEdQ0ctZ7QSixZvnFH3dlRZGCeDQJrpQ==
X-Received: by 2002:a05:6512:3d0d:b0:47f:b8eb:86ae with SMTP id d13-20020a0565123d0d00b0047fb8eb86aemr8935479lfv.78.1656335618718;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:864e:0:b0:25a:6d5e:adb1 with SMTP id i14-20020a2e864e000000b0025a6d5eadb1ls3436700ljj.2.gmail;
 Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
X-Received: by 2002:a2e:8349:0:b0:254:224a:3c8 with SMTP id l9-20020a2e8349000000b00254224a03c8mr6819838ljh.406.1656335616871;
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335616; cv=none;
        d=google.com; s=arc-20160816;
        b=KXn2+rH7IOqmF/CDyq975jK5mOdYULImK4rH0eU5RjQcBdCuPcSNzrbI2hy5k4GNbn
         ICpmdqBdgxS2LO6eNDgeMdR8P+tyvwjIPlWQiifZf+UQFb1yFa5A5t2p+0n678PM2YO+
         7M9UL6nh4VuGMkEQ+Yt8qYgLkaAaopb72Y22ADmiIz+lomzLC8rrRGyZgmk/LSwbV14k
         vUY6ndg0gb8+1eWuK5JLxACENVZELBU9GdCfncFAbx/qB/f8o/z9lZMh2IYphR4I/BY/
         PQrEfEs09PiBbyz9OgFhJyRKCOhjG191H3YmJyQi/JyCsjyZms2cc1WOzp9y14x4dDjE
         6Ljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yxwCDIcn0Ry+ONfMWaezubtBYzruBI5s8wZUwseWX6k=;
        b=Ap704Yh2cTrTurj4VUEQHu2/13U2MnSdR564blvWPg71jU34nLf30PjCVPIygC6dua
         dRAUeQmtbrLHmuoxzkRGmmxGuI/IBtjxA9+EMYEQXc592aDHpDG3OeEJBDOBW93LFdRY
         rLG7YP2/alj2BV0/6bpRkWYcG6M4ST4qExIzvhvaLmBRayPcPxCXnauoHDH2AZgyirFc
         pw3lSZFFZ9/XiFXZyPeR0QLG4I4vMcArPzAYs260CcYtyf9IOfmhYUkGY39JYqqmdOr4
         EKNLKgNaOyAB0jpcuOq0EID5L28Z+JDDm2VyRDz6LkRphB6UfQYZGbp/reWudekSmdLR
         BiNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=KbP9Ek9z;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id b23-20020a0565120b9700b0047fa023c4f6si442038lfv.7.2022.06.27.06.13.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp801bhmzy6H;
	Mon, 27 Jun 2022 15:13:36 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:35 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 02/20] core: Skip arch_flush_cell_vcpu_caches during setup
Date: Mon, 27 Jun 2022 15:13:11 +0200
Message-ID: <20220627131329.3659-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=KbP9Ek9z;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

There is no need to kick off a vcpu cache flush right after setup. We
just installed the new mapping and didn't use it yet, thus nothing can
be cached.

Actually, this didn't fully trigger a flush on ARM and ARM64 anyway
because those archs didn't kick all CPUs but rather expected them to be
suspended - which they aren't during setup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/control.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index 2214406f..5da95ada 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2016
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -285,9 +285,16 @@ static void cell_exit(struct cell *cell)
  */
 void config_commit(struct cell *cell_added_removed)
 {
-	arch_flush_cell_vcpu_caches(&root_cell);
-	if (cell_added_removed && cell_added_removed != &root_cell)
-		arch_flush_cell_vcpu_caches(cell_added_removed);
+	/*
+	 * We do not need to flush the caches during setup, i.e. when the root
+	 * cell was added, because there was no reconfiguration of the new
+	 * mapping done yet.
+	 */
+	if (cell_added_removed != &root_cell) {
+		arch_flush_cell_vcpu_caches(&root_cell);
+		if (cell_added_removed)
+			arch_flush_cell_vcpu_caches(cell_added_removed);
+	}
 
 	arch_config_commit(cell_added_removed);
 	pci_config_commit(cell_added_removed);
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-3-ralf.ramsauer%40oth-regensburg.de.
