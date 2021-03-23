Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQXF46BAMGQEHHGSOFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F98346034
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:53:06 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id j21sf1450011ljg.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:53:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507586; cv=pass;
        d=google.com; s=arc-20160816;
        b=VMVk4tdw1cEyudMR1C5+u8KTy0tMjL/WVD3hLS/LmkrfyZnGrgtWd7iKIWGnu0JTWA
         lBXDciMVuFziYqtMWvP9jmdVjOak2V7LSVZ6BKeCX0/vl/7KUtaKymZW1ttig/YewFj6
         i2txJi+DSddtHovrFpE6ciBOsJRIyUzsuto34LZDgJi172mdBufP465C7IDkEz/bZzaK
         wpTlWRBZDMU0Ded9gveUNwP+fKkj48hvR+oIA7S+KHnZ/NelZnauG+hiJrjbn5j4EH4l
         r4XiuN3rSF1hgoetKfusAn0gCqzO1e6U85a8oM88VvjY8mxaF6H/KOCKCFKJMizAmX6D
         RAhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=tAimhSuqEZIgQAetB/IG4dICAG5seqHSGJi7yXoOj/0=;
        b=R4/o6T2BdnBCyA84FowfX8wsw2hunWq2RWZtbuSf83MJNjLYO/wuitErFg/lKWpHdv
         HhuS5QHmdvheJ66ck5EP4AqmsiJDBz1QoNYA1XwEglNLUbWtpNREEmMNTTpR7XFQUza8
         3FFQQ/yUaokLhClhdGLqnHeOt7jM3KwTa0KBN4/E6wfCKgMT1fVKUh84AeDl9oaw0WBs
         yRsP2B07e0H9oBE422MBAW3dsJBH1LnFz80Le4MiZlMspXddeMLACcGOXYDO7lJrgEjk
         k8ujHcIwVwVNujGcLvdxWZQITG2Nx0FaKP1DJ1RY21Ej38jqzyVksSi8DX6LI0NAPepU
         UZfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tAimhSuqEZIgQAetB/IG4dICAG5seqHSGJi7yXoOj/0=;
        b=FvQ0N5xevvvTpMFZqSO9UT2rjT15zBhOYNFUf2iwMakyxPhx/h/HMW8up0hZJjyWB5
         Y8WzhSWjvQoRytc5IDyhcrrPtZnIHQoJh8NdcoWDbxUO1fsDS0tWgpCTefK8thxR/Nxb
         hgTObyf3uL09b1ladLvzdVDSXgEBaO35x7N+K+8XlfnjSMcJKOyxMcAIdEA3IiKRig3/
         psgeVY243gOxQIp7QikUHP/rQnD8K9F/RZtklOtKrCK7yzJ5aUFD9A6ohMmSt6Gv+1an
         PGqY7DYl5Uf7hhEegioH2cEmsdrr3OJG8zhCzPX8kMHaY4d3ACnExDnufyoEbzS2RT2t
         1rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tAimhSuqEZIgQAetB/IG4dICAG5seqHSGJi7yXoOj/0=;
        b=MjgEZ9C8W1sVAkz/VvbMJisMkMJQBpZpcT4Es28MXwtSP2jEmEyjuH9ls9c4d0UM0g
         ncPmrqCugSxxQZkxltV1Fjb0eyVNe/9F1SyKdaGsY7qLDyfUfSw10k/C1FCzq8Tw6Z9n
         CZo9UdyaoGxiLBZhxxh+a1AV3g4cocUx1tN2K1fL1yUOd1U18HuTrBpP0jr1YylQfqsv
         i+ChCRleYRq/mVr+yW5N6mzdF/NRZAuEQncDEu1cBQf4QLixkGDuTv74PBgh1lvFhGGU
         jJ/UojWVBOs8liyz/XIL+M2X8TMByxBMRj97Zjp1AlLjuRmhr2UfLLYFaMhAB2t+eMqS
         CRtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531tRdeScPLo6bg5/0Ss3weMNX4e/zWSYPvNiR2O+YiqQsTUAwns
	IykEKmhpB/qI6Mfi4blWO80=
