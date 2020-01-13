Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB3EV6HYAKGQELVYG6FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id C9449138F83
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 11:48:13 +0100 (CET)
Received: by mail-ot1-x33c.google.com with SMTP id d16sf6155345otq.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 02:48:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578912492; cv=pass;
        d=google.com; s=arc-20160816;
        b=keEKlX/c+KNFzDeLEs6yHqZISYCK9fopfXx6zBO/GvUJqbNQouMJ5py81kHx3YkYfM
         HgnuK8ajgxBfmczSD2DkOTcGr3P7sRWldl03aE0w6tKEb8pNjLDfHPfB8q3TRLq1oUXC
         iyiEIdFbTvheSmH4sGgmPshH6BF0rk245GVPABNWrgjpaZPNojdD3sXMKR9ThmEqjyzz
         jEO61yxC36/igJvYhKndGGsuQ1ZWFK6R4LoEY63I6h85FT5u6y2GY1ga0xrwOqhGYgGr
         jNW/jZH/mPQ38CJAiwumipDAKI5gk6a0bWM6HrI1mBAM/JYCQSHVa1zL2ZWGHldueimQ
         IpWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=peXreTOxp/j3sjskAdfr8soyZc8FtEYVXTdTQnimNnI=;
        b=Z6HETjoGGcSOGee1AeaoN5qf2sgCNDSLtKPAZYfUvt554xlIZu2qVkAfsqDO1uMh3l
         246gv3BPKEi73fm++6hG3ua8/OpiehD9Puu4IqKeMAKVOF1u/0oWOjq2idS/0Q92Ya/q
         ULjYw1ohIlnsVd3rfuXWJpVvIO6jasDqvGF4uBgdVxQtESbuSpFBrh334YRLNeqi0Jgl
         Sjmr4Zkx9kNGf+JNuf0jY+bAMVfEI4NoGfSjQIGaMRccXjho1ovH/VVfadBtvlXGhlle
         8leLxEf+DIwXF/10tQBMuHocO5LheoFSS1NXga5xW/seEUj1+NKIbHhlSg67HaBbwb04
         gD6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uv9YtMS0;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=peXreTOxp/j3sjskAdfr8soyZc8FtEYVXTdTQnimNnI=;
        b=pQg87gHwzY3iwSiMUjszQBpXZ9Ghx2CGo7JhjKrCgOMvTC07Rk+dxQAFnyO6VFGAfr
         mBBtDbYavYH7mP5tIIB01I5CR2p630g4aVUloG9i/O1pHU/CFVmkx9vhg+1Xmjtp+qeR
         PXpayT05IAmiiMOQenlazLh6qtn8uY8bEMlt/WI5OaHeW8jRTflwmIul2ROiEyQVu0/1
         kX/P9fMw1Oag1dmD7a0pNElGS26e/8xwTwvmlecack2MgO5be56M2t223MmlwJG3XUKw
         eZvvQQ+gzmQooLVJ90PBRNF9DFDJ/EXWhLFSnMD5bHJ2E6FRjhJuXjNLQp3/28N3qWCa
         eiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=peXreTOxp/j3sjskAdfr8soyZc8FtEYVXTdTQnimNnI=;
        b=KesKdWHuQbHlAB7HP8jw5yxvaqf4aZ82LiTOcdDTIfGLaAwVRTSZyGtNIAewHed/lS
         SvJA0FHxsI29HfQb1L8TN2njY+KtP7Tne2fSU4ZQlw9gLZVkI8oGVAmV80HTj60MAeDL
         75yQ1m9n57INH3F4YsAGMDC2dfaYNU3bFNj5QINAVrlJoVTB7dhhqSSgvP5XLnHst1u8
         SyzYXRcNSP5wKNiBOz4Ms7j8+0EHTy1JP0oRw3zEwvBltvUKmFaGrmY+oOuMbNBEazAP
         ikOM/03YkBMjdRkdGCjt2eeKSpkW1cWaqM3aWT1rcJ6/aBCNGIjej9ykfErtFN+jJfFP
         BQjQ==
X-Gm-Message-State: APjAAAXL6LSNns0kPJFv/JKGyqQbpiBprtZ3RcfBymexPZQFsSwUnO1J
	UwB+hLywsdNMBuinDU6vNj4=
