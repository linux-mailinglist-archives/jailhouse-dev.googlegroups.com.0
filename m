Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBQXFRWEQMGQE35GHI4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id CA87C3F4830
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 12:04:56 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id c63-20020a25e5420000b0290580b26e708asf15962184ybh.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 03:04:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629713090; cv=pass;
        d=google.com; s=arc-20160816;
        b=fq4yY93i0Wie6+xuqAFuCVaU0CyatgUuuuvYzrJm8FmQ7gtyeLWII6gVEfur08TV5l
         LHJguk0L/fYrA8BC5lTswMi8/zIJ6wMwEQvCsTpnGxIIQjtb+xnzLGdbpu4KbP1EGTuY
         9vzx/NDeWDXxqdvls9YYhBfYL/gg1VbgabVDG9Fw2FYl9jZjSDakDELAFL5VsTljwLM0
         NKWjvJfoZcI3Uj/7TKVi/P32hZdHvDyypLMrmWiZ3uFJMAcYzLtZYPD7GkpkteAtN0d8
         jMTfQPE6OUTP2MlHfz7v1ihYaoWk03x7cGgXSEfbfSbv1CuM5RTIkRKnc/jMHOh3Ic+4
         rgsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=KOuKB5UqZpaB8QM7rWpHWVFzTc4oD44Iox9VsitAn1M=;
        b=mTI5nXV0osLo2JGw2k+YyTc3tzB2gqCFZdB+ITkGlqMQNUOkHsWeOmv1ixKhJlqKa6
         g+QhruG0q+hGN1aeGtZkFdcC9Wnq4eHj8W2dzHR28PlpBT3LH+cLA3BpSMDFQ2z6clP/
         bPduKmNv4BJ5dGonme4Q6d9hd4ruW95kkhqD8WosN1lFUm8hwTam5JZTLjaFZMbwAc62
         V/+dddT1an6chr/rcO9J19FWKFhCHyBl0fJ7E/FKm2A3ZmBRwadOKSXDDpBmk2CkxT5b
         CFMlKCYArKygNo+k3G2sOOc6LRBie6vjGvRDBPUHE98tFZD7URQXP0s67QDX15qM8YLA
         rXXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ttiNrbKz;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KOuKB5UqZpaB8QM7rWpHWVFzTc4oD44Iox9VsitAn1M=;
        b=Yw38vZ9v6My/elJ+OHpwCHQJFU5QRzuwGrEwY4bqQF5m2Ud88fyhH6pZoKbIlPB73d
         VngrRfJ3JtO6cQ5tq0F8rxv5x0gMynY7Gke45uIeVRlngRcDtKrBj6ctA9K3QyzBBAcq
         378O3oGhBN/ot9nS5gBKK00NP6i0Pmpe72/syv5GGQKf3U0o87B4vpG10i2ww6h3IDEX
         kBiH8l0DdWwKSXmKDBHoTXJZ+OuD34/0KaWfcmWfaLz6nuQszZImFzzd5WjTUFKTzj67
         5lzS1EIXBKvee5ltvDb6hLE2NTddB+lW7KtvBzCcquN+zp/WydeLBQm2oMfJGyXPJdWU
         YvNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KOuKB5UqZpaB8QM7rWpHWVFzTc4oD44Iox9VsitAn1M=;
        b=in7gCwSZ4+oZtRHqrtQCFx7QVvRY+qlh1mdx9v2xHBXULbD5lWcOt6h9XCkN/qIBoi
         8dY3fCbw6iNr+Z5++Y5lr99CAFFthAEUbwpviHTh74AvUfQ6i7K0oTBjeeKpe2CvDizK
         baA/J3BzwGPfN5EnUy1MxEh0/zfSaEDXRLnrAJpHxGjWkKVpksrd/XBbbL6zyawTcwEA
         xwFnKbuBZfC3Ub7fl2cw1wFQ50ZYUygLss5Np+wyaZ7RmSndZaXsmWsmI19lUPUDTxmb
         7kyh0tVxLX90x9nrNX4wDwBiNM9jddEmO07Hl8wAZDU6mM5bS5JmRv8YYy+QTZGemdHM
         L26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KOuKB5UqZpaB8QM7rWpHWVFzTc4oD44Iox9VsitAn1M=;
        b=n4h1+cqWz94DFDoasU04R0ppNKV5esTF0thPO16zQ7DVxSLjjQecIZyw98mnmq4giT
         aj7xHI6d8+NBN5gTWnZ02gxHETsOP3IUPlJVew+bPkzWodfyB8wjfMk2iBByer94vSBN
         UBm9u5nbQLMsf6qBXx7tLpOF3mllW1QIW2ykvFNbXASkE0BWo+6FI/ltYjx0jNz3pmWE
         c5WwpzJydg0Hptlmh06TmKBarOXbiNQF39e4EVfjajObxn0eIzoKfdAKbE3VdKnWVfmH
         YKF3+Gld+ScpsDFTct5rqml3f8PpeN3bZQNQF5knHd5UgxyWnyDyrHuovVfIOIDMKdfq
         sZrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533FujdL6wP63qYvPR8h5tvLVCwaUZstUuH4VSQvScOl0X7z+zlS
	E4cNp1oWrMo4TEv1TKZzwHk=
