Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWXNTL6AKGQEJMV5RQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB3D28DB4E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:14 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id w23sf284766wmi.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664154; cv=pass;
        d=google.com; s=arc-20160816;
        b=LIvWiDrvdMh8Kf6TQAQkCfQDEUYNkjZIpw0nAfU5XEP4dhZ5YcpITfWVpUzfm/4fo6
         lTPqRf1FknOWDQECoc8+37v5oRgT3NfhYyfjPcfuGGtd3Qp1+bRpJh9FQMl5i4UpYKB8
         0xuGEBhWnk3ibpbIUewsuKddOp0kxclmg23owvFAVfBCqm7Iw9MBgdHdvMKoV3gi/Zfq
         kj6+aqCqR+HYdTfSUy6ieB/KBlY2BbSrkdGj0n/cssbeYItEiHlYKkqTXju5QKDWMsST
         YL436GxMaGtL6RdhZWjsi2NuI+m5nvA0UrjpCP8HFSZca+1vv1DTcuaUEgxQDqNyv0Zj
         1JKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=G39NbKwZxJDp5daclT61X0zmPRYJ0oZhtzsUm2gxxXg=;
        b=fRWQhp/L2xqq0fhM2rHmA+M+s+YWCpet6Sjes4upObO7VFYwZNdBC07kVYEZ6aDfQf
         OW8vFZtwsl6Jj7J6S+CYjgDHrY9+oOwX2Lb/nn1DpDKDoo1y2YWxcvUypMT0TjP0QJ8g
         WnqF9fx953Xwtthr02u+LzYLCHzbqisOVtn0KCXx1zNf2yAO01vPgAvxczkHiaN0Vvkl
         5ruzfrrDlHChjo/jz5XG3v/ijgPOgHWq6Q4U1wPKXFuHyN4EGi4ydcwFp/1N3nIRbC/e
         nm/zgTat7IhJbdW0P+BgTEyWgx0+zDE8uzz1vCaoqM38eGcYBa72UPCbKUvxA9jqaTDi
         26MQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G39NbKwZxJDp5daclT61X0zmPRYJ0oZhtzsUm2gxxXg=;
        b=A2quCQ38nQzkuKUClCPaCE2F5ShBu58an8AMnYcPqcGHed9Xt6BwAYk80FxpKKMLPw
         zvHc2cuoNPFQvFRtTsandBdc1UzsdS/pcuWIlbtJlWBkCti38vYdVi6/1bqQWGOUaWAl
         2ExBvsBfZz1c2kwD4TfWPJq0PoAAHHrzuMCiE1BufWG+yJ+9T8xikqkca+G5v1mn04E8
         SZ2Jb1Ug13qIbavVm1GFijBAKJGwESgL0IoPpjOvPsjK04PSc7MBf3jAveQTB6z++fdA
         nj22SsTS3WDNTvTRurJ+eKxuFaOUEGObVtye0v3vv/E7RoXXD58tCnXNJ1f+cZitSCYF
         Ainw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G39NbKwZxJDp5daclT61X0zmPRYJ0oZhtzsUm2gxxXg=;
        b=Lsx9i1PPGdfOJOeTUbiua9KfnMNNU2ECNXrP3vlkLF11r/+Ztx/tQx3g2yNAC4GxNg
         VgB9yGGawNSVoXwwPPZnWoHtWmU925PGUW7YRJp0X1I32q0MRfRsoSQxzDBolVcEDxfj
         qcookjLAE5mdphvT/aVxepxKPTG+slDq/5P4Bip2wkh8Q/UV3JirRfqSw2i16wfroZ+C
         wdBieDQ7rtS9qJDpghd7AZNQGlkpbyfE4sZ6d6OeNyNxDeb8QNzsQKUp90TvK1UNQKkR
         tR/URdncvJEk6hTpDHmrHW++uRgcP7Ei7xYW4Nq+dAcQ5VZ2EqOChlwXDDW2jcl8qZwm
         2+CQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rA8vrL+FdrmykhVdXnZ4WYo7DBayHk9KiuUlG3WkMJioIwVKH
	Y0fJRJ14tMiybfm+3mMeElY=
