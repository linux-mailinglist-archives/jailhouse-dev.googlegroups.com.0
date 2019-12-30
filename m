Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBMHVU7YAKGQEVYREBJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3e.google.com (mail-vs1-xe3e.google.com [IPv6:2607:f8b0:4864:20::e3e])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DF712D03E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 14:25:05 +0100 (CET)
Received: by mail-vs1-xe3e.google.com with SMTP id r12sf3389285vso.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 05:25:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577712304; cv=pass;
        d=google.com; s=arc-20160816;
        b=sjw6/i7kzanVTtInFiQA3//1uKmV5kmMWZnAkfp5qy4k/fNOMZ5jXtdO6yVNXUUz/2
         +itq2VJlU1xYZZBiJAZ7y2TD2q4LWOBVB7HRkaySUO0SO5DtBVA7vv54ADjiNF5jpR0w
         oZeQZTjbSW3LJPzYI0QO6XMGFzBbc3tUOfUEVNNYExSsiWpu2MbJSpivRKzwC13tCJ8F
         UbpU9quWLX9Ci7l6ZjG5b3cpRMps17oDUPSc+9AAi11dboK0Y04LOnbJbpGqGQX4I8O7
         g4t6Y6S6oJSyhLWlQiTWqLj0tbpiA/hvU6B9E1Oku5avc2IjIyqS0x/hhZBnQICbxVAF
         tc+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=jdo9NQKeIhvgH5X2YzdH8zGQxuPQEuDD4mb1ZfIy1HA=;
        b=EZGA8UzOY/llfejsrpcs4YuwRVeSyzO25TVCumdNd2DVZytvh+jWMHMxFJ9TK4o9x4
         TT+OJp9JGTfj/8bttXwxr2UE5HRn8Hour2KrS3V834hoUfkFaac2hOAJd93qsef2IZIU
         0WXQPsKdguAjj/MgNc8gnRS3a9TE3v2JjEmK0vTpkAf17h/fmj/ApGQAR4xPjkXz+bV+
         vN2Tscmetuwmt17Tr0vDFzmZ6iY/4dTuMkJSztv1ukTVDXsMUQ438ZMMja6Hz3/GWftq
         +dppGIuCEdJBNbAogkcKAnRGevAN9nQmJqYr0vgC1XWQvdYu4mBloFAkVXNI6CLA8Lyn
         zi7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vKFgv5N2;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=jdo9NQKeIhvgH5X2YzdH8zGQxuPQEuDD4mb1ZfIy1HA=;
        b=pRj4pP1z4Il7vy8Sqsi1zfhpA1fRcZM79Qy7swPZew/3Q5Gbl3d6JUDWRMFi39vWrB
         95ojaC9aABVHlujCb4+CdAoQu9W49VkctiKMfmh7DYcSa0AucteU1lD34AwaU5zfIXz7
         BvbSn0mAr1DojAgK9kBANx/+2CELB/inLa6wNrw2mAUBpSfRIlWN+i2Bt0w7PQhTrukU
         Pn6GcbqZtfyasQSMeG5wSyxLz1TjCYGpVN3KTxKFlZzSooQbZgIFa3JxVWVnak8A0b1e
         P7a0x2rfEZVMK4Wh/G9tAYmG9YCblGgZLZGeCySz/uHU0nA/lrIr6mx8jqkZhnCVdFT7
         pKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jdo9NQKeIhvgH5X2YzdH8zGQxuPQEuDD4mb1ZfIy1HA=;
        b=qYGmMSMKhKrGzyLZH/u5EN1nlg0vTcJshZDurl3pjS+/3BRt/2raG3FeLEFL+tJlsq
         Rp9BBsNdK7yD+/rNIvKiEW+clujdf5tuIEpMIVTyrngixr+MTodN0Vv37zYBtn/oFza8
         c12JaxWVeGfjZ/yaUbjNB0dLGWcDINmYOwynyklE6eNP622zSGWXqhmffgFdRu+2W+s4
         tg7yGMc8r0wXe/1grQBozyAObDbPbbmrdLwNe3IMkrEk/VujN+3idQX57ISzC/UQmUSA
         fijt++spOUsfdoFQjIgG1rylGXauSzufeuriAntlpWClEnrXLTJEhMyDkA91A1YQETKN
         ScVg==
X-Gm-Message-State: APjAAAViIbL44/y4478Gp707vrpwpWHQNngi1M+C5Uvyh4zeMs5xstd9
	SMC/DMhI0nxFGY4l4bba9g4=
