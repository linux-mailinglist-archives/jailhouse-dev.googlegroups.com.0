Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBKXF6HYAKGQEGDQSQCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id C208A139246
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 14:37:48 +0100 (CET)
Received: by mail-pf1-x440.google.com with SMTP id k26sf6620032pfp.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 05:37:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578922667; cv=pass;
        d=google.com; s=arc-20160816;
        b=cvy836SPuqiqGprYYQMpoiVBjZStg91jO2+R3HhjIA1Ha3LcNCGQ1AahT06mf309S5
         e/8JRexYrNnTmtvIIdutIRNHPQxyunKUYgaq6/CThqGK4O5LDMq2qbfL8ed+tVHc9aLo
         X5A6kn3YJq+AooT3olgze6NaGbsLocxuE9IeWSxA4RSp7pNT510G3IBfoodzQVJts6+M
         1X0tdEYDEKmodumVsOHhL+pVCS2BaGWE6Qtvnz89EC/oal5YFMdZwTb75tux8QPh1gdu
         w8qxA2zFjhkCec2fbYmz1s8/kG6fgxkuJTJZbpJQNcM1WuaFBlw9GPT7+7DSQRftCExD
         rY/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=qK7ZiV52Gks5MNWmXTyvzChTbhX5TIFlDT/Eapcox64=;
        b=ZTjtQjkdcHO4F9AmFCMO2r9W9ARwmT/ckZUcdGgwnxz4X/lHCxeYpKFs6tEcRAfWOB
         YuAY/hoKs662XtWFQQ/CSdeSAcFJ8m26iQY/O17OHBk6tRGaL/XCKb2PPzd3pf3i6ktH
         AdSyrFMS2dnVdeXEPSwje2CPgDEEtXUBGZk8rdCA5bdFRpwPgInhIdRhLkGe3SXITtom
         x1I2iUAeieCXrHF1eegIdKW1QtemqUyCvggKiiHlYXUwhzEHKTiICucCSoLrGF0p1Mxg
         ej18F6KARlqgjYNeoGic3ShTgLSCshcyFaSe4ccUy92iGYubo/s1SEIhIWvuOvLKNxu1
         WnMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=PqJLJ6OV;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qK7ZiV52Gks5MNWmXTyvzChTbhX5TIFlDT/Eapcox64=;
        b=gvngtAkfut277WsOmx7acUMNCS9L87bbvubzBdQkmfCPS22fTNbefT8zeWcT7/VJcj
         LZeahACbhGMXKdX4jbxoTqngxx4pOcibkUfOkWKzl6eAaLHfWd/v1VqdFuN/OoSkzzFd
         iLLIqTG6xUct5N+2fNO+ha3J0Ixgxi+Gc0vadEXEZXq4qNo4mj2fZ2nBxlyL7y6g5su3
         XxTvloochNRNJQavNOsIzwDR/dxZjTCCyJv8seAiIwos1/qnoRIt57SLR5hb1IOqYRdS
         hStbAuDasgj/dAH+FUtlfyQyZGtJ3uF0U7SdA9si7CC1QyH1AfYQaBwxgmvqQsFUFwU8
         tFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qK7ZiV52Gks5MNWmXTyvzChTbhX5TIFlDT/Eapcox64=;
        b=pd7iTttmf0hhsBUDrB2lV9zAu9RlQd0WUNfKj/aoctLVs+2GBOG6haV4H7VWqdI7HM
         11yYrmHwIMHRI18C5MRXAYu8cXz1KYIvQ0k7Y7Qo24P9KPDNkCuWMCjC5HPMohTaTJhv
         BDLbfwDBAIypKMnoCVo3+lmyuJRbESOxYqaO2aXmqUQBSyKQWIYASNW9w0QrVTVnlORZ
         zKPnobTeKgpoNPTXZ9VbVVWSm6lXLnMBOXSNWWzTp8LfOg3ibmDqoO74urBLlv7rKGXV
         DJ9uZklwIPdnXj7qYASeVg56576mUQWdwtx4FQg2CFzQgYa2f2qbwbmbd1o51jWyBoxU
         Sm5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGBmf8UWYazAeXnXeTMigNUsfFht7f90YxaRw6KPoAZN3BXdHG
	vDVEAcbf76PhBVlewqx8+JY=
X-Google-Smtp-Source: APXvYqyL4axm625k7nCAk0CcEtUT/DDPS+5Sx2rn32W0xnzbvTpno4HXSJKedv5neasTJqe203eHdw==
X-Received: by 2002:a63:3409:: with SMTP id b9mr20859596pga.320.1578922666997;
        Mon, 13 Jan 2020 05:37:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:ad46:: with SMTP id w6ls4653875pjv.4.gmail; Mon, 13
 Jan 2020 05:37:46 -0800 (PST)
