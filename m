Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP5X5D5QKGQE3FK25RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4030C282CC7
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:16 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id b2sf3106556wrs.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838016; cv=pass;
        d=google.com; s=arc-20160816;
        b=w46W5srsKmHf5P5Sk5iMltTL6KweZoftl6WChkf6ZFT3q++mNs/9hAAD+x4UsCnJXN
         nLXQVj9Is+Ob2DoCNt0XCHemjOmQebvU91fwkPQNqUKMDYy0VooYhDzbUOu/JVmQKUS9
         1yWGRpjYLPuNVvTjjMG+HQnhL7u1eAla6ajap7GK9rJ/4AXiSnyEEwj3lQV2V4YI5gtY
         k6OLTHBN4pGVejUSwpWEeUWJP6ULUUP3mL3pEYYBSzo5cwL/txpcbxogtqXTxEklm8SW
         xj82a3LiPgJR9ZDYjC5ssYLafJDS2+6yy5yJTqOzOh8iM0ivWqGB0lmOM5VxwzFKX7cW
         fr9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=k3NP7Ml7kTHuIx+sNxQ4Wtsn6ysEuLMSUgAksoynljg=;
        b=eXdJflVyJvqa/8a4TZdGeMf/bX5mROLLUVPPYNWzyxJBPo/2dYldT8H+IgS5QtrdgK
         sqXiIyCeOGFfJzNxSqtASgqfFqCEHVglNfJQ9vuXQKibFFzBzy1lk/OF1BL9TmO9c6pD
         XWMZwHRD7bPhvQrOS0Gxqf699UTmXzI9IsUBu3CcW8XB5+WCMOEZKlu2T7PTt6Rpify+
         H9HBOtcGPj0dQTlTJ2JmmKf4FI82AIIbtckkh4ahR/DEiFUFwwXqQH78tGd0p7VI96IS
         w2vtXGwGSmGY+PZbhH02V8786/TE+xzQ5QY87eHqxwI9vICNK42xUM6oPSb9Pe3pKFjU
         R7FA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k3NP7Ml7kTHuIx+sNxQ4Wtsn6ysEuLMSUgAksoynljg=;
        b=nNk83B6GHVFzsP3VRLgN/kYnC7GvFYqd95LDU4cniRXNvjtzOmnPiOs4AOrblWxmjG
         Wmx3J6SqqUpb4YVA28B+3nwYkK7OO52OVT/LmuxLSGpdAaYdF9xFL5G1K8G08Y5TvRdg
         44VUKq1BPCqLxsvQqtcfB2mWbsfEpZpnsXjHK8YJ7tAbWMeetmCRGmnJ276KcPCYvsXe
         Yqyjdt8iO5SuiNwXvND0P799ynHWwPRthbzkkJKXeNLJxbkydP4pxMMGEhO5+HfCvZcT
         Mms7NpkN+Fw476oUq9w+CPHGrTA0oIBPDCLH34LnC5yxXMCxtJkDcCFIqopmKFweVpya
         /9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k3NP7Ml7kTHuIx+sNxQ4Wtsn6ysEuLMSUgAksoynljg=;
        b=H9l8sSmYhiWLS/kW/mLAnsxF6kZgjPuVwKkVxqHyWDTrB/LVW5QJcdKWJg5YuqZTeC
         uClw0whd4ObJRkAKD1IYPWEc/ZkkL842v+Ke4xpZ15iFYLy1+tzFJ/PFyOrN+A5UYSCl
         nfq+tG7ELQ9eXQy01F2XWBUg2oaXDHjaXq4Qcy3om0MZ+1ARqjbH5pYLN6+dTu+W+2X7
         azQQHPjwKizP1x18vhbWQnsZmWLWDdW2OMF0D3kFub3dgJDnBrxImHlEvWBjGotgoTpx
         7BZtNuMZcBAYLn1DM8kFeaUs6XTRxv54w/xg0dEr+QP6hXudKEk+Sthuyne1sV0wH/tp
         +SdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5302n2kFkf9Fy93zAsodGY8bCEIeAneOAS8lQBZuUbSLAPOwZxS7
	RLHpqYHLqTcF0VBHoS7MUvo=
