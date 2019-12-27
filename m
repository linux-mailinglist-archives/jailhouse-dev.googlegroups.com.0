Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZ77TDYAKGQEWRTKMXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3a.google.com (mail-vk1-xa3a.google.com [IPv6:2607:f8b0:4864:20::a3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39612B627
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Dec 2019 18:31:21 +0100 (CET)
Received: by mail-vk1-xa3a.google.com with SMTP id c1sf10495288vko.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Dec 2019 09:31:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577467880; cv=pass;
        d=google.com; s=arc-20160816;
        b=co6OFxmWrQif7ERtn3j6tO8JuUPG2aiCL+/CxRjoUZsirsQ82UN8jdKzGqay7t37Z8
         tcC3f3FVxWtycfuV4o92pEPWVguxExWtZdL2Alu78YP8W6qSorJUYaJ9QKzS372LvMej
         Z6UWnKIwW6FzPG+Vv4UU2/PchRPI055QfmwRdglPgx0hsaOHTwSMpf4ERvhjYeNgcxRV
         /oY5JQMZc/rXLxwd4GpYtY77Ta8VZK7jmC/H/rvad+lZ42c4DAh4/zfD4bICWsN0Q4nV
         0zZaFDPBlX2G7pOK4kz1DAKsNvKqDqXi5GynlQ+kKk/6lkOk33wlYJKLN8KoUhAAI0Ks
         bTwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=591Czylo2oFJp13hxZJMAxC5rImsRwC82Snm/nuECaE=;
        b=yl9LM8mixPYTrR3GieNKHNvRLGShCnfErG9rdcREXsOtez74/Kd+C8HSOC+igcCWVB
         aKEkrQMUvoYs30tpszrg2QBXjradKEj7fqvRHykr3wQCocBFMLdNlsX3g425IwwJEOws
         LDpzNHX8kGW+AUYpTH/mHnqABMfFtYtPCOxRxCHYy2KXFepjqZQACYl7i6MhK3WD2vZV
         XWLKE1XlJza4Qbz61uK9zsS1ogfGnTCPc9A7NWzD3L2R0I6lNQQQ1DY6l4l19FawrQ/7
         Cc8K+J+XOJQxnMQ1CSPkYJ/dwSAWWWqMVjazX5pHQixZneonZGiL9Qsopvw9Eqb1uLQ7
         ht2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pN9LqtLw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=591Czylo2oFJp13hxZJMAxC5rImsRwC82Snm/nuECaE=;
        b=dV90XjvWAkbhKdWk5+5bUDXxZp2/OfwPcpWaFcxDPcM+VLuwErlRa9Zy7rSFYVk6TZ
         vzjNK1XxyJ82UrJzbrP+ll7kQjT/DtqfpPLDnliaJzmNK0IOBqjow19odN5VxFMDEUBz
         aKABbphVZYMazasdcKkEMCyeuT+T44EfKDuA9eEtnmWQRCzs6UhCJZ7okZbC2j6n7EFE
         4au91B7HOtpFmKNmmoF5H/86iMZL4mjb/ZpANXy43NjD7vrR5PdFCw7Pg6JPYzXkNjUQ
         DgHGaxeI/yaLBvdBI6AmQQx44aKDaEnx1M1pDFthLWZQIi9tnk5/uJgOp1fzjh8U3WuH
         qmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=591Czylo2oFJp13hxZJMAxC5rImsRwC82Snm/nuECaE=;
        b=f9Uf6DnO/mwZpMFDcWtLb/y1Ztbt7lNzdqTPV2QVXsHydSkzNGZq+T14e1AUSZ0Pq7
         CA8ObbWayp67BM363wtRV969OZZ46eYry/jZ5OVbsFfx1YjUm+ZGcwqcNUviHlr5HIcg
         pavp5C5s25zT1Jv28KHmjbGJRILD71GmYfn7u/JAJoR9bDUe5As4gj4wticKC6Vq0UCx
         ghqz82rqiXnruwY0ye52k3rm4VeSnkkoIrhAn4BLpbQro28QGComwJm7XdF1XySHJ6K+
         zRLamdYRqHs2cgwlt6ZM31kuJNrvSbrsC/wNV9/NQvEiBg2gfeBOuNnqYb9AwcSXEN9X
         A71g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV/m5O8qo0g4qTHdqoKQ9LF3eiOAqbyMHl48JIBdXdAsbDjWIwS
	3ObeuBz5okfKXSyO0J8Gkj4=
X-Google-Smtp-Source: APXvYqwWRJUhTk+QiSVL8FPRz47kZUl0PAyOR9RWe0JUT7v1w/FPHdW/bE4SDdmU7SJIY3re8sOT2A==
X-Received: by 2002:a05:6122:14d:: with SMTP id r13mr31444374vko.21.1577467879901;
        Fri, 27 Dec 2019 09:31:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac5:cd2a:: with SMTP id a10ls1088759vkm.4.gmail; Fri, 27 Dec
 2019 09:31:19 -0800 (PST)
X-Received: by 2002:a05:6122:1066:: with SMTP id k6mr30098267vko.68.1577467879275;
        Fri, 27 Dec 2019 09:31:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577467879; cv=none;
        d=google.com; s=arc-20160816;
        b=nefc8iP9DRnT+UEv2SThAHKh78ZLts1WvYpmG86K4T1Mnb+9AwluX+Te/0Cq3VFU7V
         UGg5kI1tTKDsk5YDHPCH5P4fhbkaIP82ciBBNQi7L3hnOSqfJADbyw/14iZOx3oLHstS
         R54pnRtnXweZ2fBwx/ocS2pzsHfE/LL3OI8HBtrCYwWcMQhYl5TlSUA8rncimNbOjuja
         88elpfCbYxfCJHQJBCbLaoToNAEAM4o+bKldWpIRPIWMp+xPqEwMfXgi/dE2AyokiSJW
         4nZq6w+FJ8rmhhM4AwJI99y5W4FSVF/b5CSsgirpI1JlPqAtHFeSNb9MupRUzQDSL014
         Lsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=useOMmNRA2H0ScQCHvselmW+leT9FjifSwHX2vZ0Y+E=;
        b=xJbcrXPcW9lyq53brMEXfHEuWNDVc+mw9c+36mW8QZKBgNXkT+pp3a/xI380+21U9M
         bzAxO9aaZCSlX0YbB5Vig4llYk9/paKxNAM3JEYSBUvAH15f0RFg8BXMWDzZIV/3aePm
         ZVO1DF+nHsZK6s2GqiaKPk+z/QSiznMZlbLHlQ9wFV+FJhaY06FBZb/Gm7L4DB7Lfs3w
         h7kUMN5idHBPLvy/Wg1PEpsHB8ck7zYCFoC0Yz05Z+4G0yZCeC/2IQhMwXdISs29kopo
         kouwiEKTXZKPPhGREW7jkRNr1cXYXL+MKyuyKmwVhPv8JXgnNfRxP76wb1q7TnCYi0uB
         qv6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pN9LqtLw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id o19si1643799vka.4.2019.12.27.09.31.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Dec 2019 09:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Date: Fri, 27 Dec 2019 09:31:18 -0800
From: Nikhil Devshatwar <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/f6c4b6-ef318e@github.com>
Subject: [siemens/jailhouse] ef318e: configs: amr64: k3-j721e-evm-linux: Fix
 GPIO failures
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=pN9LqtLw;       spf=pass
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
  Commit: ef318efa0a1f70c755196884d8317940784f63ae
      https://github.com/siemens/jailhouse/commit/ef318efa0a1f70c755196884d8317940784f63ae
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j721e-evm.dts
    M configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: amr64: k3-j721e-evm-linux: Fix GPIO failures

For K3-J721e devices, gpio virtualization is achieved by
replicating copies of GPIO controller.

Each cell gets a dedicated GPIO controller. However, there is
additional field in the pinctrl to select the GPIO group.

Add the mem_regions for main_gpio2 and main_gpio3
Program gpio_group in the pinctrl node for SW10 gpio_keys

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/f6c4b6-ef318e%40github.com.