X-Google-Smtp-Source: APXvYqxFGzoTV0eTvBXNDNEp5Ui0bWOYTI8kSZ/ugO9FDDo3/5f485vTJMQPzDiPs6uqsft9sfVU/g==
X-Received: by 2002:a67:e3b1:: with SMTP id j17mr29418346vsm.209.1577712304764;
        Mon, 30 Dec 2019 05:25:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9f:2883:: with SMTP id d3ls1728508uad.6.gmail; Mon, 30 Dec
 2019 05:25:04 -0800 (PST)
X-Received: by 2002:ab0:648b:: with SMTP id p11mr29469005uam.67.1577712304313;
        Mon, 30 Dec 2019 05:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577712304; cv=none;
        d=google.com; s=arc-20160816;
        b=BjYkt3PcJl2s37bvfW4nwSI7ourFKDlnu/F2PQRJ7LxZ8JdOgVREwY/Ae+oDqTrhqO
         ywj4O9j1njYjV/HUcsPCi6+jeNVLg9WWOiDUhlNd8sOx23oaKk2DsmsqafVz5Yc3eDfD
         r3FWa5wFDzzFbB8Aa1AKS48HafSLGHvKVbV8mCC2gb+wcQlXFNOEAUWCxIATxhW9rmPt
         Wv01aZ1IJU5gC/XM0RW+E+zQX/qgMhbVQ5jqBZRbsICcDOJvwd2CL4h/04nBN0loJHjC
         TgoS41TT8qBD2E/PNJwAwe0E0EYIhFdrboSzGpbwep7dP/q8cDUnL8sQvmABOwyWX7cU
         v3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zZ/iRTt3YDJXFqVU53wOkeqzkLVuyxX4nx/Wb2U2y3c=;
        b=0LSyOdA34DtwkXt3hZwsZTJtKVd51l3nK2WBmFIeXLIgaDLS4UASV+Y8g7Zvrs43bX
         5mLe5GhTtsz7JLUlaBeEjBU9rYMcrU/Tp7N54jakzNiSNElrSoxj3CPkfmrcr8YEprtF
         k20hm2ZkjwP7ahcDPjExh+bt24bFc8MlTG9CW8+xGfu8pz/Okos4I4UvxExfFX1t/4GF
         nt60T/hhOQCKa8FzXN643du6MAAccDxJDZndjQ1vdRfB7NywpT78sMUuKFTN7Grx0ijx
         ubM648wFCfcxF5rm77fB8syMvt61YP5Y4+Yv/wQS+tjuiaRdCvbFhnPg/nYqu52CU2Q4
         kiYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vKFgv5N2;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id k26si1739748uao.0.2019.12.30.05.25.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Dec 2019 05:25:04 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP3VZ081982;
	Mon, 30 Dec 2019 07:25:03 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBUDP2Lo041316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Dec 2019 07:25:03 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 07:25:02 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 07:25:02 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP0oZ120516;
	Mon, 30 Dec 2019 07:25:01 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v1 0/4] Add support for Texas Instrument's Peripheral Virtualization Unit
Date: Mon, 30 Dec 2019 18:54:02 +0530
Message-ID: <20191230132406.19985-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=vKFgv5N2;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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

This series adds support for TI PVU as an iommu unit.
PVU is a 2nd stage only IOMMU which provides realtime address translation.

J721e has 3 instances of PVU and all the DMA traffic can be routed via PVU
when running inside a virtual machine.

Nikhil Devshatwar (4):
  arm64: ti-pvu: Add support for ti-pvu iommu unit
  arm64: smmu-v3: Fix crash when first iommu is not SMMUV3
  configs: arm64: k3-j721e-evm: Describe PVU IOMMU devices in
    platform_data
  configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU

 configs/arm64/k3-j721e-evm-linux-demo.c       |   7 +
 configs/arm64/k3-j721e-evm.c                  |  38 ++
 hypervisor/arch/arm-common/include/asm/cell.h |   7 +
 .../arch/arm-common/include/asm/iommu.h       |   1 +
 .../arch/arm-common/include/asm/ti-pvu.h      |  32 +
 hypervisor/arch/arm-common/iommu.c            |   9 +
 hypervisor/arch/arm64/Kbuild                  |   1 +
 hypervisor/arch/arm64/smmu-v3.c               |  20 +-
 hypervisor/arch/arm64/ti-pvu.c                | 556 ++++++++++++++++++
 hypervisor/arch/arm64/ti-pvu_priv.h           | 141 +++++
 include/jailhouse/cell-config.h               |   4 +
 11 files changed, 806 insertions(+), 10 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
 create mode 100644 hypervisor/arch/arm64/ti-pvu.c
 create mode 100644 hypervisor/arch/arm64/ti-pvu_priv.h

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191230132406.19985-1-nikhil.nd%40ti.com.
