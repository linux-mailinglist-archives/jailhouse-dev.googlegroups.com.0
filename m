Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBBUUT7VAKGQESA3UGGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6C281222
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 08:17:43 +0200 (CEST)
Received: by mail-pf1-x43e.google.com with SMTP id 145sf52824772pfw.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Aug 2019 23:17:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564985862; cv=pass;
        d=google.com; s=arc-20160816;
        b=tsmeGjA1oe8sHgZo9bdKZtNEXNZvVwFxD7Uowez20kzZrsjIE1sz2bk8RePJa38gP9
         quZng57VpFLKfA+2+WkvkEmkYhtWziijYSmkeaI1MetGSBslBp+Inb6JWSWrClS4Q74A
         fGz6LResnLU/CW153h/4UIxEDeYq63fyj1xszf/3+kv3OL2gNuxKbvU1q9/zRmdBDiRr
         XjWXC0pERsnx5mMoDw2e5ZuWTx+KVBuMabCv5Z24eGYfyXdJd649K6o/L2hvGlzRYeLt
         KTNu8SvdkT1BMyG5dmzZRxWWC4cJSbNgycdT19n/LYvk7eNhZBN3Yj2jewSZ+iEKochF
         nS6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=fBCfXx1zt3x22qyIlJL4MDQFGDybT55Ftbj0gSZYKzc=;
        b=Szt0yJMq9ItWFszzku/dpTU9nuojFnlVUsbSpZP7GyX+6FnbnJ4bana7lzN73/tPuv
         HYwiA5v/sabiCzW1ecj6EGdH5DJXcHicxsQ1kw877947V1b91bP50IQZFV7vTj6rHg1p
         8m7Cgtnvgnl93hj8dcmELGKn6WXC8a4FDgcSSmiPbbH2JVi3ojbo2/znUILB24IkKKV9
         BKpSHWXT8gkN3Q6qPhDSA/D0iR4HsMaQL7DP3cCeIj0GtFsoXPrz849Qo41uss9EIhE5
         5kFA/nyxe+j6kCywHIYqsWfU88gCrzKVdDIi99ZF26SOxuyRcogPoFCgbnuEAdDdfxEs
         MGEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VODOifmw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fBCfXx1zt3x22qyIlJL4MDQFGDybT55Ftbj0gSZYKzc=;
        b=sakKhinmif7eTgi744lqw8HrO4qVbWG2SuxNP4jYfegfgOSTGJqLgZXJxm+VtlHsfQ
         nXgV5XKKwLG1yNsOlNMPYkbC4VVcwkVpGLdM1HQLaETZJZN8FX5hhKvBq8tdy5P9Otm2
         Op5SIsTJMX9Fjq5bUttIbMZAXzZ5ULeLmc8QrBXHvvDmu0EtUzAdoN3mL72lutnAv5tC
         Qg3nSyNJdGFEvWFbR72lSY5an6G2IfAH4NjriT6UujlnXfEpX3cjM2Bg3u5iBRYzFXke
         RBe9OakJP27poCgxa1TwnEF9+TQuO6ZgewWXQbBryAQbTg3fhVtmG3+Z7QkR/rhKmPL1
         cFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fBCfXx1zt3x22qyIlJL4MDQFGDybT55Ftbj0gSZYKzc=;
        b=uEoCYua3bVFO7IduTuFNYUOHVFH5cTI70v0orTcnf7uccaAMHVAiG1a6Jn+b/3bp2Y
         10wrGgePQJv7r/ewz2K4YiO3IgquAsY/pJCa7IB7DQ+CXrEAZz90gYGvAi0lYxi8HeGy
         NYmwbZDefgw0W07DYGyr1sVmsQCAh0UQByHDaTYlEFtT4Itme969noQySOm/vB2enw2Z
         6td/lsx0/Rq9FGEWj8ajmx8/wSxSVZ/0CS0+HeO1DVPophmBJHLTpfVaDNMgiCl8fY4N
         G6MOoj0OX7jLl7hxtOm9RVBANhZci/gixdm2EO6vcKofOZCgcpsvJ06OVeC+YjomsRyF
         gsVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU73eKPhn48jyNejkpnHd2ze3cFvW+dB/JaKoBAGuaE6OOca/XL
	wvDdkI/uLYgCV2mMRx8lPbE=
