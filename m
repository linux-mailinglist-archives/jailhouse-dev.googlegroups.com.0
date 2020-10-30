Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2GQ576AKGQEDHJ3GKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id D22BC2A02A8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 11:18:16 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id c204sf1068673wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 03:18:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604053096; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZObsZZIRK0OKSMnm9KZT/cPkFzx1JAaBbWeoiixsA0/hPI44fM6tcZnfMYaFxTZWR2
         eJVzAdXgdSpHXrXirfG8F6brAhowZoJtkUpjUQmxOqsVPP/3T9JR84iOrTrZa6YRGScw
         85w54LZ2BUbskvsl7P0iA5AkBtK7TfqN9ZXqTOB6qtccC69T9BlnsXIq8nOTLt6Dyqza
         U5X7Sb9tQKpb5WVcFN6i0gOa6sIocM+kRUU9OL6pXp3xGAyDHjSiDAX6oOaoH0g+vysm
         QvOT/5QA9bCkiP9bTgjoUpc8KSn9bHkeLMFcUaFUgjLbKNntCLlCfuArl7HldeJvHcjO
         M0IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=lXwvWJfUiARVDtTnMeIn8UocAF828+krw9xaoMz39I0=;
        b=WkP1T+9oh/MztqxcDd05dCSUWzNrAYnO51H98Jyfit0QgM/rdiliSXqyQBM6opTAmD
         foi+/2C6R2yihJNiRC+RKpWEEsXvzcbRlFq0czZ9LdakWSEjPl4CFanehnqpIT8GlVWq
         Q9GXxQcW/U/ZKJLJJQ9O8yXOJhjWuuLF+b6pLYTIyYRhsftc2X3ep19YXvF9F3UbRrcp
         ttST8z4FXa+DLN7FfQ88qu7tynz8aUsvBbSxxzwK7swRMsDke+fZ8u9eBfgvKLcJB0IL
         nbbfF0qyf8WkdYgX8p8whlGdBvnMORQb1lXI682f/TqIxODQc3n7RViaABe8OHdxmO+Y
         BZIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lXwvWJfUiARVDtTnMeIn8UocAF828+krw9xaoMz39I0=;
        b=rZ0DAEr8cPvgrSQAGCbbK/mHl3+nCvBcD3yNR4omaBdZSFHFtIuUP9DNTRMhz76AWB
         TNu9zx1M+X5YDfPwFSLEeEP0anzsVQWTZ/C5vb48mf/83/b0SHzdIlsnVOMDeMORQXny
         a+jtKBvIieXOLdQJz0SV4R6XceImabte+oCP6ajzbSzIZQu6maUWUWuML5u57cm3XAIL
         acwdIWpMNqR7prGu/m7CfiK+IaHZDTNq/2/0u+WVYZok1nD4G8evUDsSVJeu9QGo6Fm/
         67KkFHGxknAyzZDF9pPkQ/uSEzYKaAn2/PbVK6dShOc2eZBc9cArpFJkwBGN8aLW+U//
         uuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lXwvWJfUiARVDtTnMeIn8UocAF828+krw9xaoMz39I0=;
        b=J+gnwa3SNH/sLFs1/8D1aCxje/WjcwesR1IyGWBGROkRvsZ71nZAcrbyX6RdEiI+e2
         7xdUunxqehEanm8PC51bNXsRJNmZ2ziRBjIQ82DKSM+zmMpqNVpwWXwy05iYD9WCVWUU
         HR1/zK28OnQh6fsBy0To0+jX745SaAoRygwBySIk2vozC1aC1xJpN8J6LS1hoFLhbQpz
         CYCKh4CFOSLRn0dHcyebzZwssXNQix49mUmVsF/wRCFfrbf6Dso7UIwn/Mvbe40iUbly
         tZSh5j4oZKKV0/PN7bS6LpTcnvKJV0iYAgudm/Jj1wfA8FV6/eqRLuqo39arVs0OAB8O
         bDZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53253JLxXgXNoLpEuu6Vn8wOw8JPSKX4+yvYBvFPvoS38g7NkUPC
	pXTrZAkt7OI/98dQVmadw6g=