X-Google-Smtp-Source: ABdhPJwbvcasWl5FAqCECPJpvXG+R613ynHsExJnXmOEqX/NZoC2+WUBzFX7sNco0+50FgoH9aBTWQ==
X-Received: by 2002:a05:6000:10ce:: with SMTP id b14mr1353231wrx.204.1601838015963;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9e53:: with SMTP id h80ls3543782wme.1.canary-gmail; Sun,
 04 Oct 2020 12:00:15 -0700 (PDT)
X-Received: by 2002:a1c:dd0b:: with SMTP id u11mr12900667wmg.186.1601838014957;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838014; cv=none;
        d=google.com; s=arc-20160816;
        b=h1xXLY/V/PkblHIveZnYcRAc7UKZ94fuzsDkcIUrzPX/o3DM9mLS/L/hxq6Kih+IF2
         K0x2ex9Jrj40QcK7mFt27CSjq1bqRDn27r62cttUKk7Zskn8wdSay/pTaLKu83TlvqQY
         x9LZ+CrYZZT9Pt+XfiBunW5NXX+tbWkhsyqDaJySrSj6QAoDudrixAAJahVsDxl0BApt
         LJgjTanaY4i0aWcG8EXtDLGUXWf1pIEh11k3PLADvjXZcjYST2ZYZA9K/7IWB3EhWbes
         sxkUbYuZpZBzhRCfAJ1S2kN9urjchAkSaGxLsj1NgxXzXgv1vZxN1DBwewX0meAc6IhI
         ltqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ewYiqC6XW0k5wRX4/xPGuWZMlD7STiCi3AXqepnb7MY=;
        b=PLQznJHCH5OvuCJ0gx4lXPxOgHOUvZFZh45UumKKNpOxhwkfxlDdGK8wcLqjrScChn
         Zh88LDfY9l1pqm5tHYNbM+yTgG5/Cl91Svdw+Pv6VNqHT8albHoyf0W+vN/hNZz4KvgO
         JSmaX9FRg7wdX11UR+D5LhxCnoPRT4FIY1ANg7UlcEn/Nt1uHqVs47/xWrNZxKvZOioh
         DIpdtDVBbHrfyajquxcriIVOwH+7SL32BPjrhC9pAX1Txh0tx0Eda+MHPy3CE3EEc9WM
         jrZ/GeDdHzVDT8//gtYRS57Vc9ub15qBJmnqlELS0uB1v/5TPjv20pFu9/Ap4C0d34vL
         BdEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z11si288173wrp.4.2020.10.04.12.00.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0EiR004390
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060g017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 30/45] arm64: smmu: Fix TLB flush on cell exit
Date: Sun,  4 Oct 2020 20:59:51 +0200
Message-Id: <0096659f575af9ee67e51ece770116f31793da57.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

We must update S2CR and SMRs first, then flush. Otherwise, TLB entries
might be left which refer to the old settings.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 95d45148..34f2b821 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -583,9 +583,6 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		return;
 
 	for_each_smmu(smmu, dev) {
-		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, id);
-		arm_smmu_tlb_sync_global(smmu);
-
 		for_each_stream_id(sid, cell->config, n) {
 			idx = arm_smmu_find_sme(sid, smmu);
 			if (idx < 0)
@@ -603,6 +600,9 @@ static void arm_smmu_cell_exit(struct cell *cell)
 			smmu->cbs[id].cfg = NULL;
 			arm_smmu_write_context_bank(smmu, id);
 		}
+
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, id);
+		arm_smmu_tlb_sync_global(smmu);
 	}
 }
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0096659f575af9ee67e51ece770116f31793da57.1601838005.git.jan.kiszka%40siemens.com.
