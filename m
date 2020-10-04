Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOVX5D5QKGQEM4XMBUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id DE927282CB1
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:11 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id u18sf286117ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838011; cv=pass;
        d=google.com; s=arc-20160816;
        b=S5EV5l2e/ohTXOPEHNpytybNKPDLI5yCqbsXFlGpGbNzBKF3CWTfOdzezExOdxtpfw
         KH2v7qt/4NAiX8t02/3U81zpv2zXAV6unz2KP8riA17U10Z+C+Es6PYzzA5xs0LF6iPk
         6hhqgGCr+jlhQl5ieif5jhKIXtd12WhGsPgXjnUYBOGQmvE7HWuNeH1/1SAu9p0tXBsr
         SbCwrDw6PKCWd+C/CENS9PGXoJH7KXCvajd2aHJXIe44wGXOC/z+kUqPmHhjVeLwugui
         HhP1QjmIIIm1FZMno4S5n2BRjbTzn5KOKsUh9sFBw97oPNm0nRFi1pKB7uIyAKSuVng3
         76BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ljlQZ6HTm701Ua/OMnQgmb45fHHL1kkIXQPwleHMG2I=;
        b=kSARlsE8NW/Uz6eWK89WMXLl2AJgdnSFbMC0+qE5p/qKVRQsN11Fabh6xHRzq+a7Wb
         vtja608VP32rbkb/qX0rUgHqejoLv86qKLu5lR1dA/Yr8wluVnqXu+Bli/mJx/9/MS1i
         CxOpXP9cqiPNQcESQA8SalJwBweCcfhxHWiyS2V8I+pfmxc/rTPs4Qw03kuS8KhqOcXW
         AFThNgc/OKdOv01/hd6GqIWLyz3O8d+v0HvMqvP30GOusO3rfZVfjRDSQH7vEJhpfs58
         WaOymNIGltitfB0xuHJAojSKSik088u1l/AyQWdKqeU8F6N8ZCQMSl4yMTqVRADd5Pgs
         45Ag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ljlQZ6HTm701Ua/OMnQgmb45fHHL1kkIXQPwleHMG2I=;
        b=p1ioJu3JCWAoZwrCy7HdBMkLGiUUeEE6k6IpUKjj4Mt1OKcEJhGuFY7cu+whHzjsJc
         B+sgywCcgD5VTlr7QteXxruYzab+6uFj7a+dbEIDPtB5rpzZIhGC1Ex1c9r+x1hc6JSs
         hCaGbs9saJiFUuHiygjOZrQ8BNg6QxdkFPGUY2SLMAPpQqPfRIoQ05u3ROWyeIlaDHms
         k3+MMqjG8YFYXHfRvcIdxOCDm33AWat14vxkewRwn0F6CMFKHqYxY4Sdh/Q2udn3ZFJN
         WIdiLvy4faPs4l2jA7y28A/mpAnneYJbbJvc8duC5lIAhje4PYi1Q3N1NPqL5+vafMCm
         IU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ljlQZ6HTm701Ua/OMnQgmb45fHHL1kkIXQPwleHMG2I=;
        b=kiDSCg+0kQ0dNcz1N+n6LZHYR+9sxiA3iuT5xRNr666Ub2U3GWjriohW6SJOb9jpH2
         uWc7Qo1s6So5Wde8w1eDkQ39PtAtlCLaRPrFkVdWuPgnthjHg++4smARXdlwnQcw/IIk
         582a7rgxgyWIrUBbDoR0+yPAZL7RA4Yxsk8Ac+qluzUst1fkG5jTV6OmbJR2ef9W+jqB
         PqMW4O9h0jDptKXPIB5KL2yQkiuLQtp8/R6a5tWfgU2DXW/TkZEmVMIgARs3qompxlCA
         HpllXiE8R6Ugm8GeeyyTnArdOv/FL4Bbo3ID57nsRsqsU3ykWe4+ZLDVCESE546mIKRm
         EBVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531y+FQQ7zy3eHzksxxBUHfdQdmmlgmtqmE6qocyNrLGKJ8L64r3
	5zmUfsOFhJ25p31+Heu6J70=