X-Google-Smtp-Source: APXvYqxpUcM1CxXQPP4Fq6jnkvrn7u653UDMyFfz7Ni5/7UaSDrLX2OYGvCAHgxdiKgX2nbsftYz+g==
X-Received: by 2002:a17:902:e512:: with SMTP id ck18mr135439044plb.53.1564985862541;
        Sun, 04 Aug 2019 23:17:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:75ce:: with SMTP id q197ls18512528pfc.3.gmail; Sun, 04
 Aug 2019 23:17:42 -0700 (PDT)
X-Received: by 2002:a62:e801:: with SMTP id c1mr16143228pfi.41.1564985862124;
        Sun, 04 Aug 2019 23:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564985862; cv=none;
        d=google.com; s=arc-20160816;
        b=CWAPpF2IS5EZMsiWNIKXKRp6HIwSnqIMNCsVV13N7/VJzb/YiZIv0MRRky2wHv5KEB
         PdyNCjdqEfqlI618oDDl1C9DzNchVUgWAGMJ+yMyK4GfIkmvkmejUjksrafRoko+jm2y
         BBZpMo8Pt7TL26T0G5r0f+Gfrqy6m5mWJki4d5RR0kZOOIv18/9PFTDTI7mSnvMJ+G4C
         UkaqYKol4ywq8AcakC3CryEZIZFFPlQj1jE5LCe7fctryxaOQewonvxYr5kaVVmeZtG4
         JB62GKFfp80aWDsierxMOJbWW302rrt8fwnnaEVcp7fNvoSpZ+lmVhaDz4e4z/UE/nkX
         EY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=+kkIt2ZYZp1zCN3NpJBAOpLQJ7spLFpzXhV45l54KwE=;
        b=tb2zfRQLaJxqqYeEPOtDWonWPTShWbly7EX7cQqEywBgBNe0L2lA7cHk2+hHTBx0D7
         dUz2ORKgOQddR+IA4IRq+orRuNYTP7sbE+NSwEa8NbpmAWrfa5W1vKJK0Bqw0sGhRBzp
         ArCiXHh4RF0MUQmgBaUuVNBc6zqzQZTQ+T0zwV3xbpvOSXUPqTnmuLtRooNYUVRsKeI+
         E4+T9TTS7dSeigOQN7GHV57LwhOxNFDvhKa117uVmXzaZfL7LHxV5u/D7yXCPfpqJn+I
         4+l/r/r4a28UrtvlSNMt+FHEqMH6VEnttSFuVqxhNLtl4QQK59Jg0TctlFVfyk8xETHj
         fSUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VODOifmw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id q2si2857572pgq.3.2019.08.04.23.17.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Aug 2019 23:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Date: Sun, 04 Aug 2019 23:17:41 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/44bce2-fbcfb0@github.com>
Subject: [siemens/jailhouse] fbcfb0: arm64: iommu: smmu-v3: Add data structure
 initiali...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=VODOifmw;       spf=pass
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
  Commit: fbcfb0f88e51b9ef76592ec5d3453c7d4ca19a8c
      https://github.com/siemens/jailhouse/commit/fbcfb0f88e51b9ef76592ec5d3453c7d4ca19a8c
  Author: Pratyush Yadav <p-yadav1@ti.com>
  Date:   2019-08-05 (Mon, 05 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: iommu: smmu-v3: Add data structure initialization and stage 2 for SMMUv3

A System Memory Management Unit(SMMU) performs a task analogous to a
CPU's MMU, translating addresses for device requests from system I/O
devices before the requests are passed into the system interconnect.

Implement a driver for SMMU v3 that maps and unmaps memory for specified
stream ids.

The guest cells are assigned stream IDs in their configs and only those
assigned stream IDs can be used by the cells. There is no checking in
place to make sure two cells do not use the same stream IDs. This must
be taken care of when creating the cell configs.

This driver is implemented based on the following assumptions:
- Running on a Little endian 64 bit core compatible with ARM v8
  architecture.
- SMMU supporting only AARCH64 mode.
- SMMU AARCH 64 stage 2 translation configurations are compatible with
  ARMv8 VMSA. So re-using the translation tables of CPU for SMMU.

This driver is loosely based on the Linux kernel SMMU v3 driver.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
[Jan: dropped comments about SMMU emulation - not present here,
      added iommu_count_units() check to arm_smmuv3_cell_exit]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/44bce2-fbcfb0%40github.com.
