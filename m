Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSN63H3AKGQE35EXGTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 183DC1EBDCB
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:42 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id k17sf6665843edo.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107402; cv=pass;
        d=google.com; s=arc-20160816;
        b=ei2UhWvjQ/8BXCfvBPb7UCH8oQNrypvhA+w8difyzfd4QtFtwcDp1S0033k23UpHRC
         kN9nfOyivOX+3JTMPVwzM2s9jg3+ujLVIFAuprp+Q9m5CcmqWzKpt3N9J+1lPcJ8Tz2k
         LZ7aCaT/UCXypU/aJPq6UyqdzqPDWQ+KY0uyMn/uV5JdirtBgqk2I9ri6Le0AKlheLAC
         rGjHz/SVRj8q83ZUPiY9fUaivYvfN4I2PZbdLDOAl8cYRHOzRfo/80K8c+unQggJ5hOH
         KpsoEP6y49VnYCV0vn0WYjtiActImmm+EGLLFaneV6EuG3MPjS140nNSJNCUMhGFubGS
         esLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=JIxKDMoOqGRpk7AFOGzeE+PZnqr82FKgeBxhEHLlSz4=;
        b=xm+Du+7eSNc3jWfgjSWV/0lwCCCUhbGNOyUniAyyCTEQn7e6TMA0sWKt2Rjreg51rn
         sHd+u5cE73rXlwqh4omMwKw9BdcO7RF+Ot3EmFYpyNSzV/g5TD2tcEr2fyHVUqxfkdaO
         +uIU5rNAvzXdSuMwb16prlQ14h/gLdtilCnRewmzjmjZMYenR1D6TBt4mEmIiL3rYUAH
         tVRTitc3f/myKJhQZE6O0wLc6QyfqRDgEwpArNsPydPnjxp94kZgVNaVC/duThVb9aZ3
         nnNw1yBzdt15e72qLpL7KCgMI0Jnvf3a94HZjvq1+CnLFfiqcCEiJqbX0BUkEGh9jxUJ
         sHJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JIxKDMoOqGRpk7AFOGzeE+PZnqr82FKgeBxhEHLlSz4=;
        b=ofkqR09H8EY4rtAzr7EAhbhT++skZ+4+XlCe2T4Y8JmyPrhC7yQlA4DDc2oqH/qQh3
         gKUmV/GBS3si1dlUkPS/xOdMmOVHBLE4wp4CMFqHMWZxt0asoKqvi143qxY2CbFZY691
         oBW4wmpBHuiBQux+ampebqaZ8sSOZ+yWVFK2+h446YPqZ0qMyXd5dxnSmQWBl03acy2m
         RD8DNrRlZpMWzjIJ/mh22+GwuW7BvJosACSICrG7VBmvbpoKrIPl/MSpLY0Uq32WZ2Q7
         raBBNgAIIiZIJZxryGWkdCKdXde6gjEdLKeBqzDQlVpoZo4Y36cgJD1BKnApcAQ6Jx0E
         YabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JIxKDMoOqGRpk7AFOGzeE+PZnqr82FKgeBxhEHLlSz4=;
        b=RMDZEiGbg7bHOCnoo19WY8HWREmRrqedWJuLfNCbHcr7eK6nUXLFywLw50kjQgdgVh
         OI/LYKFui4HjSZM/2pMz0hm33Gp6dU0c5Uua4PmMmb7r0puDlQqWXi8eCyAf/Ebrj4Rc
         M5ruzDODIfnZ0U3YUpZ71aW9qp1njrT5ZjsImsnEc/UkbSwMsN8gTQVfNqBr55/EW9mF
         YE+rqA9+UafDe+CEjow/OtqlIDi79ozMSn0+f0VKyYJ0C8I18oMVYUYtfpG/8sGjP9S0
         ig3UTEcn+RS20bAJW2Gtn7FZP24U7zn4aC7oUvgOjtcBLNrYBLFqQJ/loIau1vO5fHFD
         T4Og==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533N1UqG985mG+AfEXtHBNNPVPG071AkAxFJWDVm2vlwRfwYV08a
	Hfq9KA0QMWOo9UwReDhBDbs=
X-Google-Smtp-Source: ABdhPJyu5VNH7sSiVUZbWqOMtqD0Mtd7De9K+Cu3sQhqD7c7cFSYuiWLH9D3LmJK89+wiWVcCC3vDA==
X-Received: by 2002:aa7:d283:: with SMTP id w3mr14699110edq.262.1591107401844;
        Tue, 02 Jun 2020 07:16:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a82:: with SMTP id y2ls6199699ejf.2.gmail; Tue, 02
 Jun 2020 07:16:40 -0700 (PDT)
