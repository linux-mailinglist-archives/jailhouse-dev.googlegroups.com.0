Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIOH5H6AKGQEU57QLUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6429E397
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 07:39:30 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id j15sf846689wrd.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 23:39:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603953570; cv=pass;
        d=google.com; s=arc-20160816;
        b=VXmlzpWH5Rmgwwi2CJQmfBKx+nt1eJAeoAtnEd8J1G2j+V+HXAeRqZb49q/KvA7QE8
         Eh2iwd6GaL9HFp3iFkcY7OajCDsIHlOOOiyZIdgxTH6tYxlihEN20Puez1aEq+5FDhM3
         zqWNCYe9eAZBS1C70rIa9730d2cCQS+BzqgICmhmzGOn46QsDry5ZxFyfCvF/FyrKODt
         tVVh5HYrlTlXbcv4/MDtfH3iBCJWOfvaNAlKML8iPhIKg3XTW0mlj8SpmlzTrlSoFkIA
         yqJ9alP+KhkZX9+ifgFbdtr9WGWXPsSaHMoHwQniLbNsqnNnEH9rUZPc1/GsQ9qCnIus
         WSvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=VBAPGP/MfK2mYmqeI8zw9IqTz30UN3+gHDgQbiDzipU=;
        b=HKFrzHs2emvwpQUe7BkVaPw8ARda/RTHMlx6UI/y7kME0gJ4o0stdOm9fkLe/1hOOX
         n6Nw6gUZk/10gMxYmrbDXitiBii1SIptRAziVdsM+pSASr63HNkxBfeYTPFr9yjyvJ2r
         iVCd0enyX08ANA3OR51HLQINV8QL+VKdJBTkdc/F7glkxHHWK3D2gERXCOug8c2tOkbZ
         J1+xsOuzftPzE9E5ZYwwN+71iFIyy4W+1OaiRk/xionh0HFFi4gE6XE8ismYgS3c/om4
         QtX7EF1ai3GGoguYuLEF+gkwUfz269J6sH/ZJXsbvEdYHXTiljML4egZJEjt+f2bWqmc
         SQxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VBAPGP/MfK2mYmqeI8zw9IqTz30UN3+gHDgQbiDzipU=;
        b=hY4mZ+N+om+TGgESl2nIq+7KOklaAjjlu9ARkMF+2GGEVjpZ30hDYUCbqRou5MrsMM
         3KIX8dYavfEFrosSII8PG8gk5+DtayYlUA0ZCW11NqMJmzkHU9uMOXpK0F8vfKQQOPnl
         vULZ1HHcd+hzyUmwnOOlFQ3yVlQFwemYav8uaChHax0sQtbwbQXn8PdIkxEwX9eBrhbs
         HZcfmBxV7WoRUR407IZJx03OC1eZsgeQB/Evls1phtJ03BuC9AWTZLa/2zStafzGnXYL
         Y0MV8xgnYKntuszZTIM5WGLb1OC7aBecoyhQ1/D6x9cHNZYkgOotMo/oXjL/PTYg6PfN
         mVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VBAPGP/MfK2mYmqeI8zw9IqTz30UN3+gHDgQbiDzipU=;
        b=iswEKcrbU5sVm5XOpDubug1vlfNscsE9O1GBkSLO+BTtQnpX9tSIfppvQH+UIIWkNK
         ZAxGgGcFH03g0I39dcSzgCU9h8e75Y8Z4a87CH7FrWxVMoxRTUXMLnYxMpMkcWkcX3hT
         S0fsk8AeUp4yrNwGu9Ta+dtr9N1h9QIDxLPCq0fZUmLexfSwnMLbgUlGjezi+PUZY0pp
         H5izygnBcIZPXTd4oehy0sq9leRgZ8icO+j84vBPjxfUW4wVuRkVm4/PcIKurySeAhUa
         o44uhXnRYitbWvIMDv/gA3l24WmUAEHRg9qZMCEnULtUx+auGBWtiB7HcI+ZIh8ez8rL
         8eGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530jBDnMLpi/b1tCAyAG5YrZWzo8zkvjJHHBgXUDGpAVd8Ae5JZ6
	FHWgRgLdrutcOck6KOoWO9E=
