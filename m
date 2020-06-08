Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBCFJ7D3AKGQEUAJE42A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792F1F16C6
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:35:54 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id v16sf3455919pfm.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:35:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612552; cv=pass;
        d=google.com; s=arc-20160816;
        b=08Oah3/46KdIuiZXxeEZeGAZhJfvUzcUp+xLzkIWPQL0DzJrn6TSvEIY4NFbIlxXGW
         zrxQvJ1gF6wXSSAigW0eE+eZnQrWiWeHaDi6JJ1tEI5ne9RZSjBC7eO5e5durvPr3qnp
         3apRL5toHeL1HSk1hm6D3tQcuC290sBqJIw9FrxL0ojIArqmSwu1D2HPnkSVaHN4i97Y
         DlZPfqZJ6vNU8O6CPnPqAytgy2CeMvgWybGAIy/ZZ2Vm4JEO1tdYtcpT2jvvgNRwaEHE
         5Nueb1/yq4GIbaV2jbnODqCjQifdY0fTfcc6hqJsuvVVMEDsG4542AKF6bhX0SGmN+cw
         j6iA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=CIRCUp6uARAl1Qy1q+OfGL4B63mPN6YfYENkNz/Mk7o=;
        b=X5UpvZh3f/CQJAw2WKdUptRhXMauOqxdxUNB20EN8UXXRoO5VtubK8AKT8VIhm7eWi
         rbNmopwR5MlvHf/irpMrmI61UMYSp76HztzEaVZHaT3YkJvTT7HwR1ouZjtxENnzFqIM
         5yFfvdo20aGgHDDaKSmUVpXj6Qs758jd+pcTOaRBL4z0a622/uet/i9rXWZlYSVnw+Wu
         gUDUhPEKcuGdUfIYP50tgONT30rynTneHs/8N7VmSMkuzBwA0u100m24dYNiiATjb/if
         fLQMiaI0X+tGUzu0yU2kEgdy1dIlfyw0rcc7fsfQj8uG9guW6QeZepV8Ki4tzsdEZGh8
         Xr3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MqaepOym;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=CIRCUp6uARAl1Qy1q+OfGL4B63mPN6YfYENkNz/Mk7o=;
        b=aHk96V129aUzzKiSbnWDpuAfnyLuXmyps0u8j5ZxeecC78tqdFpge8kegwrm2KKgVl
         uQEHCnvoj9PkRTfdSX7MCU+2bIkSYMg1+PWuupAXfN+qzRzf+fkvHkHfRIincxTDTWQJ
         NwcjbcXg0XF5R0Ix5uzylRYtjU0fUj+iCs0Coyc3BbzP6ELYwL2qVmNgxFzEuqZYQmhO
         t9OaSzKAsm73xHK0QbCsPuLMqaD2p1U+9IKqmwSmeDCZ3Ch58FwVXPYHwMp/D2loM4QL
         dzK3ulgburhi7RqXQ1kz6kXWvZgAHz0c7TDjYcvQvTkGuVaDZQdxU7rZ0Cx5gF1F+Gxf
         pDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CIRCUp6uARAl1Qy1q+OfGL4B63mPN6YfYENkNz/Mk7o=;
        b=CKvMMOwdL8iGYYs3czFxiHwgqUaAIDca+62kT1c9EDKfkddXNBo7HjXk++0wGlOJ++
         87OnRn98pOBy3M14wIBmsQ8BmvxyUPAPeFvpY1SnKr7FPQOCz77ry3OcvBBQwuD8KY9M
         or/ORb0zhwf5nmo+kCpYxTQ5HwtqfMhtrv9LZsnD4nhxFgKAcNtBdfNjzR8BgN0WPgaM
         Zcptgp4cfQE/AtKAjOOPxa3pC0O68l4rf/gQH7QdnNy4Oz5HDNPiG5sA4aoIeMOWkDaU
         DU7rLGTaCwOnI6zEGRRVYjdN0W4KRJ4rYn7CQ1B7Qou+tb7XPHw7h1/sByepidBKdS14
         uuDg==