X-Google-Smtp-Source: APXvYqxYONqU9TTJVfjXEntJ06YXw9+6aeHH3kn3/X9zuGCvfEuXeAOWeVgkOIf5kaYBIWPaYiE6+A==
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr12090042otr.178.1578912492482;
        Mon, 13 Jan 2020 02:48:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5482:: with SMTP id i124ls2033334oib.11.gmail; Mon, 13
 Jan 2020 02:48:12 -0800 (PST)
X-Received: by 2002:aca:481:: with SMTP id 123mr12409740oie.110.1578912492080;
        Mon, 13 Jan 2020 02:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578912492; cv=none;
        d=google.com; s=arc-20160816;
        b=wseB+BSd0XB4b+wHDrTnurpSHqh99JKeWXYDqWzPShCuLa8exjpalNnI+ZWYVMB8Uq
         g++UFAPxUgNujz9Z+6JCJCadyqQSAnN+H9j+nggdx8hjYwcNPbNaAq7u1o4wnLfa88dv
         PklUHGP3WngYWXi4iXV3auU630J/tNTAaonX8dVEynaBENltcsInIU7nSMeQ/G8cMeEX
         giheDA/Py6w5elIV7J2lOSknlLOkrPCjOctPfQLzstCndGLTaObWcFV1XZSaBCRMkO3B
         JD/7GlhC5iFHmMT946tFbTQXTKKruGM8pO5nTyV4+VpVV/BnsIGoxoMHaaMiSE6bRych
         aGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=f8FXyjtK9byrHjJXHQT5mKeR+84M54aVdXpL7KWwsGQ=;
        b=n3kgQ9/ic2JUvJnJuxSVMIM9z3LiPQcO2qKmWPsrj44YRKDYoyg4l0945Sz61uye77
         5CeMnxOTCjjEQ7PDg9GYVjOTYY37JWX/dyWbHcmQkQ5AYjNz+eI9JSB7s9svkNXRBS/+
         uALU49TuwRxBeWiYtvSWxAKD0ihdhZFMRFTb1qwJ7AP0LP5oSOyxy/DB5IGS/W1EBDRG
         KFDSHfkxkXt7o0b9J/qaYAUmDIDd2iuHjl0YFtboeKyd5IyxgvEqY/e3m8zuS2CHkNGB
         0FYCSQJ+A/MD/rnJnXQ8KY9I43QoGeXpuoSy99vS/7+rO0m94ULY5EJiGxsz7l1DEBH9
         symQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uv9YtMS0;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id d16si450758oij.1.2020.01.13.02.48.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DAmBUG043871;
	Mon, 13 Jan 2020 04:48:11 -0600
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DAmBTg123636
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2020 04:48:11 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 04:48:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 04:48:11 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DAm9MG011219;
	Mon, 13 Jan 2020 04:48:10 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 0/5] Add support for Texas Instrument's Peripheral Virtualization Unit
Date: Mon, 13 Jan 2020 16:16:42 +0530
Message-ID: <20200113104647.25884-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=uv9YtMS0;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

This series adds support for TI PVU as an iommu unit.
PVU is a 2nd stage only IOMMU which provides realtime address translation.

J721e has 3 instances of PVU and all the DMA traffic can be routed via PVU
when running inside a virtual machine.

Nikhil Devshatwar (5):
  core: Update cell_state while destroying the cell
  configs: Move amd specific fields in separate struct
  arm64: ti-pvu: Add support for ti-pvu iommu unit
  configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data
  configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU

 configs/arm64/k3-j721e-evm-linux-demo.c       |   7 +
 configs/arm64/k3-j721e-evm.c                  |  36 ++
 hypervisor/arch/arm-common/include/asm/cell.h |   7 +
 .../arch/arm-common/include/asm/iommu.h       |   1 +
 .../arch/arm-common/include/asm/ti-pvu.h      | 129 ++++
 hypervisor/arch/arm-common/iommu.c            |   5 +-
 hypervisor/arch/arm64/Kbuild                  |   3 +-
 hypervisor/arch/arm64/ti-pvu.c                | 580 ++++++++++++++++++
 hypervisor/arch/x86/amd_iommu.c               |  26 +-
 hypervisor/control.c                          |   2 +
 include/jailhouse/cell-config.h               |  18 +-
 11 files changed, 794 insertions(+), 20 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
 create mode 100644 hypervisor/arch/arm64/ti-pvu.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200113104647.25884-1-nikhil.nd%40ti.com.
