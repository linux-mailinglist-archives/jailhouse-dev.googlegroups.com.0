Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBXGX5XUAKGQE6ZFYUHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE85D1D4
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:36:13 +0200 (CEST)
Received: by mail-pf1-x438.google.com with SMTP id x18sf10960321pfj.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:36:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562078172; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jh9MDlWK9/faQmqaMbAkuBCjcoq4BXQNb6bZ+4v03nsoQwaR/Y5Qf0yZHIttaBVkhC
         CeMBCplOefBMocXZujclQ62tBeq6YvkqltihRpHGJsaJnWzZJHnHEgijJ4q/DnOfHeD4
         CMharzEQ8becTDUuyhWxHMXYO/BfwXTdIOSWzj4mT41WdCx4yfetZNRakQ+tnEDuYLM8
         b6mwnizkSovTT16h9bR3MCwvugLFGQ/TDxycr3sI+ciLrrGqWa6E2oqnjXRWvH/zQ3PX
         Xu4lGXcyPgt9wZhiXbtE7OvAkUjMiwB0mr9tQejBQKw+N1RLdUKMZmuakIyYxxjNUsTu
         kKTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2FDIt3W+XpqU3YLXIBqY2LxAjW0am5/oiAU+zYCQqZE=;
        b=1BeGxme6+ZdwWoy5KvcLN7nBZVK32Eq7Dirhcjf28wjr9fvArDcroO9cjkX1/KBIRn
         2zYd6UR8k094dXM9BeqYB4CLNEJeBVcseRx6OBQnKCkxqSUm/5w9cRCbMeqK79irauUZ
         h0rvvDvZFFFc/459cKAeOajp6bhul0kgNMsZxV/6BAiycU01mCXIF8g+vjTNG9sD1oM8
         oWFIEOGOh5hLx9ZCZSUuRtdU7Yw7s5Hn6aRlA+KTNQJ2ck5qOlSHGI/7Jz2b6F6QtZVj
         7N8kvsqemVxWdsBA5Q/7e2z9LqQ0EAEKQf/qymNWnre2yUPOijf9Mv3CzkU50kXjA3n1
         RCcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pZk+Vwih;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2FDIt3W+XpqU3YLXIBqY2LxAjW0am5/oiAU+zYCQqZE=;
        b=pnHDrPQutxylYWEI+gTNxMIMMYPCZpHTORCUc7dK8iJFt20hilDsDSb5R5GUck8+ZQ
         S2IfBXg/ciOs2cbhuoRKMAsY3Pda00xSSQ3cuKSSLm+jbtgiom111ZtM1t3nlHbRKh4p
         pS020swiEik+naJjADFqTloi4PXOXWMN1UvnjLAk30P+5kHaxnMPC+E2xUx2NzM7WaEg
         w8Ini4Gm408cF0HSRJfzpaVXlkmzC4GDWfbnUN6dyf7sHmtQ0QmxB7jgGn6Y6EIyygNl
         IEJsRkJws3loWXyeBdzkWPSnJ74uV+QWefIJXuhqEk3/4BHvD0ZcC+Yd/8MvvrNMhJLI
         qf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2FDIt3W+XpqU3YLXIBqY2LxAjW0am5/oiAU+zYCQqZE=;
        b=Jm3cyqOTLuLgO/BGMTSVMo3922zYKEmf9Z4c5neM3+wRr+ltEsghZxrIEXbISDn0iU
         DDoLQBsnzN2yt2R2XXzncq199ZgNbeCvd5GxGzEHCqH9k+jkSTcZqe7iQcfQPlkL7Ng9
         gCkOZGJ89+TbEYTiu/e9hmHoiODQeP02Jf8LKwKQGo110D9s4825R76IUjNf8L7xupE9
         ThPTqTyLxArxu/4Xax9L1g6Zn7wWT/pbf9iDfYUyHqlfGGa2m7Oia4QvzuzJoJkp3/zf
         NtvypzP+TbayGskPjOcYLQZiGYVWZhnnBBsxGBJGJBuS0HEGvj+Ov9zi9WgWg0s/Db58
         iFmQ==
X-Gm-Message-State: APjAAAVtGmfj4yjclbJcJWb7Vgb/zADzIJk1kOm+9SHjUzIV0wQsBzTp
	am7HGq/uRT2vh6bGwKHtdWA=
