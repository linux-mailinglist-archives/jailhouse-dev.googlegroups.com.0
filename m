Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB6HSVHUAKGQECGQMMSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD654C07B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 20:05:45 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id a17sf8218989otd.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 11:05:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560967544; cv=pass;
        d=google.com; s=arc-20160816;
        b=dNAAgMXjN00YVojNViI68G/nuqPjw6rTH+7phcgKnj73NiggaxDXrPEywWutCSHlTS
         CMY2Sl4574aiLX2PpSngDl6XuFrxWbSo4yNpYOW44QhDjDRYhWDoVydbjrTAya0RDTVf
         QiZwxnDFG5T9l2CjVTT/WTR5ac36N/j8hoMXwuyBdGZs26UaJyUG5oVIIW1CnuMfZEem
         zci348Tau1KGmDeNwEH5C7z5Ek6kjwV5ELOWu0ukc4NRRg/pb1ihiCT+V30IO534MXdg
         xifYh4SaXPxZ1saug4NFxx89k706nDCVgEIDJiNhG1aN3rVRUrFxOunL8ITCDG59H1oX
         moUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Q1QPSYMt40ts/Tc7ULb+5iwFgPPtFGoZ5kFSyVJqjDM=;
        b=OFm8/XKagdGloRS2hX4am66kc/o9HVuSRqp8zbFqpuBL6uE1wjxfRo8IETFYv3KMqO
         K255JjdD9JHVLm8sxkQlJ9mGeZMQvND50slM34OYiRBTh6oycGntEl4I/B1PY+fYxir6
         rFXy1JHQd5xOkcWFJoBoMIL2X8JCj2cBJCqK+TJN+W/B1LWLMgrYzxNYfKqtD81poCah
         SLfOanQDE+qIQXCE5lKlPdnQLbBgD29dkO6TO8KM5E/EqlmIKzsWWMDj/WmLTByFkb8J
         cvHtRciXqE9nBNrOf1BXqkKzkNshU+6gm2B0ihv+XqPzkphPU1imMsjt8fJiNuXTLQ+t
         DxQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=fL6mafnu;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q1QPSYMt40ts/Tc7ULb+5iwFgPPtFGoZ5kFSyVJqjDM=;
        b=F9HcfkCO0i6irefKZ6p46hpXKDapH64HgbjNsYlGO9sXIaTUI6yaALkZV8C5VzZFVL
         R3+VSeZhWv8Z7R9z0KRwxyyQGGXSxOBO5tr+Brnah8PL9Jece7ArQOkvtPHYJqQaJxHg
         akmHJO8/cpEExX2T0FelNR6FGgy89WXp1iu2QPE9ODNjvMULCLAjNKCE13ekswOD5roF
         MPs+jFSuKNc132p3M3hbXfNqB3Mdri9o9Itb1AKId2YDkzsQGsVgudWB9ybhtJccUcEc
         G8agB++Kwf78VK6DnM+kBQs+XKa6L9u/tg+d/QouM+K9eZGatVz0kE3cf9PrB/HSwhDq
         lPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Q1QPSYMt40ts/Tc7ULb+5iwFgPPtFGoZ5kFSyVJqjDM=;
        b=nwiWP0P3wig5I2x0l1W8ucvCqE48gMpAYAU+FRnJlM3NgTXPDaaLPMPl51xc5zLH0u
         0f+E+G8Wanh4PRmGWfWo/iY1vJwlFVBvYUZIA2jpydTQE0lgcQ2Hpgoz69Jz40uFwHu7
         VcOJ/mmkm53Os33/cZ7plfz4yKnkljiGgwSQijmNaO1xNiGrevLGGLz8CowsFlQDKXj6
         LxmoQnRSMSolMR4Rb6Eaw6T9/XXvCRLi2OfOsW4PCLYFFY+oOi3HXcdiGDrF8VbBsHRq
         z5zWQkiUMJ7MJ4J3316q7eo8/FEwFeObizhLxHOxrfdil2MfscO0j8gUe+m/oVvTl3jR
         tykw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWZoHdtK8quojRYB7twZ5bLWFOXydWFlENCBVbcshW7xRkCbB1z
	t5DkwrXddlkVO88Hw+nKWP8=