X-Google-Smtp-Source: ABdhPJwEZsfBlzTplD6UuGvtFq/qlIPFkpA83oQGTaBK2arJY6452mYt/qbV/d6jX2n9fO68DO4m1g==
X-Received: by 2002:a19:4157:: with SMTP id o84mr2642533lfa.321.1616507586389;
        Tue, 23 Mar 2021 06:53:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls4750448lff.3.gmail; Tue, 23
 Mar 2021 06:53:05 -0700 (PDT)
X-Received: by 2002:a05:6512:2097:: with SMTP id t23mr2548822lfr.21.1616507585100;
        Tue, 23 Mar 2021 06:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507585; cv=none;
        d=google.com; s=arc-20160816;
        b=TgcWxf8HV7S/nLKMG+2IVyDJ87xYqPWGKv3pj8ccpBSM4+0HoPX4NixI5CMqRl9lNO
         HLjWP8CtTOuT5xpXT5biFwwZjB1mXJ8UP4JbOC5+HRQ2D/juUYMUHo4aBlw6L7cRdIIy
         7JzyMFGSt7hpL81YrPzw9w3Na2SLFu9vejdJlH42WSP++bex2GxW2mEO6faQW7qKfdBA
         bMUtGg8uOdqD6oqxpPLi9PMPOPPEgX4t91acJwwFL4w6wIc/mPKdUb3ob+3vkL0vCvo5
         bOrEkinUeHUtQS6Zz+Vhto5crv/UtfiL7TNq4i3n0vUBCHuVvktJy+HJgA2T7AfKfKLr
         LRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=elgPq/rs2/uIw1oRsBMHdt+EWo/R9Ma1OazjtpJrcek=;
        b=lVoxLzQBA33SCR5G6/DXhhKntE5vREU8L63G5gAspw+MN2vLVvyh4Ub4bB0XD8QdhT
         ET45WPP9qXvf2by/m+doEF7RD85ccbQA/TRXtKN4o4lKrHkQAIVhZ3GMHzPF45Cn98Fz
         Uhd+61fEYNF2vFeggOYnugBmFDlYQDsnpAecwHc2wzbDWTHnRGbgC5aRuCYnuG0PXwEL
         xSUPzPReQQabiv+0izy9nrWg51ULzp24Yi5+f/VcYuGEqnUurNVJTaK041f3pgX06Y3c
         4ezaJz1cZ4RPfTtScfb1ym++bGa3spknigmHM2MzWPIwjC96M/su6oF0TrvCQx9qiCqz
         +vBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v26si749328lfo.2.2021.03.23.06.53.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDr4Hk026052
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:53:04 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Ml029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 05/11] customizations: Add QEMU ARM
Date: Tue, 23 Mar 2021 14:47:56 +0100
Message-Id: <dc29771414eac917d0e3d7f4e118b1d79b0f37ba.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616507282.git.jan.kiszka@siemens.com>
References: <cover.1616507282.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../customizations/files/.bash_history-qemu-arm    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-core/customizations/files/.bash_history-qemu-arm

diff --git a/recipes-core/customizations/files/.bash_history-qemu-arm b/recipes-core/customizations/files/.bash_history-qemu-arm
new file mode 100644
index 0000000..39aeee9
--- /dev/null
+++ b/recipes-core/customizations/files/.bash_history-qemu-arm
@@ -0,0 +1,14 @@
+jailhouse enable /etc/jailhouse/qemu-arm.cell
+jailhouse console
+jailhouse cell create /etc/jailhouse/qemu-arm-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
+jailhouse cell linux /etc/jailhouse/qemu-arm-linux-demo.cell \
+                     /boot/vmlinuz* \
+                     -d /etc/jailhouse/dts/inmate-qemu-arm.dtb \
+                     -i /usr/libexec/jailhouse/demos/rootfs.cpio \
+                     -c "console=ttyAMA0 ip=192.168.19.2"
+ssh 192.168.19.2
+jailhouse disable
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dc29771414eac917d0e3d7f4e118b1d79b0f37ba.1616507282.git.jan.kiszka%40siemens.com.
