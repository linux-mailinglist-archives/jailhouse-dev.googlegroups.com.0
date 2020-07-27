Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBGHP7H4AKGQEBMC4QPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF222E600
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 08:43:36 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id z12sf2011406ljm.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jul 2020 23:43:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595832216; cv=pass;
        d=google.com; s=arc-20160816;
        b=cIrBzTCor/tFsmp+P/CwNzQJZ7j3fLhaYfvpoMAsXlqfQTcY2W1JfeuUppHNOUJ5+W
         zyiKqdzh9qH5am0fPAE8x+cl5cMB4dJudR6oD9Zr0X1vVdYrXiwj0/iivQMAuFT86z87
         czGjSlNwLIOO58G0UWSIkYeu/+PDl+rl7SYKxVQSloB/Dxq0R9+noh9RucJh++zGSG1s
         KVoTaXqK/JOt8pHWEusZwMPprskCjr+Y1qsWaTud9DJL3jpDAWtcNJv2N9WNe7v0Dj/5
         7jTFRzUYHvK6kiPqXXHXDpb22apcCoHDxWoNWd8wq6Vq99FBxD6WuzIuhTd3BmY/LSei
         HkjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=O238ZDl6NdA6j8Zpr3slcU3SrtjlOspUwiv66F0uNtE=;
        b=qtGI+wm4upHiLkFhqnIdr1MjSEX2mUyiDol3lOEwMEGlBczHwEa9f/GTse6VxOUQb/
         9QtjFnISlhZJDXyGXiohFCthdXXIi2o7su0Z7HG6773MNd5OGtYsi2lJDk2js5jGkTH5
         aB4FdYjoaDQTINM6VmOe29Gfr1tK9fgD+UpQWi9vhdW9sWHiJb6hLIUMHauS225etCB/
         vPWzTr++8rcuoiJMOfkTrA7g8oXoVi16iAt83bu3Cujiy1K5d/CbMBmcTgunCDimgcTS
         QRx6uu5jpZU7mxQh2Sjg5Rq6wy53feWPZPCumE0lOLIhp5SwXp72XDQXHT8/p+M6Tbcl
         O/iA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JQuAvx65;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O238ZDl6NdA6j8Zpr3slcU3SrtjlOspUwiv66F0uNtE=;
        b=WFMGaJzgsfD1SQ0TEuQwWHwqMO+C/pyQ4KFoIJ6BeSx53vDVTOcbsTZiRGyQZFZi9B
         N/qG0g6STYJeZpLqGoHrepj7gMuOs3PQofwssZ6LT28HELaSiiRMczwawgkeNNMvWClf
         p26umeIQb3lHZV6kIWiLfaFFNjwyPSa2moPWlisU4/qdcShWYeLJlf58z0UmBcz/gNKO
         GHFpLCp/Nx5EIytULBGbpPaZX9LsqmoOxIQE69/q7nqMLQxACNzV34ltaYdOL/AcMcci
         +qm/PFcd2KZzS2OidukrZuUQTecioXL/E1UoAUjwp23o79dcLmxEVSCvZcnl3LZwcEIv
         XRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=O238ZDl6NdA6j8Zpr3slcU3SrtjlOspUwiv66F0uNtE=;
        b=Bd9yioRFF+JY0yRL/26nHuj5RV9VrJ7PkTZygW0fNKa7UEYXsM7NFHfnjX1QY5GLK7
         65WDyDIJ9KSyPGi7RiCVXVKMfbVH9nBKifkUzSH1xqZ8Gkwp4wic1SoBv0YQdwjOSNSY
         j6Z8WRhNeHZt48UVfQldfOhF2QQrYvZwOvMiGi7+Ptu0JoD4W5ZGZcMDJx/g7qcRkVkp
         VZySDNeNPwWwaQ8wp62zPxak3Xib7/GgMG5xXYJYvWzmQduuC4vAJeaVoVsCrBlpV0ij
         yKL9Z5nApqBn2UE0hG0JZXfkoK2XDEZAOIMapzcAqjaK54GHJtK1Hr41rySlFLADzcwQ
         D9uA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330EdineFYG39VF2ZUuYpuwycrKwrrImAn/ZNwDFYYJDFri8ttC
	5JmcMgpdWKejWgGZGwv+K78=