X-Google-Smtp-Source: APXvYqyX+xB8MyIw4DkT5X/2b5/TabuavVzVtY9B9jo9R6Wpg9+wckt24Te3iQuxKTQ67qxMCfVBoA==
X-Received: by 2002:a63:f510:: with SMTP id w16mr31703487pgh.0.1562078172332;
        Tue, 02 Jul 2019 07:36:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:1021:: with SMTP id b30ls4343599pla.1.gmail; Tue, 02
 Jul 2019 07:36:12 -0700 (PDT)
X-Received: by 2002:a17:902:760a:: with SMTP id k10mr32288115pll.83.1562078172007;
        Tue, 02 Jul 2019 07:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078172; cv=none;
        d=google.com; s=arc-20160816;
        b=vrsNTEi/CkkI0tcHQmClXsCEXeu5kWXGDXSIANdHCrXUBllhF3ILFnlPqH/FZ9rSsJ
         oLpeUP/kBSPUfuiCVVXKgOpTgvZB5yCmUpMl8cLrEdmt/uu8r/TLxwFxXoEk+40+flz8
         a3+t6anR6UcOGXujnk3vpl3N+T68YxVa1wenEXX2TQGcCgd84HLuFHJetp7vCbFyc+qG
         CUB/JfsWS/Ewp6Y6f7zbAW4Apuj5mPoqtkX6P5f3RFyZrknuCUFbC6fl2RyBD+8Vu4Sw
         ySE30hU/fbH9MliKrfbJCfzYobgoP9oo8+nrz2+JPKIMMNJY3LjnFAodmhloG2pKouJN
         XloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AAI3kWuM8kg7Q/EAr1adNOF2UZkfQvU8KZYkyYqT9cw=;
        b=XC56zIJz4DnGs++7/FCQs9ppaSf3m4ktkvsn5K6ANZS1X45CKmQvvK8ok8t8m0PG5z
         IOqiLvHcYiVlDp8OQOr4e4p09IDtfUzzroIxcnXdBSWAZIFbUk2q+13yiFcSypIETSTo
         nkQwjRJ5ifv9JaVNfj8bOQcqI1KoJ3V9O22IAGUcB/OdFxEE3hF//sb3yJ0XCEHeogyP
         YWdxnmIRsVQLkf+1tlxcaH2N/JlIlOJY4j2w8Wlv6z11vGridslWCzY3yHVm3i+CI5Q2
         hgvK3DfxaOAAwIG+BLFpAfVWeI/GlFuVjdKJehFMbZwW3U8Y/y/wqb+EreZeTDtYdqIp
         OKIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pZk+Vwih;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id g189si372812pgc.3.2019.07.02.07.36.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62EaBaa084339;
	Tue, 2 Jul 2019 09:36:11 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62EaBLE130338
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 09:36:11 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 09:36:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 09:36:10 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62EZtHb022917;
	Tue, 2 Jul 2019 09:36:08 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH 5/6] core: Move unit initialization after memory initialization
Date: Tue, 2 Jul 2019 20:06:06 +0530
Message-ID: <20190702143607.16525-6-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190702143607.16525-1-p-yadav1@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=pZk+Vwih;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

The SMMU driver needs access to guest paging structures, so they need to
be initialized before we can initialize the driver.
---
 hypervisor/setup.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index e3b1b3c8..c4032f5b 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -174,13 +174,6 @@ static void init_late(void)
 		return;
 	}
 
-	for_each_unit(unit) {
-		printk("Initializing unit: %s\n", unit->name);
-		error = unit->init();
-		if (error)
-			return;
-	}
-
 	for_each_mem_region(mem, root_cell.config, n) {
 		if (JAILHOUSE_MEMORY_IS_SUBPAGE(mem))
 			error = mmio_subpage_register(&root_cell, mem);
@@ -190,6 +183,13 @@ static void init_late(void)
 			return;
 	}
 
+	for_each_unit(unit) {
+		printk("Initializing unit: %s\n", unit->name);
+		error = unit->init();
+		if (error)
+			return;
+	}
+
 	config_commit(&root_cell);
 
 	paging_dump_stats("after late setup");
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190702143607.16525-6-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
