Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBT7P7XWAKGQEYT23VUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id EB749D3057
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 20:26:24 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id a18sf5282428ybe.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 11:26:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570731983; cv=pass;
        d=google.com; s=arc-20160816;
        b=arXmE48VkVl0FTTBZ+j2bW/Bk+6CE2p7BwKRWp+21NvRHYrQppsL7uluwMbcdjR18G
         vb8MwzvOUz9cl0XpJpkpVmesV0TnWGdYE7Y/iGqB8Pr7+v6zjNdEQamUcYTx0KHJjibT
         z5Wuqw+pkSbNqtGGi4LxiQ6CA+qZCSW2a4UaRmMtgci3bCcbu6NvYhZbMTHO6cpK1txU
         Lfl0XQ7yQhO7FZ/kk5TiQvv+5mvwcj+C9vw4yeti3jp3+x6tFdYGPXjPltgqZjPKyAu4
         nnxnJy1FKRJN5qwlAJQekFve7rqOpFVweJbj/I8Von5Oq0XnT1VSNUlj2PQ3PF9+Cx6h
         DraQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=iFxrL1lOm5OSrcR4SIfHo+kzD89SQa6nZkppctWlbyQ=;
        b=AGjJxK8ulxYdDVZEGluFJPKX+nphh3ZthHZDpXFzQETlwQSISs81fnwxdFbFyLiuDR
         l3NcqF5mTSbrz8gs0osFizfD888mmMTaWXSb/dNBa6IzGWPVqGIWrxYnM42/x3JMHknn
         gYsJvBBeJSMkvazJizD8/rH6fRjx95D7QtaKzR1qmOIflXCab7oDT61n7Z1sGZ4hqNfo
         xcb3ROD+3nUF7Uh1ucaikZPtWJ9ht8x7cQ0jx9gBiUEJg40RfRz9vTCGaQRjhPpi0PCI
         ftsl9tDlyJ7vKax/p6etO4nnhkV4pGtefTP+xgvgJlcKMwyAPXJS+CMxOER3bV9j8xuD
         +BSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="NY0d/EyB";
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=iFxrL1lOm5OSrcR4SIfHo+kzD89SQa6nZkppctWlbyQ=;
        b=K0XiG5tzA/qodyK17fuPXzbFTEq7oL1K8bKznO2qhIYEO7BFndHWOGk4TEE1yU/o21
         +r7u9XWSG8Rf3mALVxlrXCvzyiRxhFUlsow/5Ev7evGRzjlL+mcTD0IkEIrPC/yka0v2
         CmqnqQ4fJIgSbBUPuDVFqwF5OrkANnCDQf0livAOG2Swgm6NN4OerYPXwAzzEcqR6S3M
         kGjkezuS+ncc5TVwQQyMr6Ku+NY5FHWgY7iFfjS4eh0OyDqSEU6QnwLoEbBAgeK0tLXE
         9LJsto2rn8Jju2NM+bKebHEZXpucSCQoF00C8VcwBDNL1BMjR4D6AQpld1V/9FVe0p9P
         z7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iFxrL1lOm5OSrcR4SIfHo+kzD89SQa6nZkppctWlbyQ=;
        b=eRo4uBtABNstuKfPDxCozq64bWPCvUUwFlHkNrDhj47pTXi6fU1cVvEuRafEGarzul
         gVR7LQjGEaxVIkIDsp09h+Ep9WfIGlYosDnrQ2EW39N+gTfjqa2rKIwOW2qeP/JuqOEU
         G1tspkQQeApI9HhBGyp/1h6I76hEofYeGqPnuNrTdl0dm+1Y1upy/lhM/VSgKoluDnLD
         WJFbZmP5rD9C6kRphu+rCBQSBeM8X/qSmRFsEfKm6fZeWyOmdiY/bv4lvOVt+aV9Xcsd
         qXk+prFMLqyAZDx9EV8cZ6+vvwZJPO0VgJPWlXirmAD03OAeGkV9Yc2qQ/FrNnE+XXUD
         t7ZA==
X-Gm-Message-State: APjAAAXFtYbp/TFxwgvN+OK9gTq14w9bNZu5COFzoyEnSdOU9P00U6tt
	3/vFXwHkYFN/DRLEfYhVanM=
