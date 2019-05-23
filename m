Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOU3TTTQKGQEX7JAGQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-it1-x139.google.com (mail-it1-x139.google.com [IPv6:2607:f8b0:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC7428C2E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 23:16:43 +0200 (CEST)
Received: by mail-it1-x139.google.com with SMTP id s18sf6499613itl.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:16:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558646202; cv=pass;
        d=google.com; s=arc-20160816;
        b=NJCC8pBRozVdiQDr/V2yRvLsdCDQtPWEHh9XdoLhOA+ULFsToCOC0eQVb7cKuvfJvs
         OSNrwxP+q//oIt7f69bNBkOWfuiXHPL0PPU0l+6mz2nbki/iFAoZMEA08qZzRApt+1DD
         l5w+vosy0n672nVmqrirBg+TDq/k3XDcMxcDyaJvAZ9hR4y3mhQqPuN7C+T/i6avIGW6
         624vc5pUTTMTvZd+AmR5HfhntQufHjFSwyNMHI3p0IwhdSYbIbRWsibuo0bMiyv2lGfj
         /N12Lf+46C4YjexvvyW9vlvjnS7BbxNk60S/XbbJxpmConP2MzJAcXPYNIvX2mIW0Gxf
         xmuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=bQO2vbEqA60vEQ56UgyD3aGfkgJ8gWoiGhSb5AA0hL4=;
        b=wktJ6z/Ky6wqKx/4/m+TWevRFIRz/iHjBgJSwfFEi4G+mVaAFNK3o3dQJKi+m6zyhh
         3Uw/qWSLDjXGf/XY1nLWUYlk6LGyxeBJQniDF+VmTxYozanNkcCEjjmr4aVk8c0hiWHP
         o3Hf7dbNiGmOZXahAbBpCIdtykwRNh19/w64YdZ6nxveQY4rV9hB0OrkupGhryoU/WXV
         07KMF5udacyGehni+s/U5Z/lVW/dRLXw6bO4VTDFI2Jyo8oZS2qkOpf2JBU+ptZ2TNH5
         AqyCWfJF60fsx/aWROwD0hirW1lAsZv15KsuAyfKs702kP0qZnkONe7asaw9hDqaPt2k
         f6TQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DZNsxoIy;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=bQO2vbEqA60vEQ56UgyD3aGfkgJ8gWoiGhSb5AA0hL4=;
        b=Aa8RxrwK1YX3jtVA+U6IIfwhGckHKA5xFTNcdJJa1nDBcMM2/Wo7CttEVSyyt8jG8n
         UDAG7W9al4CwWg7HT74wxKlSQa0qWWthimZA0lRIRADmr3NkNtWVDKJZp4UlBPPwMzmR
         hXcibTcGRy+UH5kW9dxF3/AUaRWowmxSNHk/ZrdHIVux5fLg8WOT/xP4dcoDzAmhtJo5
         Pg2g+eBa665HCP8wDqKPgdpip3rKzXi07V/vIIHNh8FGcU2U99IblqSyjn/t90x9SW1l
         u/RyRhLnL+zqrxWgAz0wmnZgDj54B9kYAhI7EMjwk7uCc1/SlNNMOai2I+6UepeiW2sY
         Nk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bQO2vbEqA60vEQ56UgyD3aGfkgJ8gWoiGhSb5AA0hL4=;
        b=aWWwYh8+fS8UNm5ouIWrgqrc/bjd7exzuTejUEeqNTii06og819RLqSuWAe/eVrnpR
         7PS8Nsw58+z24aez0P62Es2XZhdTrLUZuym8QooxySp7NbURXmLmtyJwUtoo49/cdmwY
         eMIu4ft8Bx2QCEHMmq1pdgg+bcMna73EeEGS7eGrEYpukFnsVHZABmP+7tToK6+bw9r5
         2KITynH22OMvVn7Ydkd94it+a8Vibit1saU4bLbnRMKcW/reM5yEAQGzoon+17QCe9iy
         i5bX1uDglrt6TeQVWWOx/lHETrM9vOzrL4EvR7Dr2VTKefbQWR3XiCe2h4dNUONRpdPe
         Sq4A==
X-Gm-Message-State: APjAAAUVD9ElsbLBWhUmwrYwVQWa0ZfEIwCrYI1sVsBul7sCmz45hP6O
	biIG47yOU1zAUSnGkeRQDaQ=
X-Google-Smtp-Source: APXvYqwwKPTpjzKJy0qtyttsk+W/Vcac8R7HHZXn530Mm8/Fx+3sYsT9EiyuYxHkMCOvbYd7VO46vQ==
X-Received: by 2002:a6b:8fd1:: with SMTP id r200mr27220999iod.142.1558646202526;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:51c4:: with SMTP id s187ls661277jaa.7.gmail; Thu, 23 May
 2019 14:16:41 -0700 (PDT)
X-Received: by 2002:a02:ad09:: with SMTP id s9mr25672498jan.17.1558646201944;
        Thu, 23 May 2019 14:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558646201; cv=none;
        d=google.com; s=arc-20160816;
        b=uErxE6bOyYCp/Tu0IqsXMDv5QaJzq73lE7IfYhkRgfNgTLMGFGi21MSUcaYBON/Wlm
         t+IKySEMagkYSbUKtuhahEcx0G+72fRYW5XvLu+yIAmtn/opttLKHxqpoxRlNCHryu8i
         rXEzRxUvxyNtQ0wYvIRo+s5bTIZv+ghLj/sQHLfoQ3T2NgeuA09uO/a2bCS4VUmq12lH
         ZLjcJtyQR86SQ2txVBZ4AxG7EC6/E/bluFu+ZiYE8KroIawGK1T9rD6sNvZL8A+Poa/V
         98C/Wq4xoe2pt6lC2kVbL1555Rv2mSnkOKd4zWh0jNuP9nXLrfp4MLAWAxsOC5CFaHDD
         HIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=e5ZPKd4egI7u2M/enEiP8yl3fPSTBTaG+wBPYUzIvYU=;
        b=hIP9Eqq+BTosU39Xk9Nkyk09hGE0ZyxWOhHJoRskiShM7r+jgN6bkrs5LoMMTQ6duG
         tilCVFh0YPrd0znSnz4V4S/cwq6ucWB4lmwebdXCnIZE5RQdVsZ+sOgJA1+T0JBG6A9Q
         4FwwEb1zInxN9izOUUuLN4q50Cr/i2ZHFJOUIorzJDM6rhbgbGDWGu/XduRiylHwz8Gg
         q1JXKboUEE98LMSqLhXocPKtxtgjqTF/W5LDtxWIDV410ICw13Cf6M3OKk6x9f1Huuiz
         mHeRvz7EV7yHmsjFn+6ewqOwVKRLJQ0IjN8eoBbbpjRamQGnlxQ2fk922ySBAoUhBcID
         qtzQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DZNsxoIy;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id y3si36606ioy.2.2019.05.23.14.16.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 14:16:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfPC066838;
	Thu, 23 May 2019 16:16:41 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NLGf40022031
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2019 16:16:41 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 16:16:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 16:16:41 -0500
Received: from NiksLab.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfOX116843;
	Thu, 23 May 2019 16:16:41 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH 0/5] Initial support for j721-evm board
Date: Thu, 23 May 2019 16:16:18 -0500
Message-ID: <20190523211623.9718-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=DZNsxoIy;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

This series adds support for the Texas Instrument's j721e-evm board.
The J721E SoC belongs to the K3 Multicore SoC architecture platform
for automotive applications such as infotainment, cluster, premium
Audio, Gateway, industrial and a range of broad market applications.


Lokesh Vutla (1):
  ci, Documentation: Add TI's K3 specific configs

Nikhil Devshatwar (4):
  configs: arm64: Add support for k3-j721-evm board
  configs: arm64: Add gic and uart demos for j721-evm board
  configs: arm64: Add Linux demo for j721-evm board
  inmates: uart-8250: Add MDR quirk for enabling UART

 ci/jailhouse-config-k3.h                  |   2 +
 configs/arm64/dts/inmate-k3-j721e-evm.dts | 180 +++++++++++++++
 configs/arm64/k3-j721e-evm-gic-demo.c     |  72 ++++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 163 ++++++++++++++
 configs/arm64/k3-j721e-evm-uart-demo.c    |  72 ++++++
 configs/arm64/k3-j721e-evm.c              | 254 ++++++++++++++++++++++
 inmates/lib/uart-8250.c                   |   4 +
 7 files changed, 747 insertions(+)
 create mode 100644 ci/jailhouse-config-k3.h
 create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
 create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190523211623.9718-1-nikhil.nd%40ti.com.
For more options, visit https://groups.google.com/d/optout.
