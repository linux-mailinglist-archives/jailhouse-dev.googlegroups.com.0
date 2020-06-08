Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBM5M7D3AKGQEX2PCRKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5CB1F16DB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:00 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id l26sf15067804qtr.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612979; cv=pass;
        d=google.com; s=arc-20160816;
        b=llQchESoy1j/99nxncbMGGdLOsDOP+PzBDFf3xslRfSarUDVdkADQmf40dWXgmey1G
         +3U60CHKZmgI9mK/fFI29bEf1xNTVb1nkBRB+YtVg+0ZqGMege9LavMJlJeSmMYCBIAV
         N3wGpv61eOGbLL8DrrvNXEhk34cFPUHhtCiBei2fgcWF9wPkGH1rAN5iflWALAnkXQcG
         sLiaaxyzFf9sBvxnze7g5zEx7bnGv/6kWaURSXVE10+ncHuTMDoRg1iNivYzlmBKTPtu
         qAkb3dhtikSwhUqTkVkjmKfbOG11t7wNoLrmi61Bo9D1c5/JXxiaPQ7mdjxckSITQQVd
         nIgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=V8xUtFLNWHAm26a6YAVPI5ljYt1iVlbCDqxzRFbG1Kw=;
        b=hgEDRL/jbjV05g9F4jbVySg5LX9I598QCJZqeciKr+ktBFRFe2xXdbh8i5oQRVYGpi
         bRJEdIfMwsv6AVW4RQPlSg+lOqtQ115UVfyc8S/J0G8o75tvjAQnRUmT9dnh46HA1Gt3
         LE8EhTqOPYdrdRy9qCi5+S5QBGSOz5XknHv7DZIegvaPMy7yROZERkn8Cz06Y8nxkfmz
         DxBFBOcB4cGnqbJ3hcMt0rLz2oQPIL7dOqCuzs3gzmhQVg+2rmcwS3t2kSN+PiReOz0i
         TnkYDJRQbTF2TA74eUYv/CU1InPQ/UW9dxjb8Ksb5tanRBkFndxuRdLo90RkSRb90Trx
         NK6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x5UpWwAK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=V8xUtFLNWHAm26a6YAVPI5ljYt1iVlbCDqxzRFbG1Kw=;
        b=mjffO9vyFKi53sT8Qbsm0RAxkGRYNgxKGvL6z4I/dS9f+h+4VoBs6y2aIK/IO5s2AO
         wbQnsl36rwFYYASvOm3XgXSuQncNy/27vbYFXYIp9DPxQCMnS3Va7BWOLgeJ482Tpm+l
         YUKU2E35mgH/prkn5/1qQK7GpxvkrTqhN1TPHxhmHjbGX9iSKZMoXGhNWuJpTVlXVsqC
         XD6Fasyybq+oZ/S7PcByz/wXYHGtcnbbGeZAhtrJ/QZQIXNubgMt3hxNat47a0Pmk0C5
         vstZDpUaIREtAplV3JEz18HltO9gPtrCTRzVlZQ4V9P4wumjAiJtTtcMFVNglEWfhOft
         NNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=V8xUtFLNWHAm26a6YAVPI5ljYt1iVlbCDqxzRFbG1Kw=;
        b=JhhUaeV/TkvxQdH2Yi59slxZM/2MWfyObRXUoUs19O0rLaerAsV75WA0bOPIuhB0S0
         QFGMFMNsTIMe775zJCLQWhiwukN7y/8Z6P0CowBBV+C2Szb9Ar771tJG5gNpB/TP5JZu
         RGwiCJLk0oM3mjgllO5gtXLU7+ZhBepfcNzVcSYjznyZ7aOwXnpsoI5fOYKilZZ54e8n
         lsMyqScTyeXX58HXMRNvFVO7BHN1mWln9v/c147+lBX81rdJv0b4NUa2QZrzWWeSIqJ9
         MxcPxqgxGnP/W/BoK7WXvEWAW7HJhjmTL8uez9PKLA8KR3bN17E7ONiM1A3kEROVdt/O
         ZSzA==
X-Gm-Message-State: AOAM5302Og64h0BRpyhTyKoGqiZFq96e/Tt1nE1+nevCQxINTqN3v8XK
	mCieQDnQPkiaic1lDbF73io=
