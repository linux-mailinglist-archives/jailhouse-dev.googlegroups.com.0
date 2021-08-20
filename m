Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB5MK76EAMGQEJ2LS7WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id AA03D3F2E97
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 17:08:43 +0200 (CEST)
Received: by mail-qk1-x738.google.com with SMTP id 21-20020a370815000000b003d5a81a4d12sf1456423qki.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 08:08:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629472117; cv=pass;
        d=google.com; s=arc-20160816;
        b=TGJg+YhAjKyw2fuakTGoDwmKWkCnDKTY6/lr0EITkNM7H8SuYIKX/I2RQ3AE4pGmqT
         YHOJ42Jik7LmdMO3Xy03hMrMj8pJGFaH/xrqWyzAKfJs5Qip0BgVLtKMGiTL2ForH8cO
         aIaQmFccu9/vkB3/PdQFT1/7s6xCVMzvb3nodDHuSLWMIHP6+3TT5EhZnSn3tTGHoynb
         4t0Maod5MUZWxqJkrRKnP4YjX8sYAZtaLTsbsfdVGm9qK+n4Vr9+As6zVbgJn5pv7QQy
         X/fb7UQgcnldAXcR2F3LzJh+GEdh6vF/DlmfwYqG+NlVPnBAoHZQjQgYGyQ+kycvdMTa
         AcFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=VzcpmaWSQ3g2qMkm/Flfl0ZAFT9ug15TZxp73fZewrY=;
        b=u++exV6ey5OTWoTeZWTq2qrzhDSOOGogZDDWBgC7MqlB8D8RtiOPagXklgLweW0yYk
         NncUqYXMoIp9E1jNfKY73I73QRZlSf5i1ZWIHUUrouSP3EcRc/7UF7OVuPiF1+OozAJ4
         vRLEPFpGrZLLGgYrvjgelY2pnwC2xfXOty3wlbJEMbed+diVerVAgqwYDHqJIFDFXyFH
         6KsUpg51f9QLdpBXLFsmmZpkO7uA6aXx2ZTv0ovXEWzNVCXfUR9nRdkv80AsqntZ6aCF
         g1mMw4bZ9I9I7NGuIKjRT6lKtMpb9t7el5Hl5hMKzy/vSVNK9cdyF9o7IM3IKMl/BdUW
         4YEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=L3n+spSP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=VzcpmaWSQ3g2qMkm/Flfl0ZAFT9ug15TZxp73fZewrY=;
        b=Qz0cLsntrcab2u02jAEDGYLbdW+G4/pq5PpgaSWPMWxNW0VPb10zKmyezbcVJVhALV
         JVNfYmsQNpWwMPtq2BEAwvGqYHmjDSW2mj4YtZjq6tE6PwlDFvAz+GsgNG8krqVJ9vz2
         VySsNWMuSrSgh6L/WN/X+HnyeL+F1JI6HFsthMaPvDeqN1rtD/ZSuWe7gmSVNgQvya1q
         MIbARvi8EAcfo6Petg2b8Nh0+B1k+YW3hr7MlBUGMn8TuCLyMY/SB0Nm+/lcmaCL5/C1
         dGU2b/vhAnfK1Lq6tTHj/If376+c0Qxg0d/6Tp404OV5AnO2wgEGzkxfBDLkMmc7llwI
         IcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VzcpmaWSQ3g2qMkm/Flfl0ZAFT9ug15TZxp73fZewrY=;
        b=sO1r9VhXxpm/dG3XcVvYEyAFOLx002DgpKGNUKq7DpEvqXzJA/pSL9yonlBFgigwhu
         dFvoNdpMWU6C3AQoyL1Rm5T4qf7EC9mRwH6n48SLPtDCLwEJvbZyOm4rNzHitgVJ15jk
         7nFWKqo5fkrhQDzw6lskhliO5TMrVKG9aoD3WjuQBtZxp/5hz/fvuCqIoYl1vTkL/05x
         SS1UoxqvG+PB5x1opx/kJKrwUIYmnI3nhwL6Wsf+LC0LOAcjn9r99syQ6NddgkEz95Z4
         ClHxmRq+IoUhtbA4nW2DCNU+BEYRLxV4/OW7KRhfQoMVk7EFnjiNVIy9Z2Tfze+m+if4
         3y2w==
X-Gm-Message-State: AOAM530JLEIFkH9iMSQUeEf5rf/u5t8K9S3w4YcYHSxrDPuRRXTmeE3O
	FKoJQ8gaQ1glwDDMBHofGnU=
