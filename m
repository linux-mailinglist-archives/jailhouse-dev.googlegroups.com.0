Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBBWX6P4QKGQEX7GCIPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47C249905
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 11:06:15 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id l67sf25249007ybb.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 02:06:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597827975; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZUMlRzYvl2EkDualZr8a6pUf1Pzh1IYydBbToU0xkJu2cR5lwgBEkbWcHSsuAk/Sdg
         QJnRbZEqGxKAuLKRte/J/N4+OMnpINjYsnU9/6wxPdG/dWhvSGdAv5SNAwHPz0dl8Z6h
         iTjA2HEytS/dqCR8CZKTgSl3esxCHUarNYRzNdK9ErVWyfW+4KPJ8upQEySi4oYRqD+Z
         qfMRkVBwhtJdGBnYdPNNlGNzU4SGWcvyoZ7eVIYnut4QX0nrcAjIYJ7H26IVli9pkwzn
         fEDEZkOwftaD3WrIWpz8BAgecafbmbkHvg0B5vMoF43K4pdqn8sMeWZgPm12G/hnDY00
         GgAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=ClTsF59tpBP0VyJyzbfFhHxn8IB9KOs6m3VIUf+DXEw=;
        b=C6JKKN4KTmUOWO1sFxRc/MaeH/32Qo5oAXb6Yk/qJscvWoFXZWD6tKXP68jrx97CTl
         DVIsadJbYqA9Ca4F74BPdkZtiLQ6YluGHhRIxqs7lJjDquPSX7phuvBtWdRumLeGNHQC
         b2G5Vf/L+bAx/GaKpwUJcz6tqriGF/jBIFhyZKIOL3vq10bfInypdOQduklGaPNhc7/S
         ud2pnsTQcWoRbbdt7RHB2tsG9SseFY2Y/FxCRMV0r4lfHnp+RshYOl+5+5Dh59ZiKCkX
         CumXMPl0naKLdgFMet/ZrIJIVLZf3vF7xB75yffUSlaKPtvgVxOSU+USD9F2ZPAodZPj
         rZ1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=TokAtzZP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ClTsF59tpBP0VyJyzbfFhHxn8IB9KOs6m3VIUf+DXEw=;
        b=RwdkUOTYDDlr9jHgOKallLVRTTwM8xlbpjCxQMA+ek7eH2PdiZeqhfZ/FyHljvUtg5
         iBFkbv5HeLTsO7ftDssfwh+ZOrXoQ8QdkqHNeI2TI+6LCe7eIAm/yUYHG3L34KwqAyJD
         y1Cilt/BaBqaadgR2+4xssXlomlr6nn66n5ux1r+/vAxif5eRkRYUau3bzI+YtTfSAqf
         pxVZxSlUPa69Y9gr7M6pC/Po8WwlqvgPQOiM46N3sj9YiKo66QcUUh9rlBRvG6POxU0b
         UriKVLjQ64+iEK5P1G79TEyZ3Qf+6E7uRp2Ak8g8r5IHQ19JUzr8Y9GkQkDTb93OxwoV
         pFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ClTsF59tpBP0VyJyzbfFhHxn8IB9KOs6m3VIUf+DXEw=;
        b=GG1XZoLCDAJ8SevB25eRAAyRCJ9DJbW/thEaRY8Mfa2K/vzeu9MdEFcaWjkJ7dCUgg
         2dIRwLFql09JgQQ/US2zu5UwQaiwQx4pxB3I8soStx7FSSZX20yZne40xyGaqKU2QqBa
         +jVI9Hf7Pig0PbgQLGS2r92LBFLIUJLYObqFezNtWqCRVmXOsTeUeOYlHgN8ziybeBi9
         fxTZjS8NnU6I003NQP/6Pwia63qAIWfgeaM2Se/UV+NL3aHog/szl7kWUNlcqjFRHf6V
         EWmSc9sj7gB97fZoBGz01NmbRk5DWe2XHcP71s2pK/zxYZb0hxjswn/AVN1gJKJk2kvc
         7LpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Ce6On3Lm2E9/78mshc9s4DQkHA3hgGBHdhwWtYgOjOGyrQeuc
	balgKHNhdIDqMOH4JM8LZ6o=