X-Received: by 2002:a17:906:5a99:: with SMTP id l25mr24637120ejq.235.1591107400873;
        Tue, 02 Jun 2020 07:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107400; cv=none;
        d=google.com; s=arc-20160816;
        b=1ICpVjvTYn2+byUbMUYiQcMnFk0f+vYuJirWVq4vW8HRZhQczCKJ0wZL2pwH17S4Gu
         +RpB+MyUNjt0RNFK0KfCM/nhx4yzhLn1fy0+OtAaw/r2QSeivLyck2Co2qD++p+MJ1tU
         Gf0ac7afwdTJdEB2i5MeOVeR3bKkgJNdjzskRQwirZ3An/wlqwUM2h+F2nCbxXuSy5ae
         znI5EgnhIwkDApBXuLXgzgcKcjHWdLd0QS8RW8l702YJEhrdeZwuxzctvZ0QIiZW0Jsm
         UlrER9uO7R8sn+eIoIyyg/DcZdWcVYXnx59M1Owij4XTdagczuyqhi7dGZ5ZKtmGhrfI
         mXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=0S+KDB8FS83p5onF+rMVHXFDmu1MC2TigoAXqL2H6f0=;
        b=jnbBGSg4m6EnpNvrpFsSOCApIf7bvtABcBLx1ruUwM/097QDQR+HJ9amksH+KTMlFZ
         vqTL7wOn3lz7qOCdoNYjO6d5O56Kh710D8Ud9Z4+HhDWEBc44D6Z3Kusd9PoFMyxdAKd
         OtOeICqdmh0gwmyp0M89qjDZHyIs8pBzi785nv/WgPAF7FZGgB9N4w+dKMdVVTP1hQ1m
         qBzZs7OVW9yQwez0TyHw09exm5Y/MH+9srSS9JVASMqwNHw5/EKXkE02jvOB04z9c37T
         lsO0HHAGwDIU9bfGT9PRVYuFuehFfh4ZjOMUjRt6ehjYc3h51g9KNf/etcyOmHnoHZOv
         COIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a23si163023edn.0.2020.06.02.07.16.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGeFt000642
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:40 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcd9028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:39 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 00/15] Config checker and first related fixes
Date: Tue,  2 Jun 2020 16:16:23 +0200
Message-Id: <cover.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

This introduces the framework and first tests for the long overdue
checker for Jailhouse system and cell configurations. Basically, you
take a set of binary configuration that should run together and call:

jailhouse config check system.cell partition-1.cell partition-2.cell ...

Then the checker will parse the configs and applies a to-be-extended set
of checks on them. Only two are implemented by this series:

 - overlaps between memory regions of the same cell
 - overlaps of memory regions of config set with the hypervisor

The latter test passed for our in-tree configs but the former found
some issues. Two are fixed, another one was a catch-by, and more are
pending.

Namely for the following:
 - configs/arm64/jetson-tx1.cell
 - configs/arm64/jetson-tx2.cell
 - configs/arm64/k3-j721e-evm.cell
 - configs/arm/emtrion-rzg1h.cell
 - configs/arm/emtrion-rzg1m.cell
 - configs/arm/jetson-tk1.cell

Contributions welcome! Also of further checks. Some things that come to
my mind:
 - consistency checks for ivshmem links
 - arch-specific checks for do-not-map regions (IOAPIC, GICC, GICD etc.)
 - is loadable inmate memory reachable for root?
 - are CPUs not overcommitted?

Jan

Jan Kiszka (15):
  configs, core, tools: Pull iommu_units out of arch-specific platform
    info
  cell-config: Rearrange paddings
  tools: jailhouse-hardware-check: Clean up dead code
  pyjailhouse: Factor out cell config parser
  pyjailhouse: config_parser: Translate struct.error into RuntimeError
  pyjailhouse: config_parser: Add SystemConfig
  pyjailhouse: config_parser: Convert memory region flags into
    ExtendedEnum
  pyjailhouse: config_parser: Add pretty-printing of MemRegion
  pyjailhouse: config_parser: Add MemRegion overlap helpers
  tools: Add jailhouse configuration checker
  tools: jailhouse-config-check: Add overlap check for hypervisor memory
  tools: Refactor and align help outputs
  configs: arm64: Align ultra96 config with qemu-arm64
  configs: arm64: Fix hikey memory region overlap
  configs: arm64: Shrink imx8mn memory regions to required size

 configs/arm64/hikey.c               |   2 +-
 configs/arm64/imx8mn-linux-demo.c   |   2 +-
 configs/arm64/k3-j721e-evm.c        |  15 +-
 configs/arm64/ultra96-inmate-demo.c |  75 +++++++++-
 configs/arm64/ultra96-linux-demo.c  |  59 +++++++-
 configs/arm64/ultra96.c             |  57 +++++++-
 configs/x86/f2a88xm-hd3.c           |  22 +--
 configs/x86/qemu-x86.c              |  14 +-
 hypervisor/arch/arm64/iommu.c       |   2 +-
 hypervisor/arch/arm64/smmu-v3.c     |   6 +-
 hypervisor/arch/arm64/ti-pvu.c      |   2 +-
 hypervisor/arch/x86/amd_iommu.c     |   4 +-
 hypervisor/arch/x86/iommu.c         |   2 +-
 hypervisor/arch/x86/vtd.c           |   4 +-
 include/jailhouse/cell-config.h     |  14 +-
 pyjailhouse/config_parser.py        | 219 ++++++++++++++++++++++++++++
 tools/Makefile                      |   2 +
 tools/jailhouse-cell-linux          | 162 ++++----------------
 tools/jailhouse-completion.bash     |  26 +++-
 tools/jailhouse-config-check        | 102 +++++++++++++
 tools/jailhouse-hardware-check      |  48 ------
 tools/jailhouse.c                   |  15 +-
 tools/root-cell-config.c.tmpl       |  34 ++---
 23 files changed, 610 insertions(+), 278 deletions(-)
 create mode 100644 pyjailhouse/config_parser.py
 create mode 100755 tools/jailhouse-config-check

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1591107398.git.jan.kiszka%40siemens.com.