X-Google-Smtp-Source: APXvYqyCwLXj2TPZiU6RHBMfAY4/MVgNaOvdZF7SGRpp1EBdbEXaEJddfkbnbzamsRO8u0ry8bEDIw==
X-Received: by 2002:a81:6c4c:: with SMTP id h73mr7622205ywc.262.1570731983691;
        Thu, 10 Oct 2019 11:26:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:148a:: with SMTP id 132ls367084ywu.16.gmail; Thu, 10 Oct
 2019 11:26:23 -0700 (PDT)
X-Received: by 2002:a81:7004:: with SMTP id l4mr8587325ywc.462.1570731983038;
        Thu, 10 Oct 2019 11:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570731983; cv=none;
        d=google.com; s=arc-20160816;
        b=0yY0/dPB8Ys3/Javae3RLX9+pIVM2ew6kp8l2IiQCBidfDn6pwXqwiCkXBsa7SAMgq
         dZ3mnf+NG5b1+ztW83YV+MfQKvReG0WSlERxHqGq/yMBkR9lg85Ge8goy3qwF6OQzqzx
         xb9VAMNglx+uhs4LjVWHPe68FwmzE1gp9h7ZgvDI8e9o6IhQDSxZm5hfWHYalKpH8I6h
         C7dDzQ+e4ODpttXMJnb6WYSLC9G7VWYlf1EB4jUYBmth/E8ICsP5e0ubahGYCWDT0Fsu
         F6hafrcyU3zE0iIjVtrgy8lahJRnN8w+At4x5pOc0OhswG9aCgT2EjXtAtp22kHoDT40
         pZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Yb1OHkA9/mZhCYeix374Fre0FNOccwlFG5R045GMLUA=;
        b=QClL3Prbi1ReQ8Cc+CGZsC3b1XAWE8MK8ZTKvrqAi78+SOEtnFNe5CFDyKBu03mcty
         v2WlMX7pzeHZFVas2oWXQ/LSqHkUqjOemumK/89l+tjwhXikfZiKnZkkbWqeyxhh6ps5
         ySZqiwm90x/jXwZmaYVUKkNPUO76DR3LLPB7MXS5OwP+b4ut0BtEdxhNRCdQ6ddynDBy
         y5ATmd+Vg0GwzzVvq5qnCIGG6lyscrH98IwW4LGA+q/8hDTm0PzBTxUY71vrToyy2s9/
         UK/TCPsXHs1OUW44oAywvtTYlMxVXuZoTjvY9yFL9N1lbmHgT3N+SYi+e+V2TbllueM2
         knhg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="NY0d/EyB";
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id p140si668435ywg.4.2019.10.10.11.26.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 11:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQMks009537;
	Thu, 10 Oct 2019 13:26:22 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQMfD055716;
	Thu, 10 Oct 2019 13:26:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 13:26:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 13:26:22 -0500
Received: from uda0794637.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQLl0008251;
	Thu, 10 Oct 2019 13:26:21 -0500
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH 0/4] Introduce Support for TI AM57xx SOC
Date: Thu, 10 Oct 2019 14:20:46 -0400
Message-ID: <1570731650-5335-1-git-send-email-vitalya@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="NY0d/EyB";       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

This series introduces support for Texas Instruments Am57XX SOC.
Based on original design implemented by Jan Kiszka.

Vitaly Andrianov (4):
  core: make suspend_cpu() public
  core: add weak attribute to arch_handle_smc()
  arm: am57xx: introduce support for TI am57xx SOC
  config: add config files for am572x-evm

 configs/arm/am57xx-evm-gic-demo.c            |  76 ++++++++++
 configs/arm/am57xx-evm-uart-demo.c           |  76 ++++++++++
 configs/arm/am57xx-evm.c                     | 205 +++++++++++++++++++++++++++
 hypervisor/arch/arm/Kbuild                   |   2 +
 hypervisor/arch/arm/am57xx.c                 |  98 +++++++++++++
 hypervisor/arch/arm/include/arch/asm/traps.h |   3 +
 hypervisor/arch/arm/traps.c                  |   2 +-
 hypervisor/control.c                         |   2 +-
 hypervisor/include/jailhouse/control.h       |  21 +++
 9 files changed, 483 insertions(+), 2 deletions(-)
 create mode 100644 configs/arm/am57xx-evm-gic-demo.c
 create mode 100644 configs/arm/am57xx-evm-uart-demo.c
 create mode 100644 configs/arm/am57xx-evm.c
 create mode 100644 hypervisor/arch/arm/am57xx.c

-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1570731650-5335-1-git-send-email-vitalya%40ti.com.
