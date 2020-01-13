Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZ6J6HYAKGQEJKUM7ZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A713912E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 13:39:05 +0100 (CET)
Received: by mail-qv1-xf3b.google.com with SMTP id j10sf6259073qvi.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 04:39:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578919144; cv=pass;
        d=google.com; s=arc-20160816;
        b=ACL8L/mz8rNG97WxxlCEVV+iFjorBoBJayX09BbMa2eTa1mgKfuGGVwK33hYGNYuhJ
         JBfZGb3gbSmiziTM7DKDOiiQ18VeN6r09TQ0TqUK4FY8x7tLy6hL748YO51S4w/OiHBF
         orTpwq51UqMNvi5EHihN9YH3gz2xxDv3ZrRk2r1C6r0XtSiEDTAX9eF00cYXxt7DyamL
         XPw5NzLrkYrEcQ9Axcizfdy6qsilRmRPvlnw+6VduK/9ZpaXyYs4S3i7twZZZm1Y1qx0
         inhcgcPn73ACZc4QN3Hhw5Ny9dHgLfW9hyModko/ywt/My3xadK0XbV3xV/MRPWQOhe1
         e0dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Eu+LGmwx6hjhFV7aVu0BG1/LAkjz2DHaGu8xmyfUGYo=;
        b=neTSfVKM7njEYyCzUKgOcP4g4x3/mqYDZE75fujr2eymCG+s32U7ZM/FVsXoso2/7B
         sDTyehdZ9bF+DqOk6ibYFrwyjXatg2ZxwTO2dAEL+duJJr4XHUHKPUo0Wf/I/yK+DqUY
         DiHVaLBCXvUTyB6SHmaHb9K2Qij2Jt72A2kW2nL/neE2rWkYs0C1yjKWE/8bj//nseaP
         1pbSTAwvYWxnXWWbTkcDKuwk3Nshqw4COFF7OLP1uYWnZ1ss9k/oaZtEPUyIMcqU4Hxa
         4nbOFvhTuV9cVkOMu9ZSqEGnbttGXz5sFVBsopnBCj66/LIUYik3fkQq0hkpjVzGk8Tv
         9deQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=GUfEx6dL;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Eu+LGmwx6hjhFV7aVu0BG1/LAkjz2DHaGu8xmyfUGYo=;
        b=kllqaCcYWHzrcEZ75Zgp7NLkdEqQ70fUS5H8vqzisqSLOX2udyEuGdGeipiH921w2E
         OttZMn4XpkoFRdx6XCU3Eb+sJ9KFOOTHqiifNaWvMAAzP9mQhLbPfskCZ8rxWtTUyvD/
         OJPJ1QzFFBLJEbaXHDHBmIeXtUqfH3yT68vEo4ZhIOl+kg1kc116D5Fo6gKzafa+hkU1
         QhqJUPq3pe53iknjm6artmS7sVdxMhl1yGIoO+4xKwT6MOYbZi0RAM2a1w140lN0kcJn
         rx1PO8pLVuwMC+XQGtk2XVcz4wu88KqxmrkSGYcJ8ld3slskRHH8dRRownrUa9e7piaw
         c6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Eu+LGmwx6hjhFV7aVu0BG1/LAkjz2DHaGu8xmyfUGYo=;
        b=Zxhx2+7UcTGUFA2oPc58AXeOQY6OvVJ/uzFMDHm1lKUmxEEC7HBCDfSl4L2fY53Kd7
         aVu6vQYkllrZ83ZlJQQjBIKfscQILZLumrcHcGcTlZ2NQDaHOhc4UmB54CEebAnBiLfu
         woCrnY/dY103262emtIS5wwiUDf53Km65g9SkLxpP78bCcwpS2UGWOagw0Kh6PPnOTVO
         IP+fBcL5RU4qHCIm7LqYEC3UIjTgwPBgC3jlQ31gHPfNCDM8UP6y5aOsxfF7zeprombW
         EHhT/hRVg7lUdWCIvXoTDZO5T2jBgJVcWRFEjQ96z6ps7nWBZqjwEY1BHSXwKp3UtvHD
         oKzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUc0gmSFghIvFahBbt2dsULAIR6o7lsKn3D88XXSPVH+ZRvNhRV
	XKdrvtuv9KoYqsEeiz/BzSk=
X-Google-Smtp-Source: APXvYqyfXGCPabmlz80y0KFgansuUdM56svPe+c3LamebZ42x6lq8DZbRUd4xs1OrFpv+sqtBG8u2w==
X-Received: by 2002:a05:620a:101b:: with SMTP id z27mr14836085qkj.241.1578919143919;
        Mon, 13 Jan 2020 04:39:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:19a7:: with SMTP id u36ls993749qtj.7.gmail; Mon, 13 Jan
 2020 04:39:03 -0800 (PST)
