Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUXH4OBAMGQETTDFFLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1437134502A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:23 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id w16sf28013299edc.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442322; cv=pass;
        d=google.com; s=arc-20160816;
        b=G/mM4Flaaru1vHNSi2m/Ivd2+KnPpURg0FLziL3lE53P1o7W4SQQfkoQiAMAOVwkZd
         29436ZVtYjtP4nfC+fQ1NVPYlA5cPZi+sWRThPK//8Y5H50hmAq5Lx0eTJbQLA4tyeI0
         ucooljxk+pfi3yUZCzu193appba1ZOsSkBOxhZjHurmjmEcHCPDQjuv/29hO6+MFkcy0
         lyab9fVjYHGjmjIexFiumBhYQ4bLp1ywQLVPShx7qKEkDi5ppt7Lf5qgPJ3gPf7utCCJ
         mKFnr1n+SAFEO7/a2JpRaQ7yP1izt5icH0xYOykBPZiKLhuQ4r/NjMUGWdNgV9skyBBv
         W52Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=5VVgfROdzCrbwt4OkyzVJ4HcVIopl26xWy7eGEliL4k=;
        b=acVckqTDN9iSHu3fks4WzLqb1LOUL0i7K0hKxDk65JUYtcvmFcZSrnd3P/gXRJiY13
         1hLO2vi12PvYtCbikzTQgxEhN65BTyw3Ng0Qwsxse70ugpRfcJR08gQXLzVG+d43a/F+
         /2vFBxYJV/CJ8YWsT15bkIBGxgMPB4LYa8AXSsrjXvZMNbs12LnMAPHWSXd1Ucw1Ub2d
         HCeJkEMhfy61XQh539fJnva5H006asnQuM3suNPC6YJXDcZBN97sOzLtqucM0GvyyWM6
         xt01vEPcJuLLovBLDoWBITKIBEjejJVFdNKuMrJE+ulhLzDEIEi/3jDO+aRoak9FK1Mc
         TdYQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="WmJlAVJ/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5VVgfROdzCrbwt4OkyzVJ4HcVIopl26xWy7eGEliL4k=;
        b=pmQrPaOEzowxXXEulQ2JqPZxLy+N80Uomh1fEtUHWgsUDsMaTCIsFts5fFDMUkwzRE
         XaT/70gKG3EjL4+TTxZh5v4J26fLV/qGIcYfXMWe3T4sGgLJLamVeQBSiy0Aiel5w6Da
         eawr+mvmUhiZWGIK7DvyJBEZKoCTQxZkulMC5KB8Xyq4dIWmw7PXkMcjb9HkbyyqZ9x5
         v0RO+pj+Z/QeibU9bZLjpZgQDZmjsThR4yxBEZU3GX5JO2HQzLMQNlGac7f4jrPenP0R
         aAHfxQ4YBzzX1NKtvUTm26zvhGPLT3J4h0eRJXGrSHtElbiLTkF42sX3vlrslEvFcXzz
         kRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5VVgfROdzCrbwt4OkyzVJ4HcVIopl26xWy7eGEliL4k=;
        b=mebv7G2LgnQ9YNIsVcINOffA8ewnLT9fl7OdRBV+1seZzFPT3ywFjpNVj0LgIceGJz
         5Q6ovZ8F5yqyzKJ8EzhhhqIuKtPqqykQm/viWJ0kjy+qz6vBS+iznwCdfqRNGb6RzNDJ
         d2t1jF4m5ZbPumAR5JiupKQpOBUqYrgkjptMcCurHV5EPHmBUG/IX5z2NZ4cYJWSo+ZL
         qGScAQPgL0K4x5GeDpt+24kL5OSOsfU6CgieVWW3PxoHbl8icTe+r4HtAw+2WWdVPkxK
         KHXfjsM4U07Cwdlv4uzOmxP3jnjDTcABNXNFqD1tXeoG9eXwLgnbp6FAPktzostvsTf/
         2Y8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533KHNa/ybbgmwEg1VqNfJ842XJGmkHKujJMy6X8BPi9HsHG+rIX
	cABvHPnc8TPx68IITaVsVCs=
X-Google-Smtp-Source: ABdhPJwyUAMGPGtiYiF16NfIO36ntcExUk06QC0JyI/ilZ58CZucZEzDHM2Js8GFBhpUZbSru4f5JQ==
X-Received: by 2002:a17:906:6817:: with SMTP id k23mr1399942ejr.6.1616442322825;
        Mon, 22 Mar 2021 12:45:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:41a:: with SMTP id d26ls7888178eja.3.gmail; Mon, 22
 Mar 2021 12:45:21 -0700 (PDT)
