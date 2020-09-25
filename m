Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ66W35QKGQEA25GGMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020427832F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:12 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id s22sf782645ljp.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023811; cv=pass;
        d=google.com; s=arc-20160816;
        b=1KwpzbqoY8kYXJ7Yen2qAkbonkrEYBK1jQzGQn/x95bhbHd1PZOgXL+GNokY6DbRQh
         VaOc9cbMOQ/69a7b/zbUf21jaEV7kdY1DRUPFN6v6hmcGTfKhS50oIERlAOlJ76khnMc
         9KM4dkgx/Tp8GxyVX/W1uy+M7NDJFnV+Gxeny42YoPJEyzDttlnrimf3THIbC4Nk8mnz
         atwfaaNNp33Qgoh2J11yz9DZ5n19sMRT3UUwT8VxVufz93K0BcCXJ8M/LC00oV6M+bcw
         bVrgtaBX88FIMeo2P10vzM7FVC/lRxVPj2acQfkX92FwF67dys/7vYqdoKkD+qhKIQ8Q
         EeTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=M7SmNN01BNKrmtCY10QUFQDYYR9OxqDq5WRPbyTZi6I=;
        b=t6jLC31arfkW7rD9i5uPhOHfaH+hzlane2lFOHqopZ1OTF494PaEj8ZgN1RntRRL06
         KddcNPcAYrksFfnW6xzAiW5NPVkC7jHiikUyJRGyJfNpup0nNoly5ItLLoV08OYhUQKZ
         1C67Kr4J8JSkdFduC8PjQgnvSrYJkjaweNRUnsvKoyZ1eg1YnVdEwkX4iF6bMlHER3Hh
         WHHrdKMKsCaFn0PX4N0o1ngYzuxVkN5FZ1UroU2mBeiuY8XKol4mpeHq0eFwQz9gCkiR
         bXahz6LsSxtcBq9xUAj59clyULD5TX/r2Xl3jynoxDeqnv0J5Jmc6pducbBt+PzLvVb0
         647w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M7SmNN01BNKrmtCY10QUFQDYYR9OxqDq5WRPbyTZi6I=;
        b=XRT+wCY5JTYldhB2nNsNajrMf9V8j8iwnUSfaAvRAIP1ylPKFzmq8f0pjtbi7L+fUl
         ras1I1dfmD+UjzjU0kdaMvU8zRvX1D2OL8nTp8gR/ZHY2qvLb9zYcRKdLmMm7Xibus3Z
         VJ4INQ3O5/YujCv/Z320+/Opl/+LKL7IGJ+rdcEtSnXxITvfmfdGPfXrUTmfOdR0W3EO
         QtCiWc4u6ybJEGalL+B9WsKQsl0cywUCYmrg3ab8Aqzr13PEUxiqL2gGA5oW4BvI/F9U
         IvK4jrbSAkEt9lMIwZ0+rUW9a9X7qz7jS3XYfyvvQWLHrj2jaNOqPU2bwJhnap87SJyn
         xypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M7SmNN01BNKrmtCY10QUFQDYYR9OxqDq5WRPbyTZi6I=;
        b=RVYeUQ4bHU3LzAAcVK27doBMDIhvNhYiYJLHKz33Gx78IbGZhOd2dz66dLwdb2yGbu
         96swfbqmaQC8ZpCGN8tY15xQ3P1XJx//dV90oFaCh9P2zUHFjL5dWcNXbpmLIR+SL8Qs
         NSsiTLkDPXGY5fQLJ/Ht7OdU8CPs4n7KR1ZQ9VK9RE3BkXxo3eXsaGY+IUhA7Vvw8Bi9
         jP53AyLrH1M0+0m73/kxXgnewMWJVCnflfJI1qhWdJ/7ZGWt3VSRwC0hKzAiIGeI6hlZ
         encJ5iv1TpLFFS5TriFSs9B5WM3LfJEqMkpnbRE13fvSEpEhy5ZSVyHHqSHaR3LmSnuQ
         yRhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53257ntIx4VuICB+mrbOTn3E28LQz3+qzsLEv/OOiXnhgfV5z9As
	pD8zwqXcpks/dBeIYAycP8s=