X-Google-Smtp-Source: ABdhPJzdQas2IHxnpqEwOoiXWrhoqbnoIrN8K5NryvIOGxpwVyKdwtTqvj/sXy+2sWdwS/7JTpKkJw==
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr3730484wrk.226.1603953570251;
        Wed, 28 Oct 2020 23:39:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls1658936wrb.3.gmail; Wed, 28 Oct
 2020 23:39:29 -0700 (PDT)
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr3648999wrn.188.1603953569134;
        Wed, 28 Oct 2020 23:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603953569; cv=none;
        d=google.com; s=arc-20160816;
        b=gMmCH/zn+xSYR+WbSqQtzySI62zS34b/z1T0DfbiK03UP1hS2nGJtLG2H5sc0so5A1
         GmG1EYn2h2vQXFQMrMPE1gGrxoCmaLTVEUXPY136TWet5nk2lkNXtrSCdVDnTE5tt2sH
         7QB8GcQh+YLWBK1zMI4O25ePhoJIexK+tCE2VvsdmvNhQ+280MOBAsa1cYdLrSGStDVg
         sqA6eVVK4bnWPRsJ8iKHlM9vwa9xu7DrUEkY+5Ec8mKGxGz/0r39iQikEJIvLfhvybg/
         x2RvZHgeXdU6mD3immLF65uM8Idj278lfi6tK2kFJIg1vFdwDgtBAw2G359yMYXzqwge
         fU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=Vh1fpe6FZFe7xzpbv5i9wkfpUlvairRT4LbZpYITtME=;
        b=FS/21eMfzaxXn018OckeVuYo2gDUqFy5W12q8rJ/DEMRqMQE0L5Y/1nC2ff/kmZAfx
         uxa1kimzCnKKAAk+w/2dAVLPNGMgYoYTvyOyd7F5Y0mFEnMt2q5c5g5Nd1bTlOpoKLLn
         guEUNyhls6AfjCU5i8QAknkThj2epfcuyF1uWXeHchgoxcPXxSD6WBXJnsY1HxOckzPt
         Z+9hp4IXHvcZyu/89tuc1sYW9snhgtj2HposhLch2sSRU0k0DBLrUFYCiexQ6dsnNEE7
         nkputZ9yiT0q4DwCzDdXSa96xHs8OV2iBKLlZ/OxvsN74ddAROgbstPf7l1/QI1Hl5xi
         32mg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 144si27425wmb.0.2020.10.28.23.39.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 23:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09T6dSUO020672
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 07:39:28 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T6dQ6i018649;
	Thu, 29 Oct 2020 07:39:27 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] arm64: smmu: Detect busy units
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Message-ID: <c33525fd-2b01-a4dc-451b-f4f126449ac9@siemens.com>
Date: Thu, 29 Oct 2020 07:39:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This avoids taking over the SMMU when Linux is already using it due to a
configuration mistake.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Should probably be done for SMMUv3 and PVU as well.

 hypervisor/arch/arm64/smmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 41c0ffb4..89631d16 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -311,6 +311,10 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	if (ID7_MAJOR(mmio_read32(gr0_base + ARM_SMMU_GR0_ID7)) != 2)
 		return trace_error(-EIO);
 
+	/* Make sure the SMMU is not in use */
+	if (!(mmio_read32(gr0_base + ARM_SMMU_GR0_sCR0) & sCR0_CLIENTPD))
+		return trace_error(-EBUSY);
+
 	/* ID0 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c33525fd-2b01-a4dc-451b-f4f126449ac9%40siemens.com.