X-Google-Smtp-Source: ABdhPJx8nktA7YdwuSmQ65GRS1q55QGh26IW2F3qIUYahP4mFYZAKTF1GjTmeasUJ+F2n+Sb1vz0OQ==
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr1799863wmc.181.1604053096576;
        Fri, 30 Oct 2020 03:18:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7e4e:: with SMTP id z75ls1403916wmc.0.canary-gmail; Fri,
 30 Oct 2020 03:18:15 -0700 (PDT)
X-Received: by 2002:a1c:4604:: with SMTP id t4mr1818677wma.95.1604053095435;
        Fri, 30 Oct 2020 03:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604053095; cv=none;
        d=google.com; s=arc-20160816;
        b=TQc+i1dBYFZR9zjESNnMQvDL1o2KDMAjDl8ahdOWAa2eEjuC0nV+4PtDoCVyjj8roT
         VqFYZyThszbz6ljYwltGqNZCtAgsK56jRT+zMabJAye+sx/jfXrl4i65kP9rbWKoDfIy
         bwPtbAlshs6TSJGu0lXGeF8pmHP++w5QS7es+IpysRW8ieQvpU5O6ChL6ma5NWlrS7Ck
         YEpvpepw+QXH7wwvE7H32A4VxWbZ0j/w5LQu6S2x0QuMErhnbsGTnUwXzXr7DrwyAUfn
         ZrBRl91CKo8HpqzKGLbd1gNO6fzZ278a60bo4igkrxUdZAYDWDzwEie8lK5pWYC7gu87
         4haQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Vf4MMLFqwNjlKqfQvBJAW+C9LW3Gnr4FsKKEIhC9fs8=;
        b=qmiNNJyjwdwSlu7nh4S8vX+vQ6X5+m2biXXXjLaLDwqawGy+Za3WZOWGeUuXHBgPum
         ulvje8S53G5v09xq5MltJ9fsM0AVga8kiWiJo5jAtURwj/hq4KCnXd8W0oGo2b8fgf13
         CBXy8d0TeU65GE2w2O5+E18S1y/2L/sNcACFUKfgBXZQUw6TCVcBDQ4SgXeHzE22F0Yc
         Q+rwnqdnzGDeejwV5M9TmT5HVqz/vXRP+n/gVQLamcUOOwn7RciDDIkDHPiLahUooJM5
         cjZOOJqzFTm9stxnkfgKO5fltSwLX8eZ0qouiCwxKfmSeNZY6Epum9ndKEoTYASn3nri
         GCIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w6si103772wmk.2.2020.10.30.03.18.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 03:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09UAIC27022879
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2020 11:18:12 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09UAIAPa005390;
	Fri, 30 Oct 2020 11:18:11 +0100
Subject: Re: [PATCH] arm64: smmu: Enable only on config commit
To: Andrea Bastoni <andrea.bastoni@tum.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
        Renato Mancuso <rmancuso@bu.edu>
References: <ac6d8f7d-371d-88ed-bcbc-509926fc5770@siemens.com>
 <6b1bad95-118c-4041-2044-0e8c4c44b905@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <870e41d6-8f76-1498-67f3-20062d1b28a7@siemens.com>
Date: Fri, 30 Oct 2020 11:18:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6b1bad95-118c-4041-2044-0e8c4c44b905@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 30.10.20 11:07, Andrea Bastoni wrote:
> On 30/10/2020 10:25, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> There are no tables ready during arm_smmu_init(). Therefore, we need to
>> hold back writing sCR0 until config commit.
>>
>> This fixes DMA errors during startup.
> 
> Thanks! Tested on the ZCU 102, the DMA errors I had are gone.
> 

Great, thanks for testing quickly!

Nikhil, Lokesh... bad news:
The fact that there is no arm_smmuv3_config_commit strongly suggests
that you are sharing another deficit/bug with the v3 implementation. And
the PVU does have pvu_iommu_config_commit, but it also flips
PVU_ENABLE_EN already during init.

Jan

