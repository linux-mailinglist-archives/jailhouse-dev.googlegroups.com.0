Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPVX5D5QKGQEF5JMHJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DA282CC1
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:14 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id j4sf801774ljo.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838014; cv=pass;
        d=google.com; s=arc-20160816;
        b=qehrtJoCXBwrkMrCR/R2+3U1oFfr36AwKKuuYv+NukE8mYyp65Sf2ScDV8uXale1ve
         GmGGu5Nmkg3Oy46JOA/HESBiZ8pIBi8xEgh2EUUoUL818HhHo9qxwjXyxrvvNk2MFgr8
         8Hr0PHU8QUEG6rmzsGS3q7F8KEubKsiurRACTRPleW/impYgiAQG5etTiFfNHwAJd8re
         w5EvzGOGZqCWrTptIW18E6C/BwbR8GG/2owCIUHcej8e5iiU0LHdut7ddwL1darcTgeY
         BpIftyIpTikU3GQvW2YZjvF7/30cUkDjbinPgnhqIbAisEthRzJxFDOAfN8CwFV35vO4
         DyBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=IS+/fXQ4d6aw3+Giy1SzotsyOk6ocEDPBS8+KLb3ugg=;
        b=liYgErhKt+yqhXR5iHa1+ipBT7OBcbrfQiyP+E5XjyQjpKAZ2cJ8MV/1YKrV+7SnV6
         1088wOZsG83+Tzzh6w6wPCCJz9Qtk5YCAI9PFLkoPPvu6rhkACAEPAtXKpa1MyKUZs2n
         /aWt/Juv/5goyqncPb2rSYcXDQ1Tu65DTaad4Vrt1YMMsIT3ihaXCgZgnSaGU6db0Tpm
         VZ3wH4ZMpmGwEWVXTUQJDQqSTcQ/4J3DEH3MyBvPi1Y6Ue8x9xvafUmZ30tzwnFZOzbX
         1kPUW+k0WilVbrf18ZgoVQMLYv3LTVneSPrEg8Aq/h9V5cXsceAM1zI9VK8+N2D2hPQ+
         1Y7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IS+/fXQ4d6aw3+Giy1SzotsyOk6ocEDPBS8+KLb3ugg=;
        b=D66igWy782AqYBMjf4O9mFd2kbA6I4mpSfPXOQbaf/EMY0W7OUi/VE7xWCXD37bdcF
         LytxpbAeepWo+HB7UDTuIIg77gzIxRx6dKeVxFUb0IJwjT6QXU/wWxgBFCxWl1kQKe7G
         x6U4KriQT1IJnh55UInVN53QdgH4fRJyiJVR6M+/UK1EJC5S84ucbFtDhqCvVP+UuurS
         3sfiWEB9HuVCUZ2+fmwxfL0AUbJZvIYMH1TKihD6kVfp0r4SRi6P4CDSWFSGS8ICPlpX
         gM4hQJ+LSjpLm5b+qT0Io/GsxsOaNGJQ2soMuKayiXI18GOczs7xWiEVvZfWlvf+agyX
         VcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IS+/fXQ4d6aw3+Giy1SzotsyOk6ocEDPBS8+KLb3ugg=;
        b=aWXp4/uULwJ3yHcMa5KZOkQumjGYqHVKRzGwU5AyNnjCN3cuVshVUpMVTddm3HpI0i
         ijKhSR19NC+hkU+cAr7Kycs9YcccsD2qL5222cdg6zv05j6gAEFoJgujcc9tL24cH+O0
         uVJ2YvUeg+M0yHa30kmu0QLxupFu/F+gqCDJAG9woCdRJ9wkBheLiJtH4kp1Xx3ZUc2p
         HciN9snmNR3NhvUT7FN7UasdGlEqMD4iBDL99TYRCe05oDx+r3pB/J7Mjc9HNmr4fLfA
         pQimSTC0NQZ42cVrkCTM35N/icul0ZwMGWLq+Mn5D9dPRqErkvlfFoW8411+KSUKrZun
         9ZPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531UoWG1sigu8MYTFzWiVLPOSkCgFwOJZqfcDYkCZ++nfiwSgtwJ
	r7kcIY6+bXbVVp6Hwbgpjuo=