X-Google-Smtp-Source: ABdhPJz2kowEanZzmw1UrcQdznB/I4FihAjjqnDYjuyYDM9G4ldgiE5wbSWTfhodrRl0Ya+3PFxBWA==
X-Received: by 2002:adf:9e41:: with SMTP id v1mr4521720wre.60.1602664154508;
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80cf:: with SMTP id b198ls753226wmd.0.gmail; Wed, 14 Oct
 2020 01:29:13 -0700 (PDT)
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr2407564wmi.140.1602664153485;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664153; cv=none;
        d=google.com; s=arc-20160816;
        b=CXoPG89OJW7OGNlfUOgWhQiHOIjZE1+9U1WS8ZcH3o54P4xidhvr7bQanYHd+5w7En
         0+MVDmIeJge7mjKuGsyhSsatOTdtzXSoGgmWe7ShUYPG2RtH7DUiLetO1vIA/nLfMHKz
         XuZq+I/W1y7rEzi6jztQQle9RyNew2NxS9E459nzI/6DhDena74HeDy6RL6exbQKUdDS
         xdwoL1EIv4WlmpOY4NOmt5ySzOTbm2NwswhmV0eD8CvlIQoc1/345j3QGPXKWocqqJfh
         AlRIODsftHQeamrEr6sf6ELgYI9feuXg/wx92bU2ItrRWu2GfLO/nXYvNd54n3PNvhFI
         f/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=qPOX8oYuuYpGiT2MEeF7pyf94qqgZ8RVuQIZGH3U58U=;
        b=y5yT60ocvboyg0c6j6NF1G1PP85M+H7NEHYpAuPXX6Ywr9+clae7g109AFd3vmDP5z
         htAp8BkVd1pI5E0o44cTZBNWqvMdWDk7+8fvjMIwNHLr5yVXm9nhK8CS9fqbIgHkdRww
         bs9/TfrAZwfLUfn0Y9uEMJsv5uOGvZC7YbeE767jD7u4kieWCV3vyfEB9PQ03OiFsjvv
         8WY48E4/4EA67hazBdz1wxrE6xxVXb/HWFJupzyg6IB9VMz6ykRvPhyIWIhg7YBN9Yfi
         qGprZBIF2YZLlbdu2+Y1KspcCuPFusuDeHja+k+0iIGrVwCN3k4dZ6lkhvSXxNtq2K5Q
         rfxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w62si34941wma.1.2020.10.14.01.29.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TD7i001536
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIu002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:13 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 10/46] arm64: smmu: Fold arm_smmu_free_sme into single caller
Date: Wed, 14 Oct 2020 10:28:34 +0200
Message-Id: <e4f630c664385ecdeb2f5f4092f0ab763d02156d.1602664150.git.jan.kiszka@siemens.com>
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

Simplifies the code. Also removes the test of the return value which was
always true.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 9b3d59fb..94f65313 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -799,18 +799,6 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 	return free_idx;
 }
 
-static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
-{
-	smmu->s2crs[idx] = s2cr_init_val;
-	if (smmu->smrs) {
-		smmu->smrs[idx].id = 0;
-		smmu->smrs[idx].mask = 0;
-		smmu->smrs[idx].valid = false;
-	}
-
-	return true;
-}
-
 #define for_each_smmu_sid(sid, config, counter)				\
 	for ((sid) = jailhouse_cell_stream_ids(config), (counter) = 0;	\
 	     (counter) < (config)->num_stream_ids;			\
@@ -908,8 +896,13 @@ static void arm_smmu_cell_exit(struct cell *cell)
 			if (idx < 0)
 				continue;
 
-			if (arm_smmu_free_sme(smmu, idx))
-				arm_smmu_write_sme(smmu, idx);
+			smmu->s2crs[idx] = s2cr_init_val;
+			if (smmu->smrs) {
+				smmu->smrs[idx].id = 0;
+				smmu->smrs[idx].mask = 0;
+				smmu->smrs[idx].valid = false;
+			}
+			arm_smmu_write_sme(smmu, idx);
 
 			smmu->cbs[cbndx].cfg = NULL;
 			arm_smmu_write_context_bank(smmu, cbndx);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e4f630c664385ecdeb2f5f4092f0ab763d02156d.1602664150.git.jan.kiszka%40siemens.com.