X-Google-Smtp-Source: ABdhPJwRS8tIrwrwECmH3iYeS1mCgxpfaNiZrGRj9Iu5kypTggjbhWh8bODmrinwTZaMJ+WdY6XH+g==
X-Received: by 2002:a19:4117:: with SMTP id o23mr1100939lfa.301.1601023811686;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls163527lff.0.gmail; Fri, 25 Sep
 2020 01:50:10 -0700 (PDT)
X-Received: by 2002:ac2:495a:: with SMTP id o26mr1092481lfi.94.1601023810277;
        Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023810; cv=none;
        d=google.com; s=arc-20160816;
        b=cqRF0JHNhTHJRiISQ/Cub6O7uf7KycIjfO1/AoLu3vgOwTtSfGE92W51xgx4y0pCZs
         SkAEuFtlAK1bUNMsKZttliz+ICxZPXQQeO51PkOn8qiDrJH4N8/lAg4N977rRoqRCq8O
         vZ3Ld+sIIaXfni3wD54grOhTcPzxONiFNUwtUCD19UtW7j67Q8UtkZEVYlXBY+PXlN2W
         lwh3PPK/0JFaVjCA2DwB3Sm7+1jDiQr05gNAMuPF+/c3gQ62IK6wNpfqqBoD+0HoS0JK
         Zw9G7d8Js7tauRk+rDX+WWBSt2grTW6Ngb+vFeW0YApjUpjey6XRtCf8oyqM0mAw/38b
         lWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PBXea0Kt4LdQoeSN8jxZf1zwJaz6pB4BuiFAdduImkY=;
        b=jnDmLJYAQ0VpbesGfnyfZU7KgqQBAQDtnlhI3uMFLvjE1LqMBZCs7Dff3onwWZbKHn
         slJUykl9z2A39+rggAFeyxq0l1voFt/rBcfKUQ48lFPtmIi7sLNwMWxfmkE3F0AdKGbp
         Atxxwnn1MBv7Wn5lWw6pOvZRPgUa9zhbnqTKTvdao9ht5nA+ReDwANr5q1mnSzun8Qor
         pTU5A/Jsh7chHk/Kz8LYuQprpGmYoo49W8dWTtuuwqjdUDji9ieuFzc6t8HYfAVKXiW/
         qQniALcjYfAiNvBEdWAUVNCLoCc824OP5gIppYT1ebFUncHhXH0fi0SV3/N+NTkWdSot
         Oulg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id r13si60369ljm.3.2020.09.25.01.50.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P8o8BJ017334
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:08 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7II027224;
	Fri, 25 Sep 2020 10:50:08 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/8] arm64: smmu: Simplify __arm_smmu_tlb_sync
Date: Fri, 25 Sep 2020 10:50:00 +0200
Message-Id: <c1a7dd847f9b06e592a93d51ff0f50d7f6d88b37.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

No need for a two-stage loop here. Just test and then delay before the
next try. This aligns us with the original version in Linux.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index eea5d2b0..8975e8b7 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -67,7 +67,6 @@
 #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
 
 #define TLB_LOOP_TIMEOUT		1000000
-#define TLB_SPIN_COUNT			10
 
 /* SMMU global address space */
 #define ARM_SMMU_GR0(smmu)		((smmu)->base)
@@ -325,16 +324,14 @@ static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
 static int __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
 				void *sync, void *status)
 {
-	unsigned int spin_cnt, delay, i;
+	unsigned int delay, i;
 
 	mmio_write32(sync, 0);
 	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
-		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
-			if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
-				return 0;
+		if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
+			return 0;
+		for (i = 0; i < 10 * 1000000; i++)
 			cpu_relax();
-		}
-		for (i = 0; i < 10 * 1000000; i++);
 	}
 	printk("TLB sync timed out -- SMMU may be deadlocked\n");
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c1a7dd847f9b06e592a93d51ff0f50d7f6d88b37.1601023807.git.jan.kiszka%40siemens.com.