X-Google-Smtp-Source: ABdhPJxOCrb+vqBMWBngHStm2hbD8IGB6uPa/AX7dJ/BUW8JL3emJ6W+mjz6Czk6yx+Eu0RLit/sww==
X-Received: by 2002:a25:6612:: with SMTP id a18mr34266491ybc.267.1597827974823;
        Wed, 19 Aug 2020 02:06:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3812:: with SMTP id f18ls9506049yba.6.gmail; Wed, 19 Aug
 2020 02:06:14 -0700 (PDT)
X-Received: by 2002:a25:7ec5:: with SMTP id z188mr33904969ybc.57.1597827974406;
        Wed, 19 Aug 2020 02:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597827974; cv=none;
        d=google.com; s=arc-20160816;
        b=QAtv0KDwSAGZ1h6QSkwMwC4PBTlycAMbgnJdFzEyl6ofi4OAinezdogtDOPCndF61M
         CInBW48Bav/rP+RnHCNA1PUFl5r56KApu2E0N34RN2t9Z4/pJLD0octf550YGexNUvxf
         TfUznwlEsFNBBUlEYVML6Lz/iT44kqzehTadCszvztw1hmEDXhvCwiPD3xzxhDyHeJ8P
         Lqb1tFwM7/2LJ+yXs3UDuAWIQzBZ976m6ffr7Rumdbv9Uaza5G5euXmwJ78IPFZDG+DO
         mW51Qcfe9qyeIDpxTbQ57xtoDDtmAnZKbF6jcutjBYp8PkH1MSYJyE6iZlCKyoO/1sZz
         WLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=uzxPi5ur0IibBQrOJE/T9F9Icrv/MUWk5A4CwSdkD0I=;
        b=NMVtOQq2XStAt50AOnfCNOHIQuZhsiZlplG9ZS0hIrMS5jyorrhQsvoiWHt8KP9EHv
         aiLWqG/oHhypbr4DnNTyXXJ1lG4QdXckmKCB7fBW0Ff8+dNeTaqxeNe4/4g+IDm+nHT+
         fkpa7VYYn9ZS7qE2i1ykSWHtyr46KizYvPqfyR6fYRDCDy67HtnVrTlMS3GehMktaOb5
         LJcDWX7pSwi58I9McA5nKMJ02Ksxbuqs+5tqo687i1joC7EWlIOkW4ajFCsQNP5qW2rM
         gLu9l3GcsqvzioUMb9EMli+erftzl5mK3APxXqOiqYobcP5i7ULZ1b5F2rPlTITemNF0
         Q2dA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=TokAtzZP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id 7si1473320ybc.0.2020.08.19.02.06.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 02:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github-lowworker-a27607f.ash1-iad.github.net (github-lowworker-a27607f.ash1-iad.github.net [10.56.18.61])
	by smtp.github.com (Postfix) with ESMTP id 2E273560E6A
	for <jailhouse-dev@googlegroups.com>; Wed, 19 Aug 2020 02:06:14 -0700 (PDT)
Date: Wed, 19 Aug 2020 02:06:14 -0700
From: Peng Fan <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/f34cb1-ce1098@github.com>
Subject: [siemens/jailhouse] ce1098: arm64: mitigate Straight-line Speculation
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=TokAtzZP;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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
  Commit: ce10986e6637076778fa9a94968b7779d17a56a9
      https://github.com/siemens/jailhouse/commit/ce10986e6637076778fa9a94968b7779d17a56a9
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-19 (Wed, 19 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm64/entry.S

  Log Message:
  -----------
  arm64: mitigate Straight-line Speculation

From Linux Kernel
commit 679db70801da ("arm64: entry: Place an SB sequence following an ERET instruction")
"
Some CPUs can speculate past an ERET instruction and potentially perform
speculative accesses to memory before processing the exception return.
Since the register state is often controlled by a lower privilege level
at the point of an ERET, this could potentially be used as part of a
side-channel attack.
"

Use Speculation barrier sequences:
 - SB
 - DSB followed by ISB

Since we not have ARMv8.5 with SB extension hardware, so only
use the 2nd approach now.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/f34cb1-ce1098%40github.com.