X-Received: by 2002:ac8:4693:: with SMTP id g19mr10314475qto.295.1578919143474;
        Mon, 13 Jan 2020 04:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578919143; cv=none;
        d=google.com; s=arc-20160816;
        b=U2j4vUHthg1Y8IgpPfC8eaw/1WdnnbsYU4MV2b+JSYgz5YJlVdDjOKYbhPlag1nTLx
         B/AEVs7R8rYG7JS0lALzLjepqVMi/it0ZvTkKtCxH2wt9Rrwx08rddBcgs8NRbiyWRre
         /5v0pjQPWijIjAF3GXi66I2EtYp1i4nbzs9EMiBW2ZXq8afKXgegzSs5uu0LVuNd72tn
         OMpeMx1CyGtsFa2+vwiM41M9jhadnfqS0g9iwiizrDryGS/iExNqF/8eYp16zNBjIGGL
         Y7XOplY2e6CfoO7V1CIS2JBtseMaj/WHPzDehFLsD3u5cWjx4B9LndAnsHi9XRzL47Fn
         E88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=5wnRTXcosUJUW8qFxsaJSn414Qag70mkyu5dgsCgFEQ=;
        b=l6uCQCkLmR084COKWrByzWa7l4foW1p0o4J38d9s7MbbRP09l75awwcn7flAC8YjBN
         VcWNh6qDssWVJJpKQQTMAn0MvaaKYsW/WjW9TBGlxnLHrT9ta5H7xHW28G5/d9Y0KDaW
         JLTTXFNSLevs5xEaoS/vn+a48ov8L15DL/ZukhA9ypHNCg499ELTq8kGIyq3FYNppVBR
         j6RKJsew0kLZt2lkWmmPoEZ0m5BRpe3G/ckIjZoB04JOcysWypuOC5qnjXcY9yO0tOIS
         IwCMl4X8V+cO/ogeNXn7y8YRQO2o/cKTdVIsx4t+axIPKjlXxG+e9skPPTOg6vd+dB1Q
         RvLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=GUfEx6dL;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id i53si502457qte.2.2020.01.13.04.39.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 04:39:03 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Received: from github-lowworker-e8b54ca.ac4-iad.github.net (github-lowworker-e8b54ca.ac4-iad.github.net [10.52.23.39])
	by smtp.github.com (Postfix) with ESMTP id 48ADE96045A
	for <jailhouse-dev@googlegroups.com>; Mon, 13 Jan 2020 04:39:03 -0800 (PST)
Date: Mon, 13 Jan 2020 04:39:03 -0800
From: Nikhil Devshatwar <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/89712d-aa7d8c@github.com>
Subject: [siemens/jailhouse] 05b632: core: Update cell_state while destroying
 the cell
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=GUfEx6dL;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 05b6322f057a4091be5323e33cec02c129c6006a
      https://github.com/siemens/jailhouse/commit/05b6322f057a4091be5323e33cec02c129c6006a
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/control.c

  Log Message:
  -----------
  core: Update cell_state while destroying the cell

Update the cell_state to SHUT_DOWN as part of the cell_destroy
This will make sure that the memory_unmap calls and unit's
cell_exit calls can see the correct status of the cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3fac413f064777bd25972e09f3020aecd1fd070a
      https://github.com/siemens/jailhouse/commit/3fac413f064777bd25972e09f3020aecd1fd070a
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M configs/x86/f2a88xm-hd3.c
    M hypervisor/arch/x86/amd_iommu.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Move amd specific fields in separate struct

Create a union for all vendor specific fields and move the
amd specific fields in separate struct.
Also update the amd unit references of these fields.

This is to handle multiple iommu devices and their custom fields
separately.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: adjusted f2a88xm-hd3.c to new format]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cfba74e4ab51fb34d901183b7c78c6f4c2ea0aaa
      https://github.com/siemens/jailhouse/commit/cfba74e4ab51fb34d901183b7c78c6f4c2ea0aaa
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/cell.h
    M hypervisor/arch/arm-common/include/asm/iommu.h
    A hypervisor/arch/arm-common/include/asm/ti-pvu.h
    M hypervisor/arch/arm-common/iommu.c
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/ti-pvu.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: ti-pvu: Add support for ti-pvu iommu unit

Add support for Texas Instrument's Peripheral Virtualization Unit
* Define a new IOMMU type and extra fields in the platform_data
* Add new cofig option CONFIG_IOMMU_TI_PVU
* Integrate with the arm iommu support such that multiple types
  of IOMMU can be supported.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fixed whitespace warnings]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d0f06d838bea15b77acc5046065ffb1882d2885b
      https://github.com/siemens/jailhouse/commit/d0f06d838bea15b77acc5046065ffb1882d2885b
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data

J721e device has 3 instance of PVU which can be used as IOMMU.
Each PVU has a config region and a TLB region where the memory
mapping information is stored.
Describe these as part of the root cell's platform_data.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: aa7d8cca66ee8137a4e3666dd98800b6728dd2ee
      https://github.com/siemens/jailhouse/commit/aa7d8cca66ee8137a4e3666dd98800b6728dd2ee
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU

Add stream_ids for peripherals which are behind IOMMU instances.
PVU and SMMU-V3 sets up memory mapping for all of these contexts
for correct 2nd stage translation.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/89712d8a4ace...aa7d8cca66ee

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/89712d-aa7d8c%40github.com.
