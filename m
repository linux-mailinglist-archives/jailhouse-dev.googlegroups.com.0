Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBUHP7XWAKGQEVJ2RGEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x439.google.com (mail-pf1-x439.google.com [IPv6:2607:f8b0:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345AD305B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 20:26:26 +0200 (CEST)
Received: by mail-pf1-x439.google.com with SMTP id z13sf5371019pfr.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 11:26:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570731984; cv=pass;
        d=google.com; s=arc-20160816;
        b=wlhtzohm68mgwAdKWU/kRepxZSWX8Cj0xBKRmCfBtzeFNf5P4sZ86SSa1khTXjkCj/
         32tu/Yay0o6X2H1XGKKfFAvGlQCtmlmnS9Uc+jv3zLhh3A9nd6m7OeYZdxDzOjG6b13N
         d03YGmIDR9agTM002eeOX1lTZUE9Qryh2MC5zrQ5oN7Lzt9wnMIc4HTIiL/KMqd9I9Xl
         U9oiE0g7p7D5JA3ePq57AbnXOoOPdqRYvueQiG235JKjNyLDJTvpUr/i5GfFrPFTliyj
         8EG1LLNvV0FH7wDXn7l+MMtQB0vhSvYYSh0YOoi/QCG+BFTE2EOuVJ7pl0LXn1ncw23j
         EvxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y2WbHdXjjEvKoOZHflCjmQbyhhDdyoKcT0ceOe+5gHc=;
        b=U6utqx5inyDSjvZdNBTMhFm5u2v0i58hR611G6xigXXYri/TCVAPES30m3eTBECSxv
         AkDL/PkHbLaaEP0V6KB7i6PXqgAMkVl58ycihybS/GgJebejNtZJnqLuP2WDuDnazrZ0
         wRmFTVLwahRVRS8D9BrlZV2mlP9Ua8/b0GrU18rU+8l06x6FNgQTlrZMmSeEI+5so5c+
         qr+yRb+dmaEyakiAIUW1ULhATywQJEOT51hnMAlslFNWzZ3TveYbaIJT/jlNyebMQHxJ
         j0jq6E/rvwQCPh+LSapK48hzqKqypeQzGMKxOqEOnFyinNyFky1qh9wBcY0k8C54s+JK
         zm1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d4GgNOTr;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Y2WbHdXjjEvKoOZHflCjmQbyhhDdyoKcT0ceOe+5gHc=;
        b=mGa0FiBcDTSR/aE4uudKtZs9evc4TQv4CN6DrL70HntNEw8W5Jek2vHLu3/9c/N8GG
         sppG0jjiuy+BgVHphNFQ2vsjYSwYmkgzVaeONznG9yZdQqncDEj9DgBrZMH24B/O2au0
         hkiqrE+aCxBVkvQsJqM+NeOVZNdQ0DGgm1EcMNeKUn2xqipHnaaMlBX6HaASTNd0iHzZ
         Yn27rMFjtxgF3oEGtkS+gE/p4FnnTmiH9pL0PNrlWznbfQOE3h3HrKDjilFfXIPKJ+U1
         /VUr0S4r7Kj12IpN8zGpVmZ+PNMw0J/JQvyoDjeYue0KM0Nadz6WXyQpTMZHxLn37IaD
         JbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y2WbHdXjjEvKoOZHflCjmQbyhhDdyoKcT0ceOe+5gHc=;
        b=UkzbBhAUO7F9QP0McDq3mNY/wPpNim/okQ0iRSzg3KVL5rrMRUWVj0hagDJsnepvw0
         2h0RR8jBcKxjsrngUNq+AX+zAKJDteBrYX8HUCOyzLpTIkE7fWlkg4ebS/pz5HgH78mV
         G+kcDkQBJVFVEviS/25v2XFcz8deqCeMCOINHzZlWpocfzSu5wPLlznVZz26+ITTOtxS
         AgFPCxoWW2yn5sm+Sbw8B8WT6wdd/SAI467NOuvrobTD1Zfs9CJmS9YyGBya5AmXKQwB
         sgEERg3vjMI5QrXQwU2aAgoGmE38J7SWuY9PG8f3wB57FNCvEkRUldNsGW4P8q7IKrpN
         wjUQ==
X-Gm-Message-State: APjAAAXfzGaA3T+ugDW59SSCo3YILcDpJUU0Lk4TLAke3prqwmKZidl0
	L/Y+xFUmtPLCvMtxwIZEYxQ=
X-Google-Smtp-Source: APXvYqzWrALrN1x6NISA0et9RmBxNRQs6phVW1sWIK/r5x+0GdZqX7e26mni8y5ze2ZRojgDk65qpQ==
X-Received: by 2002:a17:90a:a605:: with SMTP id c5mr13357128pjq.28.1570731984253;
        Thu, 10 Oct 2019 11:26:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:e517:: with SMTP id n23ls1411843pff.5.gmail; Thu, 10 Oct
 2019 11:26:23 -0700 (PDT)
X-Received: by 2002:a63:155e:: with SMTP id 30mr12993018pgv.204.1570731983514;
        Thu, 10 Oct 2019 11:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570731983; cv=none;
        d=google.com; s=arc-20160816;
        b=rJYucCxUzrniOxGnGTjAdi6GuDHo2pqEO+yPc4UrJP7sYr07pu+uR38/YKMjbdyw9/
         hAI9NpNvApFZDrJfcNKGjvhriWbToG8kC6OvYjAcc61ff2TaGKpbl5CK8C0if51e1gyA
         2bBy1ux2T0SJFB21y1OQ8MFkmo/8R0gPv1RDjxYGpJGH1Vo2ffGO6I+ikEskYLvm6up8
         2t40vT83IW/dasYKVbiYGUwizDjzGhENBLySI6k+HmnYEptzx/onB/+uZrQQXepvVTrv
         kgj3s8QXVeaOMcGtibVbWGkvLUN2qagbbgCiFpV8yXxOW3yxSj9ve6sJ1p+hbbWoXEQA
         b4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XL+rNob++aGGDxa+Ssj9TSvMe//KzeS0BqoqoCkMDEc=;
        b=mBvPOI7qIQPzhgo4FLsNE0SVsKr3Hu8Ucn1vzsxrOebbGvlhKJ/g1OkmqrB3t949SP
         gtJ3KEwy3antDqyc8P69tz6JKxy6A5pnKbbHatSZF10FrBhMCdh2ZTFAtLsZAgenuWws
         51wYjR4RH9zRCUPCXspr/364+dLLaJQ9FQdEhS/4VyuNB992jK1sN2H1SQqyQd0eUxaF
         O4S/rjwlkDxmg13jOoP7Aoa+H9DftrTd/CsrSHqprGuR/54L6Wfk1A5zUlylceOfljTU
         JOtituU16kDwPC4UJ5iiKSZP335zIvH/GrDxQDz+N9CpbxFA4vzp/J9TYLyDNFbVzXHi
         TWRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d4GgNOTr;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id p9si374548pjo.0.2019.10.10.11.26.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 11:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQMsZ009541;
	Thu, 10 Oct 2019 13:26:22 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AIQM7V120147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Oct 2019 13:26:22 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 13:26:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 13:26:22 -0500
Received: from uda0794637.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQLl1008251;
	Thu, 10 Oct 2019 13:26:22 -0500
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH 1/4] core: make suspend_cpu() public
Date: Thu, 10 Oct 2019 14:20:47 -0400
Message-ID: <1570731650-5335-2-git-send-email-vitalya@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570731650-5335-1-git-send-email-vitalya@ti.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=d4GgNOTr;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

This is preparation to introduce the am57xx SOC support, which requires
to call the suspend_cpu() directly.

Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
---
 hypervisor/control.c                   |  2 +-
 hypervisor/include/jailhouse/control.h | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index ac8e18f..e099c7e 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -93,7 +93,7 @@ bool cpu_id_valid(unsigned long cpu_id)
  * @see arch_reset_cpu
  * @see arch_park_cpu
  */
-static void suspend_cpu(unsigned int cpu_id)
+void suspend_cpu(unsigned int cpu_id)
 {
 	struct public_per_cpu *target_data = public_per_cpu(cpu_id);
 	bool target_suspended;
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 72518f6..238798b 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -273,4 +273,25 @@ void __attribute__((noreturn)) arch_panic_stop(void);
  */
 void arch_panic_park(void);
 
+/**
+ * Suspend a remote CPU.
+ * @param cpu_id	ID of the target CPU.
+ *
+ * Suspension means that the target CPU is no longer executing cell code or
+ * arbitrary hypervisor code. It may actively busy-wait in the hypervisor
+ * context, so the suspension time should be kept short.
+ *
+ * The function waits for the target CPU to enter suspended state.
+ *
+ * This service can be used to synchronize with other CPUs before performing
+ * management tasks.
+ *
+ * @note This function must not be invoked for the caller's CPU.
+ *
+ * @see resume_cpu
+ * @see arch_reset_cpu
+ * @see arch_park_cpu
+ */
+void suspend_cpu(unsigned int cpu_id);
+
 /** @} */
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1570731650-5335-2-git-send-email-vitalya%40ti.com.