X-Google-Smtp-Source: ABdhPJwnubcd8stzivTfryWgUmlnrUfVpuV856AHjMH+1JNzQEVpYJmwEuaKjbYAP9IVUteK6SMj8Q==
X-Received: by 2002:a2e:b4d0:: with SMTP id r16mr1776528ljm.470.1601838011344;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:93:: with SMTP id 19ls748227ljq.4.gmail; Sun, 04
 Oct 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a2e:9854:: with SMTP id e20mr3356067ljj.152.1601838009991;
        Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838009; cv=none;
        d=google.com; s=arc-20160816;
        b=B26l82WyxlK/G0i5ZdTi3m+e7KcC62j/OmwvWE8wUdtSfQY7s6L5Sy6U+PjI1GgGBL
         rtqL+S50cfj/QqDQ0xf4cESPKpGBoHrN06bbe7kNnuhCoDabP/glHVeBO+4FulhjUmIQ
         n/LTrRPS93YlaYG5RON2sDFeTQpIfwf7q7LeAlffYI42FJ9DX9cO3VlllNFDmqjZw7e5
         MOqZkcPk99i4fITVW94VXbtE5CWaIV5WEWnzXt7B+yLDimmxifdl6bKg7tmweq9o6h8a
         vE+qq/n62nffQHaVtmiMM1ic1GvdIWMSILGL2ITvBfhAAQfY9QZ3OGrHwpfnVhcPZdB2
         P9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=fv2D9qcB1s/9hkc9sb/9N7T+Y/V/uwq6Eg1f9IA3Aus=;
        b=Rv5hLHHKUMaBEKoaOg8Qk2YuI3MLndaroZQYbfmCeLVhgnKq1p4mQepB80KQGz6AHS
         GHilu1g1tEOFTc47n+2bESOiSGNl3ZzQjJCoFx697MJ2qTdVkzKoxeBXBSF/Abb1SjZX
         8SWMIlCFhrvqWYy9o6Zvk4tp/J5JP4wXI7iRIs63aFPCKYxhYhLFZXkn6E2LYVlrMKOi
         zzg//T8eRJpC0bOn4yYRUNiaOOod45Tgt0RA3jGX3kEC86ccWH6v2lJhx/mzWgAwKmc1
         2Ydhi07FZamXwxowFirYj6TY+H3UEpSpLZx4l/3Zptq3EdDKVtAdHnkN1vuQyApjfUSu
         SfIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y75si166765lfa.3.2020.10.04.12.00.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J09Zi025016
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060H017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:08 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 05/45] arm64: smmu: Drop test for non-zero base address
Date: Sun,  4 Oct 2020 20:59:26 +0200
Message-Id: <f4e35ec4396ba4fc5b90a9280542ed8dc112b406.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Setting type to JAILHOUSE_IOMMU_ARM_MMU500 already implies that the
entry is valid.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 2564bbd2..b3facb8b 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -937,32 +937,29 @@ static int arm_smmu_init(void)
 		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
 			continue;
 
-		if (iommu->base) {
-			num++;
+		num++;
 
-			smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
-			smmu_device[i].arm_sid_mask = iommu->arm_mmu500.sid_mask;
+		smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
+		smmu_device[i].arm_sid_mask = iommu->arm_mmu500.sid_mask;
 
-			smmu_device[i].base = paging_map_device(iommu->base,
-								iommu->size);
-			if (!smmu_device[i].base)
-				return -ENOMEM;
+		smmu_device[i].base = paging_map_device(iommu->base,
+							iommu->size);
+		if (!smmu_device[i].base)
+			return -ENOMEM;
 
-			printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
+		printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
 
-			smmu_device[i].cb_base = smmu_device[i].base +
-						 iommu->size / 2;
+		smmu_device[i].cb_base = smmu_device[i].base + iommu->size / 2;
 
-			err = arm_smmu_device_cfg_probe(&smmu_device[i]);
-			if (err)
-				return err;
+		err = arm_smmu_device_cfg_probe(&smmu_device[i]);
+		if (err)
+			return err;
 
-			err = arm_smmu_device_reset(&smmu_device[i]);
-			if (err)
-				return err;
+		err = arm_smmu_device_reset(&smmu_device[i]);
+		if (err)
+			return err;
 
-			arm_smmu_test_smr_masks(&smmu_device[i]);
-		}
+		arm_smmu_test_smr_masks(&smmu_device[i]);
 	}
 
 	if (!num)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f4e35ec4396ba4fc5b90a9280542ed8dc112b406.1601838005.git.jan.kiszka%40siemens.com.
