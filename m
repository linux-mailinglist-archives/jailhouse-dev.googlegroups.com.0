Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7MP3L4AKGQE64DPUNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017B2278B7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:15:26 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id f14sf2092641wrm.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:15:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595312126; cv=pass;
        d=google.com; s=arc-20160816;
        b=e3CSY7Ny6CPstPEjp9x4VQzVNcEDe11vsqW70Sqn9tYkKKD9d6uFEvZguom/xu/Dgb
         l8a8M6XK8mAHfHXcCaIIpHBrpyJQDLq4PdRN1A6Ls3aB3fEcO7fnoeuLlXy93GFgTAY+
         cQHd03Gq3gDmOCjetnFZ2J+WPRMLoq9IwBRlkpceSteGPeX24JlcN8UrgozlPUC8DgjS
         sktynpFaCNTYAheMJWHqu0yrgjJQMGFHrTze3G7uueukGGiJVaGzHFQV6YAueGejG/DR
         +RSbVEsVkrhB1X7kZhRI6YxFlz6mx+yf3AzTSUvChG5xcBQrlpl73H8qUrM3yPhh1AV+
         tJSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=0vOcuIV1NCKdqHqhRf1eUsxjPEQOZSKXGhNI5CnG84Q=;
        b=z4KD6LAFKw0kQbKJ69UBmqSWJ5q5C11fD8NNGOjUFV7TTMW9mqLnmeK996PzUqwcyb
         jqlVyk3nMgjUI3jsjm+nBEWgJd+LlZaeQv/orr+K6uD+esNKJI3TZRWlJWew10lRCjxb
         WKig9sQZEj9ic8GQVHg2V2K4QY69iGplg15p1NruQ9zDX/DPa4V4uljAPnuBqtwyGux6
         GD4h67QZHyxUkicTUvigZwXCMS3OnV3AjOe1BqhltF5id4a5dSXbizuhNV9bzRYwk9ks
         0qe8SfYg3MwoVVDjPQpzvrPHLY1zN9Qu/vDCbSLayUH3zkH12pfNwrNuVqGuAW1YfOJ7
         pI1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0vOcuIV1NCKdqHqhRf1eUsxjPEQOZSKXGhNI5CnG84Q=;
        b=JFmImrobmVcWxQaF2lhT7xJAoUuRS4VrUQnDhDpSKq7l7rNZngU0N59GDjeBWoEyws
         v7pfxRVw4KhUaPCfbfXitpaZz2nHi1YTgTQ+rAuCtguVb+KvTXSYw6HO4Wd2un+/zuh4
         NXPcDN94cvjF3Ns+2ouaDdB3j4J7cX80e0X86f83R4NKqYJUOgsdkMnL+yvq4UPAiJ/v
         sQ/PeU5WWJ9XTxjpMuRjIavWZE5YN/rB7WBvbbRDABMKVRBGGsYi6kaHTlezSrLPsvK5
         kNy1M7kimNlFedBQ8clv5kYpoytGlDBczNrswG+H7iRoArSSqmEbMQDNRotJw9ZvW2TK
         KR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0vOcuIV1NCKdqHqhRf1eUsxjPEQOZSKXGhNI5CnG84Q=;
        b=CcvVX+POAR9A+sNmILDJwtGiTEqbB23fi505HqW9PaVQcRw4NKlZlIUasIp3Nm6GU9
         Zke/SGaAFqgYhqgSFJuDhh9FJ97vxkwrsLue3QhYZ1Ax260GfIsreZUqVadejCqQVTMZ
         SNE0XZmNqgPT3VYFb/eWTS5yErCTr+EKMFk8fuH2hTkDRSMGG+r1UbYv8QdOSwh/7EVn
         FN3hHMAUuowFX/f9dQ7UVbmGoBQlNZhMWTvX8VYH9kmMAWrJ76APqKz6IGj6TDGZpaPR
         BE42amXbNhfVprGheE3Ok7d868x25EWlMRxzfUezXTzS0Q0C4OCrd2sRTC7/TwWOGxq8
         NzeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53369ibbva1S4g9Ogo0wpfl53d7BuretMppS2J/waAwzuJxFqzbZ
	8M4CGcDgoCJVT7K0LWZ/IF0=