X-Google-Smtp-Source: ABdhPJzplGrdMBOYW574Ud+UcKQq2qE82kuQ/wDVQs9vtEiPyS0GmoG3IdgnrszTDA3Oj8IeJiInEw==
X-Received: by 2002:a05:620a:450e:: with SMTP id t14mr9208940qkp.93.1629472117343;
        Fri, 20 Aug 2021 08:08:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:57b:: with SMTP id p27ls3721275qkp.10.gmail; Fri,
 20 Aug 2021 08:08:36 -0700 (PDT)
X-Received: by 2002:a37:68d0:: with SMTP id d199mr9435764qkc.96.1629472116762;
        Fri, 20 Aug 2021 08:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629472116; cv=none;
        d=google.com; s=arc-20160816;
        b=WRItg2bhBqqoINSCqs66TcafQndoVcRj2E2lsRZQJ6W8jtbjeh3MIrTsjxR6iTOCSn
         0m6e8jHdosa0W8Q8T5xbt4miBlu90hpmKtyW6ic/fOyLUyb4BbldA9C82KU9DDGB4KE7
         GXPVKxQrg+T5Gtj3uKH8m/629K5vbecm4xNixwqoKjYQtpNfrEbXzqd4O89emGDFKJNv
         Y7CcUmnULoyMZhpoSXGz6HbJFNvTJoW+J96RtQPKoawYeOjEDYDf74cD+krZsR6KjU2c
         G4zapX5fjQaPuLZOQP9g12e7V7+Buh/Bvd9QuuEMS8I2Gr/1c94W6iQOMHfRqaogShB/
         MRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=YuO5l/blKXjhzh3V1zMq6itX6HrOlhAG+ZFFuQMZadQ=;
        b=GwCeXAfpye2oydd2MPc08piwMv41X3mxKQOWJe0xQIxC0B3/s/lzj6kaUvtsWjrZPK
         c+NiV+SufKf3dHNPRZSh2ub2+EChQ91cZzPjHnE//ka+J967VNkjjENYcmW9azGQrHSo
         ToRMOD/C/KGQz0gmMd35DM4qsl44vqq25Aza55OejODsaEDVf9UzZKdt0dToCA5bcYQu
         y8w6zCSnYLYYXhlPJh516y/BOMsQROHNVdjlQ3/LYcJ7kL5essxNvWhRZ8cZUaH1f7Ny
         jPjiKyrf+Fkkxj9A5J6H26a8a6yAmCMjP070KaUujmsLzQ4FD059d0adt9bq1F9M4vJq
         kT3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=L3n+spSP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id 10si505664qtr.1.2021.08.20.08.08.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 08:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github.com (hubbernetes-node-ce32559.ash1-iad.github.net [10.56.117.66])
	by smtp.github.com (Postfix) with ESMTPA id 8AB0C840B58
	for <jailhouse-dev@googlegroups.com>; Fri, 20 Aug 2021 08:08:36 -0700 (PDT)
Date: Fri, 20 Aug 2021 08:08:36 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/40c4db-36ef81@github.com>
Subject: [siemens/jailhouse] c14896: ARM64: Set the right TCR.(I)PS value
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=L3n+spSP;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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
  Commit: c1489607b44c4b1f1df6ac5163020c46e18250dd
      https://github.com/siemens/jailhouse/commit/c1489607b44c4b1f1df6ac5163020c46e18250dd
  Author: Dongjiu Geng <gengdongjiu1@gmail.com>
  Date:   2021-08-20 (Fri, 20 Aug 2021)

  Changed paths:
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/paging.h

  Log Message:
  -----------
  ARM64: Set the right TCR.(I)PS value

According to spec, the {I}PS should be never larger
than the CPU hardware implemented physical address
size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
may lead to some unexpected issues.

We can refer to DDI0487G_a_armv8_arm's description below:
If {I}PS is programmed to a value larger than the
implemented PA size, then the PE behaves as if programmed
with the implemented PA size, but software must not rely
on this behavior. That is, the output address size is never
largerthan the implemented PA size.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
[Jan: changed comment styles]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 36ef814a1f5c07cd4df0954ff20266fa9fb31935
      https://github.com/siemens/jailhouse/commit/36ef814a1f5c07cd4df0954ff20266fa9fb31935
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-08-20 (Fri, 20 Aug 2021)

  Changed paths:
    M hypervisor/arch/x86/pci.c

  Log Message:
  -----------
  x86: Decode PCI config access violations

This has been a FAQ on the list way too long: Parsing the address port
register content, translating it into the target PCI device and config
space register is not for beginners and even not convenient for experts.
So add a dedicated printk for this case which allows to remove the
address port reporting from the remaining ones.

This now gives

FATAL: Invalid PCI config write, device 05:00.0, reg: 0x44, size: 2
...

analogously to the MMCONFIG access violations.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/40c4dbdf2665...36ef814a1f5c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/40c4db-36ef81%40github.com.