X-Google-Smtp-Source: ABdhPJzCoC2I8ZUMnzazQudKqHXhSlKteHw/XFsKQPKo6pPAEp1cvnfUS3afgNX/HCv69T94Kq/vjQ==
X-Received: by 2002:a19:4345:: with SMTP id m5mr11029999lfj.60.1595832216408;
        Sun, 26 Jul 2020 23:43:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls1834076lfk.3.gmail; Sun, 26 Jul
 2020 23:43:35 -0700 (PDT)
X-Received: by 2002:a05:6512:74b:: with SMTP id c11mr10745446lfs.119.1595832215621;
        Sun, 26 Jul 2020 23:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595832215; cv=none;
        d=google.com; s=arc-20160816;
        b=QCDIcAVaOtPou051EdS3zzglT++DHhnsh3LecU07LjAx3ilqP0EEJzusHi7lLxrL19
         4jUDGo3NcXckYNGfHNo+57i+7VuAQER2Qy0SSLubH0jIUq3my7UM8JzZep8Tk48i3z3J
         2M0ngV4aijAKXAqnjSQr6uWsBm4T2U0aq2ARl9xQigGK1AmWtQVwLI3ZUu+pRG9he/AM
         PqbR1n0u3pn8AG7/rdB3bxjZ3F0PzPkZYHC9qSAZMMWJD2jQixtPS1d2+B6kX/79xhKz
         KRF6Bc32irEg/2UV6LFqN6pmoMCDNhrosIT7tYV5mnv+FTlU77+WQAf3wpGF3Tc4uiNa
         CKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=XkU+P7VfnlmQP+xe0HKuPjcrwBMhUEMk242dKriGr4M=;
        b=cQIHhWDWTRxfWvdHa+ElmqWV+WUYuHxOhfr6p+14cPGoxfsmSUryuRn5MC2RbziUP8
         kMt1raKAy6/E6IHCFAJiqJ1f8j4SI64XaetVOEVqek3hwvmqQr3vHJ2Yqeu41urC6T5f
         etd2s5ojJ9CvYkQhP/R+jt5/80plf+HnFBFvvKkxhJnp4HtS2aPEIxQZuGabX/P+x09L
         cMM++uOEN96tguVOS72bK6gcvYx82UJz3sfH19eSHbuR0yil3DgyXO4SSio+LN15BKVP
         NkzHEzv/4ozPobmNzNdWMKww9R13EWVDOn+GXQH2ymSxNSjiDDMK8STNAJE756DHNmx3
         SiLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JQuAvx65;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id b13si387618lfc.1.2020.07.26.23.43.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Jul 2020 23:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-d1d6e31.ash1-iad.github.net (github-lowworker-d1d6e31.ash1-iad.github.net [10.56.105.50])
	by smtp.github.com (Postfix) with ESMTP id 82438E0209
	for <jailhouse-dev@googlegroups.com>; Sun, 26 Jul 2020 23:43:34 -0700 (PDT)
Date: Sun, 26 Jul 2020 23:43:34 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/384720-9b4efc@github.com>
Subject: [siemens/jailhouse] ade323: configs: qemu-arm64: Move virtual PCI
 host out of ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=JQuAvx65;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: ade3231483b5e5b16800f48b56e2e2c45ab67a8f
      https://github.com/siemens/jailhouse/commit/ade3231483b5e5b16800f48b56e2e2c45ab67a8f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M configs/arm64/dts/inmate-qemu-arm64.dts
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: qemu-arm64: Move virtual PCI host out of flash region

QEMU puts virtual flash between 0 and 0x800000. Avoid this conflict by
moving to a real free space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 41d858e9584d59931b54a1946b7c3265b6ba1cd1
      https://github.com/siemens/jailhouse/commit/41d858e9584d59931b54a1946b7c3265b6ba1cd1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/arm-common/setup.c

  Log Message:
  -----------
  arm-common: Write VTCR only during arm_cpu_init

The value of VTCR does not change while Jailhouse is running. The
function that writes it so far, arm_paging_vcpu_init, is called on every
update of the pg_structs of a cell CPU. Writing VTCR each time as well
is harmless but unneeded.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5
      https://github.com/siemens/jailhouse/commit/9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/irqchip.h
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Refactor irqchip_send_sgi interface

Pull the setup of struct sgi into irqchip_send_sgi, avoiding the
duplication of this logic at the callers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/384720216c2f...9b4efcf4cb3a

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/384720-9b4efc%40github.com.
