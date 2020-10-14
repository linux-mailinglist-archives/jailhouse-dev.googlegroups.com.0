Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBX7NTL6AKGQEG7YJ2EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CD228DB66
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:20 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id 202sf292373lfh.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664160; cv=pass;
        d=google.com; s=arc-20160816;
        b=ltLMGdPHanSN/c2lJFx/9vwDhTR4Pe9HJ1zCrK4hD2kXXDdztuzs4BianjLKIu+UGd
         R/EkvAbMJ13IeRiAXVZ2pdZENFmjtjLAONCgPLqD/GTR2mnLMGcrrZUrzGLFZaogqAVA
         kdVre8e6yenuMfOzGq8PkIeipTiOhPOQni3RnaxD1GgDf1BtqKQgwTf23rjrIL0HVD+W
         uE+hfKfv12zEaf5Yhs1N+RLnFNKa86bJS/75CqD7pDRVvSEHpPSaLOSXCEUab2uQmS32
         qS0Dk6XYjToEjpkvHzcmT+kbMhzfKNqrWEyRN4vZ/FPJBkXi94qMOeYuP+XwBO0uu9Mm
         cWqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=LTi5q49kcr9My+Vhcpoa/G5YoESXTWMdLO2ztIoSy2c=;
        b=M+boAT1z7rfFTd9a2Y806xiEh4H9vK0ITbjQr38VDPceuocgQ9SX4wXWiRmMYVEyXe
         ld6Sppc+AMHxPfzGTW6TG4pPhLgEbxvJx70s/kemhKLO57Cz2oPzTffnGV81kg362xJd
         R+EMJzEg3sOD+KAHDn+UBJM+Cwrzw4xpEii99NC9VyieI68XHbec1L0m/ZqsJ8I6dmAz
         Db+cky3ALGGnhaW/5STz7fhMYBNG/IRwVBa6vAkR94kIKP9n+5d3rFPqkWu68o7iqlXn
         b5b4w2jews387nPB3epPkgZb2rdbVwgqw0R5Pyk29Eh+kyTa7fG/Y1+NDHHHTl8YPV1l
         1Cdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LTi5q49kcr9My+Vhcpoa/G5YoESXTWMdLO2ztIoSy2c=;
        b=lRBNFX4oEAS/JUcq2M3i9TCkI4NfAhwOV7sqMWih0zfr90eRAyyGsIVUHNBBmSR0cA
         /hA/XDHwUCOvsMRSf6IJXWunUVXqjLF2IqxTK6TCedAndoDucc3hUjEMIgwv74b25prz
         aaMcVd02a6IJs3TdJQxWs1feGSCpPzR/ETZG0AxmYNVrAOAJqI9sa56fOfy9yH/Vv33p
         zh2Xdw2ElRYAfinpnrlR65f8/hTmBoSMHFQFOGZwTAf9yeQkxTsR2n2tzBkiyLjC0C0f
         RdCKUKx6SNBes4GzE8aImdyJ9+ro4MLDQwhdQgIh/TM11m0d5UB8dfxiwAT9OEqlthqy
         MyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LTi5q49kcr9My+Vhcpoa/G5YoESXTWMdLO2ztIoSy2c=;
        b=egHJD7wS/fslcgC2UgQ0aJYtGZKejhWS4mOp4sdtOC0+vl6GlI5OuD+CYwOcRTWDFB
         7jDK00nzLA4UQKeLndg8BsyL03oxW9KalNct0q32nNgQPZnjBo7obpOg0B6OvuSKgkjG
         OF6XudSIikWPo6OXRU+5jdLC59GDBd/zygUHff2hJGfBSJPDALdaGk7fa48qg9b0b4zC
         CIcUZ4nGYCWkAwEnbKmqYE25jQSNvnpLggW3uZxFjq9K3CsXJJzR2prhkh1L9KNz4Nfs
         uYBxU+vP/ThYQe7lZXT2bK+Eu7xt4zTKhbDi/dyK43LSLq8E8+vyX4KzzhDGqFU0yYde
         mgSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532p1meqQDUZR9VuZzdhkHpH7JB/57P7Q6COVUjbJNfVN8+QOaCd
	4H9qL+t79fZx+SujNM2lhV8=
X-Google-Smtp-Source: ABdhPJwJgDCOABsEESlPeiv1tQAruTq7eEaoD7Q0Lt7bzakKrXBgKAOMslAeh+KQNKbTF27Q2t/Cuw==
X-Received: by 2002:a19:8ac2:: with SMTP id m185mr1067698lfd.81.1602664160017;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1311004lfd.3.gmail; Wed, 14
 Oct 2020 01:29:18 -0700 (PDT)
X-Received: by 2002:a19:52:: with SMTP id 79mr1088539lfa.222.1602664158772;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664158; cv=none;
        d=google.com; s=arc-20160816;
        b=OPLNtGVoq0wi8Tt0ZSET3HWj1mTfiLAwnKaWMIvfCYEaZ/RTBD6/s8tTfyTPl+nrFA
         cVYt3te1Idd8dsbv63nskT8e2Z11Q0gys0Gv6Cc/941My37Sc29BcyP2VuMSi9+TmY8v
         tRrr1sTTe7IRC4fU0ZkcSsoOjeozic0/PCCZ2HozFzTfWxE/YBnLSGt39FZwOx2Ba3wl
         AxaVeKX5kdBajXJilFVHfLq73Hyv6nfuBZw33IpjcBlytG9uKfx+950yROLX+7pRXwci
         Mj9khpHjdYuPxwqHt6v9sKUptmagccniW/MS0m5lUOc1tisdEFMAt+3xb6O7CL0RYfK6
         FJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ewYiqC6XW0k5wRX4/xPGuWZMlD7STiCi3AXqepnb7MY=;
        b=Mac19TbyUVFgfa090G9OF8/PQyOw8c7rfbRi2dXhIX7lyszEZeu4c7Xmkg9xUp6OFV
         t1LakDry5hsP3A/3JtX1/Wv0stj+TP/JOUM+NOHxWxCaSVmeCz51AD6LHlfHqXltbcuK
         yL4EVNB9IBJ8vjwQu7zawMr6++iLCxd4qk/QAFDA8nEQXXxDS14saMfb1s6JGiHrFZXv
         uvbKDbXa0XdYUDtx4po/CKdeVRIhYTNsajC4O7eywxKqgS/V6aALy69ObJvm0A62cdNE
         frsGzAMZ6x1NYNX0cq9QAaBV+I6f2qgalCGCDE33HWM1F4o77PpKFcSmXaBcz6NccHSl
         eiNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i16si48602ljj.3.2020.10.14.01.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TIIY001641
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJH002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 31/46] arm64: smmu: Fix TLB flush on cell exit
Date: Wed, 14 Oct 2020 10:28:55 +0200
Message-Id: <91e4c4947061c405ca9a2e7008426d55be2205cf.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/91e4c4947061c405ca9a2e7008426d55be2205cf.1602664150.git.jan.kiszka%40siemens.com.