X-Received: by 2002:a17:902:740c:: with SMTP id g12mr14643527pll.166.1578922666335;
        Mon, 13 Jan 2020 05:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578922666; cv=none;
        d=google.com; s=arc-20160816;
        b=kI/GTH899NjcQODsNS6kiw3NEEeqKMPGdgnvyIjRpVmFSmPhOQK1hxuaYR4xjmaxRX
         6eQ8kokRQnPaquZxjwT9A72CoJ4IZHb9sLakpsxn+UCbdA93iOb1zfVaJ321VIFrBoWV
         y45GAOjwGNwiVO7T0YHzdwe/pcKnki0ZE3Y94wbeep1WvoOB5qqZRMO5RjK90AdczCiK
         IZ8/b9MiqijC/Yv+QniWg12aEI0BGOBbccEyRhFsGrQ+5lzjnGEPOYPWBfbkyBhW1x9U
         fBa15A8Zz+ytTK4rllKfeMnIA0MeYxvvEKaGakLoJmjWhOiTUnOh+AK0alUoZLGFZ6b2
         486A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=j+oZ+zxwzQQbL8BqvgUyymvgOlc4I+wvmnLT+qLHE3Y=;
        b=X2HFaz4p7sTLbErG7xC/e6WJBcflNu+f/sqc0AWOUnSTzq8OQxkIWalUVmC5TDhb5E
         MeSJ9XILhVFoCBuKmtOqCaC1T8nWHLE4q7N/PydPz9w3Uniyaq7HmDaoFGDwj6l5TuKY
         1MKLLQwTNSxgUvZNepnsu3mDM2wUeLC9vu6G1uhiq+AKssuqbf+eZ4dgYjDzou5nfdAL
         wu15GllddnpHqW48VxGmhHJJC+TegHEO4UjWdNVoZi4vF+jOubViULUNEi/in7kUg0yz
         EX08ZEFUsh3fXbVxZIEdY/CYwEzv8gjOAzg1BFpCGDtiykoaxSaZ/NoJa6xVfgaJuLtt
         NUcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=PqJLJ6OV;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id h18si355897pju.1.2020.01.13.05.37.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 05:37:46 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-f045d1f.ac4-iad.github.net (github-lowworker-f045d1f.ac4-iad.github.net [10.52.19.54])
	by smtp.github.com (Postfix) with ESMTP id 7FD9F661113
	for <jailhouse-dev@googlegroups.com>; Mon, 13 Jan 2020 05:37:45 -0800 (PST)
Date: Mon, 13 Jan 2020 05:37:45 -0800
From: Nikhil Devshatwar <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/aa7d8c-8b5172@github.com>
Subject: [siemens/jailhouse] ce9a66: arm/arm64: Move iommu.o out of arm-common
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=PqJLJ6OV;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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
  Commit: ce9a667714d92711b7950d32b8c68dc68088a72e
      https://github.com/siemens/jailhouse/commit/ce9a667714d92711b7950d32b8c68dc68088a72e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/Kbuild
    R hypervisor/arch/arm-common/iommu.c
    M hypervisor/arch/arm/Kbuild
    A hypervisor/arch/arm/iommu.c
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/iommu.c

  Log Message:
  -----------
  arm/arm64: Move iommu.o out of arm-common

There is no IOMMU support for 32-bit arm, and it's likely to now show up
there anymore. Make the iommu binding module arch-specific so that we
can add calls to the arm64 variant without affecting arm.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1fb0d740f3edcf17ed20302200aa849b12356e3b
      https://github.com/siemens/jailhouse/commit/1fb0d740f3edcf17ed20302200aa849b12356e3b
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/cell.h
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/include/asm/ti-pvu.h
    M hypervisor/arch/arm64/iommu.c
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
[Jan: moved into arm64 completely, fixed whitespace warnings, fixed includes]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b9c52578a5c4f6388b5c2a6dae8d09a6fa9d33f7
      https://github.com/siemens/jailhouse/commit/b9c52578a5c4f6388b5c2a6dae8d09a6fa9d33f7
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


  Commit: 8b517289b0e3da45ba72cfbaf94cf4a05b8e2574
      https://github.com/siemens/jailhouse/commit/8b517289b0e3da45ba72cfbaf94cf4a05b8e2574
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


Compare: https://github.com/siemens/jailhouse/compare/aa7d8cca66ee...8b517289b0e3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/aa7d8c-8b5172%40github.com.