X-Google-Smtp-Source: ABdhPJyvCa9j0FPL0PUzzfnQfygGqvlPaX5wwYvbKrDrPKJdJrtVy25pSmcomKsEg6KHVZbH4blhjQ==
X-Received: by 2002:a5b:28b:: with SMTP id x11mr40774834ybl.9.1629713090774;
        Mon, 23 Aug 2021 03:04:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2b08:: with SMTP id r8ls3869351ybr.9.gmail; Mon, 23 Aug
 2021 03:04:50 -0700 (PDT)
X-Received: by 2002:a25:cb01:: with SMTP id b1mr18641677ybg.215.1629713090140;
        Mon, 23 Aug 2021 03:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629713090; cv=none;
        d=google.com; s=arc-20160816;
        b=rgSAdGK2XoZBkD7w11Q3+4k/ZWdm5/YO76Onp/tMcS8nyqSNWVF9+YhC2DbeMup7wy
         wFPbIRWzaAA0lJKpY0fnIM7qzlzJc1fkmgGT8rp4fmBtVD0PVHlseWI3+2oQe2I9bfyq
         f4M5NLL2C5+wH17k+p7mpgVOO8LOutp45fITcuxKFoLhdKUYuaPMPVmCWzHWEyCxjfmP
         /kMCsQBCQimzTkv/Bsj64n3vIG9ktt9AdS7JCxTgCZYFPAhHlAHrXaW8VJm0WnGJIzmL
         unWsCJBgCyxfH4WXi41y6qk3CsN+R70JtpSFMLOboiEWZcxgt/nbq3jAr4cjH4tC/F8n
         8rHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wdBbgWzM79x64tnJiA0xLo7P2x4JPvu2NwYuzVXACKU=;
        b=FgEam6Izm6QXZfUuhwdNdUm8iwEjIYSFSWjWu/ntPF+O0ixjmLYM6e+2L317RjETHI
         rp478zE24jKuJBrYXMDmL+DBe1YW5qK6FI5TLR2+mF+SWVHxJFBeVejUJFyy7Z2etU4o
         JbpxdAipRTqtjvS6IWSj3wqapkobYmYjLqB+6UcC3ZpdV+QoTsj+AP5mVzQ3rqIFJnzf
         IKrBQzCULEPgzzBVfHsrNg/gSkF0jk8U3GddVsvxkrHJjmNLGewq8zkYPIBubFxTjNGq
         HPnRGvQcwhZs8UQVL3zkTm+XG0W6nZrxP2arH2hPn5xnnGWJExlmqr2imzYa33kAadCP
         rUYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ttiNrbKz;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com. [2607:f8b0:4864:20::844])
        by gmr-mx.google.com with ESMTPS id x17si195326ybg.0.2021.08.23.03.04.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 03:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) client-ip=2607:f8b0:4864:20::844;
Received: by mail-qt1-x844.google.com with SMTP id t9so5221190qtp.2
        for <jailhouse-dev@googlegroups.com>; Mon, 23 Aug 2021 03:04:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1105:: with SMTP id e5mr29135198qty.268.1629713089841;
 Mon, 23 Aug 2021 03:04:49 -0700 (PDT)
MIME-Version: 1.0
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 23 Aug 2021 18:04:41 +0800
Message-ID: <CABSBigQ_5F-LfmMxFAtZLpHWfe997LHXUDGfVdhNrzJ3D6c+WQ@mail.gmail.com>
Subject: arm_domain_dcaches_flush() when arch_domain_reset()
To: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ttiNrbKz;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi,
     Sorry to disturb you,  I  have a question to consult with you.
when do domain reset why invalid the domain whole normal memory
including VM's memory.
 I think the VM will invalid its cache when booting.


void arch_domain_reset(struct domain *domain)
{
        unsigned int first = first_cpu(domain->cpu_set);
        unsigned int cpu;
        struct aspe_comm_region *comm_region =
                &domain->comm_page.comm_region;

        /* Place platform specific information inside comm_region */
        comm_region->gic_version = system_config->platform_info.arm.gic_version;
        comm_region->gicd_base = system_config->platform_info.arm.gicd_base;
        comm_region->gicc_base = system_config->platform_info.arm.gicc_base;
        comm_region->gicr_base = system_config->platform_info.arm.gicr_base;
        comm_region->vpci_irq_base = domain->config->vpci_irq_base;

        /*
         * All CPUs but the first are initially suspended.  The first CPU
         * starts at cpu_reset_address, defined in the domain configuration.
         */
        public_per_cpu(first)->cpu_on_entry = domain->config->cpu_reset_address;
        for_each_cpu_except(cpu, domain->cpu_set, first)
                public_per_cpu(cpu)->cpu_on_entry = PSCI_INVALID_ADDRESS;

        arm_domain_dcaches_flush(domain, DCACHE_INVALIDATE);

        irqchip_domain_reset(domain);
}

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CABSBigQ_5F-LfmMxFAtZLpHWfe997LHXUDGfVdhNrzJ3D6c%2BWQ%40mail.gmail.com.