X-Google-Smtp-Source: ABdhPJyTnUtODygD9+MQlTt33tqK544bh3wjIxx6y5mBIIKJztsX1Cc8po9/iSBPI8/EXFm+2VF3ig==
X-Received: by 2002:a2e:964b:: with SMTP id z11mr3474991ljh.364.1601838014426;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1119029lff.1.gmail; Sun, 04 Oct
 2020 12:00:13 -0700 (PDT)
X-Received: by 2002:a19:e45:: with SMTP id 66mr1251819lfo.376.1601838013144;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838013; cv=none;
        d=google.com; s=arc-20160816;
        b=aL8LIwrIqHbhbbsfEZ5ieiw2lYl+CYaH8etTNCzflkpt6+U/T7F+BBKH8hNMCJtfz+
         NiMoCmfNnQ/eqgjfg3Pa/9x1tUK3COGWjJ9gbppVZgjJJOBS2TGKPVcpNVwX56arSQVD
         8bc5fYoBMlZcVH7Q+ASTwBF5U089B3O9+rdfgnKt6URUT4j/CWdzMKR9AJjdk8Mya3le
         T+P9Cw1u/YS9JOeN0Mo759A4vkaDbon5AUJdp9FDNkq4kVoRGs83RyILHDeexhMawuyu
         J3CKdPLuyrU55yhdPCxzxUk927ux49nk3gYM6iYaIFU9I4Cl77WAxPL1wrOnqfGen6lU
         Bj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=q3msRyArHF4h6NZc6zHo5+hdbujvf8ZBIJr6jMB93rs=;
        b=q0+Kaa/RSUgKMFJgOS2t/XVXopspDL1yuPw68wA1I7YIvTj2sSfybk0hYD9FGwLksf
         wjugdOspHFu6n7A1dmPPGGeJLDdPIy/xVTmUUbPGaECc+HI5lphgvq2aFw+Eqn8nhf+H
         gkY/aN0fKUMDyEEPvB3bjafCs9uRMknNknI8QCEseIfxEFgin86IfMypYKQxd2GCYYn7
         Z54PhKeEf6sIBlyn07mauhqr6pAQJf0BkNp2LO03Bxodd2JUde8AwPFXrD1w0Dihb1vB
         bQI46xlZ9ufthtx1zQFEH5OI+KGZ5D6rkmYVam+kNRSvtGp3PW3TtO4yYq1T+V+Cs/PQ
         UeWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y75si166774lfa.3.2020.10.04.12.00.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0C28002623
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060X017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 21/45] arm64: smmu: Drop write-only pgsize_bitmap
Date: Sun,  4 Oct 2020 20:59:42 +0200
Message-Id: <a97632291c57e73bb1f4469de1a8e0d2c5e55b05.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 44cecd33..e5a47197 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -261,7 +261,6 @@ struct arm_smmu_device {
 
 static struct arm_smmu_device smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
 static unsigned int num_smmu_devices;
-static unsigned long pgsize_bitmap = -1;
 
 #define for_each_smmu(smmu, counter)				\
 	for ((smmu) = &smmu_device[0], (counter) = 0;		\
@@ -652,10 +651,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
 		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
 
-	if (pgsize_bitmap == -1UL)
-		pgsize_bitmap = smmu->pgsize_bitmap;
-	else
-		pgsize_bitmap |= smmu->pgsize_bitmap;
 	printk(" supported page sizes: 0x%08lx\n"
 	       " stage-2: %lu-bit IPA -> %lu-bit PA\n",
 	       smmu->pgsize_bitmap, smmu->ipa_size, smmu->pa_size);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a97632291c57e73bb1f4469de1a8e0d2c5e55b05.1601838005.git.jan.kiszka%40siemens.com.