X-Google-Smtp-Source: APXvYqzHn4CF1ikVGtjXFQ4oM6KyjuElDWEwPJ46b27ephYSVFFX74myJZxLCzNvB7YRXHyOq9dmMA==
X-Received: by 2002:a9d:4f0f:: with SMTP id d15mr11429567otl.52.1560967544252;
        Wed, 19 Jun 2019 11:05:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:71d0:: with SMTP id z16ls580407otj.2.gmail; Wed, 19 Jun
 2019 11:05:43 -0700 (PDT)
X-Received: by 2002:a05:6830:108d:: with SMTP id y13mr6318026oto.255.1560967543852;
        Wed, 19 Jun 2019 11:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560967543; cv=none;
        d=google.com; s=arc-20160816;
        b=R9gBSL9SjIvSFq7nMHZTm4dK4zjXTsYZaHfreDcERd44YTLJyFf32lG0y5veHYYHzK
         GMpxWF9JRA0aotWsD6aIaWEEp8708TWqRnqaNy+KqPvkAwff2jdYpM/gmwzNdjxwB3Nn
         VcfQ3VkDlJPiorPgv+748oHcUVjbm8p08+leCSvH4NIOKfImf1aWoQ45WmA1RGb7/JXI
         EAg3pr7UCgrpXyWEE7vlB4PcrnDDQDy1zM0LB3GQ/c0yQIM0kj7GY8e4ofGkd/JMVZcL
         gpHiQOIxqk6ngSNUfECuu5e1545QRFbQaIHiLqeL1895E7ebcjpUnaRCf/gLVpeY8xcv
         K6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=6eOmz3noJ0Gz2Z5AYOCNRj93DtC6i66zBcz3PX6QkW8=;
        b=xMMvahjbfd9Y8D3+PsEenIDuuBa8hnBb8SVUwUjR7Rp1hARpixCYZ5xxXyn6GOUW+O
         6W4H1LX/00leFonMDQszrEx4LOOO/6U3V9wAtzMJB7ybvr+mJMK+Q5csTcWkI2OC02Da
         TzfOH2Dg7933lnWaUhPE3LqT0yaTsN2j3NKGKpBT8P+Mbw8YNaaANdPcCXGdmN5JmZTl
         ELoPyD2+T5JjYYkM43LRCc9SuiebWVDvz99oaVkRiOEO5DZnOt/KBS0VSS8DHD99LksZ
         IOdm12pzfQQ+13imfe3GBgBd7Nxo5OmTxpLIMX1oPmj9sRSRwdR0vApDKrviYxk0B5sI
         IpKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=fL6mafnu;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id n67si920248oih.1.2019.06.19.11.05.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 11:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Date: Wed, 19 Jun 2019 11:05:43 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/31f8ed-dd6efa@github.com>
Subject: [siemens/jailhouse] dd6efa: pci: Replace mmio_write64 with
 mmio_write64_split
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=fL6mafnu;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.193 as
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
  Commit: dd6efa9840fb5455f9880ec16522fa50a53db9d4
      https://github.com/siemens/jailhouse/commit/dd6efa9840fb5455f9880ec16522fa50a53db9d4
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-19 (Wed, 19 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm-common/pci.c
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/mmio.h

  Log Message:
  -----------
  pci: Replace mmio_write64 with mmio_write64_split

MSI-X vector tables hold 64-bit entries. So far, we used mmio_write64 to
set them.

This conforms the PCI specification: "For all accesses to MSI-X Table and MSI-X
PBA fields, software must use aligned full DWORD or aligned full QWORD
transactions; otherwise the result is undefined" (PCI Local Bus Specification
Rev 3.0, chapter 6.8.2).

Nevertheless, some vendors don't support 64-bit writes, e.g., Broadcom ethernet
cards (BCM5720). mmio_write64 stalls, and the transfer won't happen.

Replace mmio_write64 with a wrapper mmio_write64_split that substitutes the
64-bit write with two 32-bit write operations. This accessor first writes the
upper 32 bits and then the lower 32 bits.

Credits go to Jan, the root cause of this bug was found in a private off-list
discussion.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/31f8ed-dd6efa%40github.com.
For more options, visit https://groups.google.com/d/optout.