X-Google-Smtp-Source: ABdhPJx1QmEArArNqZDfLqjcl/SZgAacT7WO0y8h6B815JPPhJYyqCcVUI2B3qZ3wfeZiCw756jw/w==
X-Received: by 2002:ac8:4d0e:: with SMTP id w14mr22851795qtv.266.1591612979689;
        Mon, 08 Jun 2020 03:42:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:3559:: with SMTP id z25ls3412921qtb.1.gmail; Mon, 08 Jun
 2020 03:42:59 -0700 (PDT)
X-Received: by 2002:ac8:100b:: with SMTP id z11mr23059439qti.157.1591612979165;
        Mon, 08 Jun 2020 03:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612979; cv=none;
        d=google.com; s=arc-20160816;
        b=X8uco8I8gZw+B7BrFJOu/q2S3hK9ybZJupZOw1jL/GEG/6K5Kj2OmMEct3W90w3PC7
         T9u420FTgpf36HKDt+OHpnTBjAGvsPfSmuC4K1FPI9qCUajctYpE6tleaQ4cu1eHt9Rr
         ZJxLJ8v6QmR0m6+zCNJwJ7t0Y7Vy6NV7OuzvS0bhtDFh6LTCwfVHgHo9xll3yqHK8utk
         rq7IqsiF9UvvvSqibKUxUshJhUA2PMhIm/aIfd/RuRRFNV1AKiCHytzL1Yy8bxtqLa0v
         xMuev/k9LekF5uscCZlHXioQfO6okzSZqjWnJrIsWXQpY3OafJgJOMEOznxMHsNkfWTW
         1FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2qqGU58WXRUOaI9tYm1DsL/evM37ZO/eqG7wVbHfg0o=;
        b=QZ7vt209uxg3CXWJE7cKbewTN2ucdggVRt/Q+xhAuCNQnnLsmxWRF8Qaskx/tmB1ZB
         7rbQQ9SnsD88j37bbpS+VUQnO2qgAHSXJ3gaBfyhif6jMkWxjapwGj3jDKaD2nImiiRG
         h6jBc2rn3sjAm8xIIxw8UkjAuZe0v4VKjD+HgwKvdOOcu4ZSeeJkas/D4SGNkAgsOhi1
         AUdNlrDWxKYekynb3QfvOdGGsw5i5DFCsUSzdJpK9hoqkRoq5Vqcszhkmo5jH6/urNP5
         dW7Y9XzuGk0amcr3ppGukLLrkwdOg8f2n5BYAhVo0ubNvC9DFAq61aFEarjb6yNLGRne
         GjjQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x5UpWwAK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id y21si471464qka.2.2020.06.08.03.42.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058Agwnh125948;
	Mon, 8 Jun 2020 05:42:58 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058Agwcn126002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:42:58 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:42:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:42:58 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh1012229;
	Mon, 8 Jun 2020 05:42:56 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 0/9] Enable IVSHMEM demo for k3-j721e-evm
Date: Mon, 8 Jun 2020 16:12:46 +0530
Message-ID: <20200608104255.18358-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=x5UpWwAK;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

This series adds support for ivshmem demo for the k3-j721e-evm
platform. Since TI kernel uses 64k page size, there are few
improvements in the Jailhouse PCIe driver to support this.

Also, it generalizes the linux application and baremetal demo
to work on different platforms with different configurations
for ivshmem demo.

Last patch fixes some overlaps detected by config checker.

Nikhil Devshatwar (9):
  include: cell-config: Add new macros for 64K aigned BAR
  driver: pci: Use page size to set the aperture size
  configs: dts: inmate-k3-j721e: Increase range for PCIe aperture
  configs: k3-j721e-evm: Add IVSHMEM demo device
  configs: k3-j721e-evm-inmate-demo: Add ivshmem capability
  tools: ivshmem-demo: Map memory regions with correct sizes
  tools: ivshmem-demo: Pass peer_id command line
  inmates: ivshmem-demo: Parse target from cmdline
  configs: k3-j721e-evm: Fix memory overlaps

 configs/arm64/dts/inmate-k3-j721e-evm.dts |  2 +-
 configs/arm64/k3-j721e-evm-inmate-demo.c  | 68 ++++++++++++++++--
 configs/arm64/k3-j721e-evm-linux-demo.c   | 56 ++++++++++++---
 configs/arm64/k3-j721e-evm.c              | 84 +++++++++++++----------
 driver/pci.c                              |  2 +-
 include/jailhouse/cell-config.h           | 12 ++++
 inmates/demos/ivshmem-demo.c              |  4 +-
 tools/ivshmem-demo.c                      | 62 +++++++++++++----
 8 files changed, 222 insertions(+), 68 deletions(-)

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-1-nikhil.nd%40ti.com.