>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>
>> Replaces "arm64: smmu: Do not enable SMMU if TLB flush fails".
>>
>>  hypervisor/arch/arm64/include/asm/smmu.h | 12 ++++++++
>>  hypervisor/arch/arm64/iommu.c            |  2 ++
>>  hypervisor/arch/arm64/smmu.c             | 35 +++++++++++++++---------
>>  3 files changed, 36 insertions(+), 13 deletions(-)
>>  create mode 100644 hypervisor/arch/arm64/include/asm/smmu.h
>>
>> diff --git a/hypervisor/arch/arm64/include/asm/smmu.h b/hypervisor/arch/arm64/include/asm/smmu.h
>> new file mode 100644
>> index 00000000..def7cbde
>> --- /dev/null
>> +++ b/hypervisor/arch/arm64/include/asm/smmu.h
>> @@ -0,0 +1,12 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright Siemens AG, 2020
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/cell.h>
>> +
>> +void arm_smmu_config_commit(struct cell *cell);
>> diff --git a/hypervisor/arch/arm64/iommu.c b/hypervisor/arch/arm64/iommu.c
>> index 805589b3..ca998789 100644
>> --- a/hypervisor/arch/arm64/iommu.c
>> +++ b/hypervisor/arch/arm64/iommu.c
>> @@ -12,6 +12,7 @@
>>  
>>  #include <jailhouse/control.h>
>>  #include <asm/iommu.h>
>> +#include <asm/smmu.h>
>>  #include <asm/ti-pvu.h>
>>  
>>  unsigned int iommu_count_units(void)
>> @@ -38,5 +39,6 @@ int iommu_unmap_memory_region(struct cell *cell,
>>  
>>  void iommu_config_commit(struct cell *cell)
>>  {
>> +	arm_smmu_config_commit(cell);
>>  	pvu_iommu_config_commit(cell);
>>  }
>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>> index 89631d16..911f50d1 100644
>> --- a/hypervisor/arch/arm64/smmu.c
>> +++ b/hypervisor/arch/arm64/smmu.c
>> @@ -14,6 +14,7 @@
>>  #include <jailhouse/printk.h>
>>  #include <jailhouse/unit.h>
>>  #include <asm/iommu.h>
>> +#include <asm/smmu.h>
>>  
>>  #include <jailhouse/cell-config.h>
>>  
>> @@ -238,7 +239,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>>  	void *gr0_base = ARM_SMMU_GR0(smmu);
>>  	unsigned int idx;
>>  	u32 reg;
>> -	int ret;
>>  
>>  	/* Clear global FSR */
>>  	reg = mmio_read32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sGFSR);
>> @@ -287,18 +287,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>>  	/* Invalidate the TLB, just in case */
>>  	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
>>  	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
>> -
>> -	/* Enable fault reporting */
>> -	reg = sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE;
>> -
>> -	/* Private VMIDS, disable TLB broadcasting, fault unmatched streams */
>> -	reg |= sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG;
>> -
>> -	/* Push the button */
>> -	ret = arm_smmu_tlb_sync_global(smmu);
>> -	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0, reg);
>> -
>> -	return ret;
>> +	return arm_smmu_tlb_sync_global(smmu);
>>  }
>>  
>>  static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>> @@ -512,6 +501,26 @@ static void arm_smmu_cell_exit(struct cell *cell)
>>  	}
>>  }
>>  
>> +void arm_smmu_config_commit(struct cell *cell)
>> +{
>> +	struct arm_smmu_device *smmu;
>> +	unsigned int dev;
>> +
>> +	if (cell != &root_cell)
>> +		return;
>> +
>> +	for_each_smmu(smmu, dev) {
>> +		/*
>> +		 * Enable fault reporting,
>> +		 * private VMIDS, disable TLB broadcasting,
>> +		 * fault unmatched streams
>> +		 */
>> +		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0,
>> +			sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE |
>> +			sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG);
>> +	}
>> +}
>> +
>>  static void arm_smmu_shutdown(void)
>>  {
>>  	struct arm_smmu_device *smmu;
>>
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/870e41d6-8f76-1498-67f3-20062d1b28a7%40siemens.com.