X-Gm-Message-State: AOAM533tGmyOC6lJ0xJrM+Wm8MCHaxTnbXTMLlDeR/fFawltU1ngqydz
	lMh1k0mUY/KFhumNIaEbGh4=
X-Google-Smtp-Source: ABdhPJwELX4wkxXruVIigGLeQFDAJXMIoevL/6qxW0PablMhAFQ8fQ3BpOhUeiV86avlUBzKGn6k3w==
X-Received: by 2002:a17:902:7d8a:: with SMTP id a10mr19270177plm.116.1591612552656;
        Mon, 08 Jun 2020 03:35:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:e312:: with SMTP id g18ls5191786pfh.9.gmail; Mon, 08 Jun
 2020 03:35:52 -0700 (PDT)
X-Received: by 2002:a63:9e41:: with SMTP id r1mr18622047pgo.97.1591612552194;
        Mon, 08 Jun 2020 03:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612552; cv=none;
        d=google.com; s=arc-20160816;
        b=nA5r5hwnt+y3K/pyafyaHuqba2wzbXqaGYspjm9+Hu6BNn7nVHZXc1SXC3cHcNqx/i
         w80N87ma3Hi2bcJRfPG35pQRwTM5GHQVsVh8gU9Ona1LcfiHdzQo3vCUVjK7d3A/Nocg
         N/VaQCdCQHSTeXHGSa77DBYNFd3VI/yMqPkZ0dKAeH2K2UKIA8WgEKv9l1iWwuMIyTmj
         gsem8D8eT9yy0leXsApQlUVVQs7KQ8akYWhFrbjtoi458wIsZxIBTqYGLXKiRtF8aCHB
         WQ6h7wjQauvIdOsNhcsvl4XKZrEQoWcwze94Fts+R6x2KaBAY31qnusXeoRGmtkjyEbH
         Q5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6PTz1Qw44cj7WJz/i8ELwO7/SbSn3/4jlboY/aGiaWE=;
        b=LUB9Ee03GtzQSN+h12TtC7Z44tzWEUoesn9x5UwEoAs96KUjBjym7/muixfOt5oeuI
         4g5qy1kyMQWP1t37Lf13btuaYhz8XQFPKVxEOMNqO7q5tfeVMZRrJxF9ChQu5EjuiM+/
         vr8JXfO9O3tLXFNCdIsfMYQReyCDKWeUqnO0LnZ2hODndOW68yLY+cbxFlKUVz76AVoG
         4s04RyWkjngIcaFStKjnp6VKKEhXmv8dXpFVGlxxaJSF4fKDh7Vfi/f8nagf+U/4yPWl
         q08yfJBP/tAnOmDYZq3bMi2GkhYoO3KC3Me2YLszmJ991hyn2qRGAn4vQoHbChUktJVw
         DcMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MqaepOym;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id m204si433622pfd.1.2020.06.08.03.35.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058AZpvY039475;
	Mon, 8 Jun 2020 05:35:51 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058AZpHj117230
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:35:51 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:35:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:35:50 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058AZnoR122340;
	Mon, 8 Jun 2020 05:35:49 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 0/3] configs: k3-j721e-evm: Fix device partitioning issues
Date: Mon, 8 Jun 2020 16:05:45 +0530
Message-ID: <20200608103548.9040-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=MqaepOym;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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

This series fixes few issues with the jailhouse cell
config files and inmate dts.

Also, remove some obsolete device partitioning
which is no longer supported in the 5.4 kernel.
We will add only when the drivers are upstreamed to
mainline kernel.

Nikhil Devshatwar (3):
  configs: dts: inmate-k3-j721e-evm: Add pinmux for main_uart1
  configs: k3-j721e-evm-linux-demo: Add USB mem_regions
  configs: k3-j721e-evm-linux-demo: Remove unsupported device
    partitioning

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 12 ++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 79 +++++------------------
 2 files changed, 27 insertions(+), 64 deletions(-)

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608103548.9040-1-nikhil.nd%40ti.com.