X-Received: by 2002:a17:906:a1c5:: with SMTP id bx5mr1485423ejb.166.1616442321889;
        Mon, 22 Mar 2021 12:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442321; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjqqYFt0Vrg7iZuhCfrLcgc604aDRopk7NRhQWBdwlT5v2Uz+anbqU4ms8KMgygUvS
         bDHLI86iENTvPaW7wAnUEYAl2TfKwtyAEWl6oiI/WuGtH9QIfTjHQ11OCYVBKznFIzk0
         6l35U4+X33tcp0U1DPZhuROfYSBL6CDuk35tx5EHtf3UEcpmqjMFGoFawr5CeCNjfGnp
         6mQtLggXUvhIyaFpPNTXNVT7XxbTCxYLzM9EN2TlE6Beika0HNI4m7NpTLLHZ3dCEul1
         xJdHDdyXvwbqi1dvUODdTBk5UCxzpvlE3Fse8XgRk7ReT+kNYtAh8cF+J9kvw1T0YFZh
         CO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=mEY07ukO/zmIg8vwx/w2+NR1Qk080TPJSuBXqaFp/b0=;
        b=beWkO9egqYm6iWgMY5IOjpBgYMqc4/ILVg4UEEqh50XeJ25Hh6gnJ23CjIa3OrrnoD
         xvQOaEiRuUOqXOIj5s4dUkQiBOUdk4yoHls3AHPAqHDv2q9g0DaeSTMVqUNCFqveEr5z
         LdkxEK8cF9xsUm+CcZebvzuZ0oK/nhbQ6rAJj1YViwxSMd5e7sBa9Jw6TP64E/GxqxfE
         lzKU2jz1QyeCdZBGSized/LYjv0/Y9JGuTjnKFpLZs5nxNvVyNSMwFVflxTgJjRB8KEB
         Q9QOn21/+dnxlyleNUAw6Kf1qvyMUFxoKHke7jPJPHy1A+bL7xGryW+3LI2aNHxOMHSJ
         RYKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="WmJlAVJ/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id df17si688263edb.3.2021.03.22.12.45.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jF3yKWzyVB;
	Mon, 22 Mar 2021 20:45:21 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_URL_PLAIN_SINGLE=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 94Z0icB7N5wU; Mon, 22 Mar 2021 20:45:20 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jD2BY6zyV4;
	Mon, 22 Mar 2021 20:45:20 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 0/9] Cache-coloring (normal ioremap version)
Date: Mon, 22 Mar 2021 20:44:58 +0100
Message-Id: <20210322194507.82643-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="WmJlAVJ/";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

The version v2.2 of the coloring.

Andrea Bastoni (7):
  arm-common: bitops: add most-significant-bit operation
  include: cache-partitioning via coloring, add configuration
  driver: colored memory regions: add temporary ioremap offset
  hypervisor: arm64, arm-common: add cache-partitioning via coloring
  configs: arm64: add example configuration for colored ZCU102 inmate
  configs: arm64: add coloring example for qemu-arm64
  configs: arm64: hook-in coloring parameters for ZCU102

Luca Miccio (2):
  pyjailhouse: add support for colored regions
  Documentation: add description and usage of cache coloring support

 Documentation/cache-coloring.md               | 198 ++++++++++++++++++
 configs/arm64/qemu-arm64-inmate-demo-col.c    | 134 ++++++++++++
 configs/arm64/qemu-arm64.c                    |   4 +
 configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
 configs/arm64/zynqmp-zcu102.c                 |   4 +
 driver/cell.c                                 |  10 +-
 driver/cell.h                                 |   1 +
 driver/main.c                                 |   4 +
 .../arch/arm-common/include/asm/bitops.h      |  10 +
 .../arch/arm-common/include/asm/coloring.h    |  45 ++++
 .../arch/arm-common/include/asm/dcaches.h     |   8 +
 hypervisor/arch/arm-common/mmu_cell.c         |  68 ++++--
 hypervisor/arch/arm64/Kbuild                  |   1 +
 hypervisor/arch/arm64/coloring.c              | 108 ++++++++++
 hypervisor/arch/arm64/include/asm/coloring.h  | 155 ++++++++++++++
 hypervisor/arch/arm64/setup.c                 |   3 +
 hypervisor/control.c                          |  23 +-
 hypervisor/include/jailhouse/control.h        |   4 +
 include/jailhouse/cell-config.h               |  13 ++
 include/jailhouse/coloring.h                  |  39 ++++
 pyjailhouse/config_parser.py                  |   9 +-
 21 files changed, 889 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/cache-coloring.md
 create mode 100644 configs/arm64/qemu-arm64-inmate-demo-col.c
 create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
 create mode 100644 hypervisor/arch/arm-common/include/asm/coloring.h
 create mode 100644 hypervisor/arch/arm64/coloring.c
 create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
 create mode 100644 include/jailhouse/coloring.h

-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-1-andrea.bastoni%40tum.de.