X-Google-Smtp-Source: ABdhPJzcMOxo/hPb/ronXD4O7/dJvAmdnxUMZlgYpqjhvlMymxFvlsgr8XcBW3NKmH73l6FSOZ7waw==
X-Received: by 2002:adf:a192:: with SMTP id u18mr8024698wru.158.1595312126111;
        Mon, 20 Jul 2020 23:15:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6507:: with SMTP id x7ls89372wru.0.gmail; Mon, 20 Jul
 2020 23:15:25 -0700 (PDT)
X-Received: by 2002:adf:f750:: with SMTP id z16mr1967074wrp.351.1595312125319;
        Mon, 20 Jul 2020 23:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595312125; cv=none;
        d=google.com; s=arc-20160816;
        b=KmPFO2yoazAwCLLGVZnME8FOzQ1m+x2pxb4djYWj3SrNOC3twlWHLUg77MDpegS0f0
         WPK0zeXwQFDAu8BcQkYu1r/yuq4VUgbEXRnjwNjB2ers6cwT7oFyvd7CsRdaXc+DgS9p
         MjwN1gjOdm+uD9xjQCvjgdlKETEsPc8n97V+Dg6X9EfSlxSjDpD1t4yOfNz4s77az+6E
         1QRrNo6BP0uTafWecOcIYnV+r8Br31YwNIB8Qk54jiupaJh95xDdmhZFNolgGBdhlfhJ
         MAcZ90EZM3JVDaBFdUXbiPIEyRPiL+1hJu2WydCu9sR+dQ77LoVSrkPxFRZRjBG0ZLc3
         3uUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=lmhMT8CLAhgCK/hNV7DeGLzBeB9lhAr36uMv4fe5XhM=;
        b=PExKfPXlMuQ0eqlv3iUXyEOXA2/qUaOy9LVPTYt5WrC13bR1rfF6x+ahXcO1kMlIi0
         08N6GTpq9chK1I1WFz+5y0iDVRiHNwYfgkZ3XD68C7XZQ9A+YafikyjvuaD1tQtAjbfF
         Wez3CMd1IuEXbWluBPwsl9hAShNzLaG+Zp23+o1lfMSkh7LIGvb+ejPbjmpKwaZDhjeG
         y6VuuLYF1R3H4Yr/uQPu+d0fFSxTvnlZ2/fxD8ze4llOwT6+AQFlzRLjnjsCfyficJk/
         ho5jIVr3pS8wndhbrL9lLjPujM9NN/AXWh4yQarparD7gGUfibh//XUWDZlV2Ta4cMDx
         zI7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id l4si999787wrw.2.2020.07.20.23.15.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 23:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 06L6FOHV006140
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 08:15:25 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06L6FNaK018114
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 08:15:24 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/3] arm-common: Write VTCR only during arm_cpu_init
Date: Tue, 21 Jul 2020 08:15:22 +0200
Message-Id: <41d858e9584d59931b54a1946b7c3265b6ba1cd1.1595312122.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1595312122.git.jan.kiszka@siemens.com>
References: <cover.1595312122.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The value of VTCR does not change while Jailhouse is running. The
function that writes it so far, arm_paging_vcpu_init, is called on every
update of the pg_structs of a cell CPU. Writing VTCR each time as well
is harmless but unneeded.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/mmu_cell.c | 1 -
 hypervisor/arch/arm-common/setup.c    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index db618960..7f9bb10a 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -137,7 +137,6 @@ void arm_paging_vcpu_init(struct paging_structures *pg_structs)
 	vttbr |= (u64)(cell_table & TTBR_MASK);
 
 	arm_write_sysreg(VTTBR_EL2, vttbr);
-	arm_write_sysreg(VTCR_EL2, VTCR_CELL);
 
 	/* Ensure that the new VMID is present before flushing the caches */
 	isb();
diff --git a/hypervisor/arch/arm-common/setup.c b/hypervisor/arch/arm-common/setup.c
index 26de97d9..c16fe27a 100644
--- a/hypervisor/arch/arm-common/setup.c
+++ b/hypervisor/arch/arm-common/setup.c
@@ -41,6 +41,7 @@ int arm_cpu_init(struct per_cpu *cpu_data)
 {
 	cpu_data->public.mpidr = phys_processor_id();
 
+	arm_write_sysreg(VTCR_EL2, VTCR_CELL);
 	arm_paging_vcpu_init(&root_cell.arch.mm);
 
 	smccc_discover();
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/41d858e9584d59931b54a1946b7c3265b6ba1cd1.1595312122.git.jan.kiszka%40siemens.com.
