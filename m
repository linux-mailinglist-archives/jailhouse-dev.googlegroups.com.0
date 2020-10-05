Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7D5L5QKGQE4NMQOXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id C35BF283027
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:55 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 13sf2018008wmf.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876395; cv=pass;
        d=google.com; s=arc-20160816;
        b=tEzVYHwT5QxQvTsMXFFwHoom1zuajNyvVb2+zVDWnWbTi32D6aNor8tLN3fjJ2g7n6
         APviD6haRoY5nuD1nKHQSGheMIcB5c9C8hDacygnyU1+CdmO9qeeq7V7SjbU2Xuct8/j
         KhAH6pI9JpKP5FcUYpIfDoiZv9hOa9KPXs4ggmSmfVgPqUHN20mPG3Y3ebaMfem/Ibfp
         ENQejtMbTXFMoZdtAKGzrLbNc5cQvBzMd8cmwuj18sy1eY2sDzyu9Mv1loKFhB4TcUAs
         icDPsbipGRle5mze2mEO0gNaJDxDl8hytnUXBDxtpRGpWIdQE9z7Qj6eYjbko7zJTnen
         DYFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=u1kEpaQNP4dk+c5CkyhOPt+yPy7xY7vNAGnWflNOF+Y=;
        b=NrtwiEBiVOvAyj4QmtZhxRScaVUp9arrCi2EW0nmF8j0wd0V+WJCOsZrxfokMr5qsz
         KmwXH1z7dNz1BvfaEYB68SgcnnN2bGqZAhX/h2j40ctsuBVQRi/qpkty0pUCC/7B1I56
         D2bJ4ypyJ8Pya7SIARKU6TIPTbA9VBYopD4qagDpRbRAHBurtnzccclpsbbjMQOrUN9m
         tABg3BnKNlPPqKPvfzrLxitF01QJVN0DrOHLEudp3vqjoLSDAD1yDkAyU1rJBnnCIr2X
         m7KVDU8rv22xs2X2lzxjOa4hGkNV6Ms2BvBrabjiPW4jq92FHsFPRbbuyeD33aOB86qq
         f0kQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u1kEpaQNP4dk+c5CkyhOPt+yPy7xY7vNAGnWflNOF+Y=;
        b=BrPPAsKk/Ihv4PKE/ojZQ6ohLaQ9jXhxHG3ZsVf5uiFHsuG/aomvOOfjnmvznE+RXW
         Bj76Edv6lYX/zIrrjEWCx/RzC3WdAAyT1oo28C2rErFVaq48yeMh/yLSXybZq+kNIaAi
         Cd/ys13OSKTomwtfIjAXViz9+ejA3LAdU7Rhzvydbvg93VyTXcun0uDIKTs864VOD3PE
         MY+dBZqMjxMqQ3Hk08+LY5R4JeCxQT296KHNXrQJw6+cWH5rFFrcMkyBWq4QBJwg8Pha
         Nq0I2KiWARpmb/RvciJdWMT+JtUO/VjrWiZaQjGQ0xngH/hznh/hyEWibXGmau8Cc4Ml
         3cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u1kEpaQNP4dk+c5CkyhOPt+yPy7xY7vNAGnWflNOF+Y=;
        b=dYUJmfuAo/e/Yw3oIHTfTIl61pmB0bCCiXpgrh25m3kOk9hEDtshJq+Uxa1wKRdaL0
         lGOidl7OuLDWLVo7v6hnVPVHvvB3JVeIcrKWAD0/p//mvOz1b05B9lz5eKamhQBMmbJb
         c978TgmDNVrz+EIt+oD0e/r+yprPxcHl7sN7DWzOa+69ZQSQKRoclIGz/wuDq/eWrB2g
         GcKno2J2LVMzD6vj+Pr8PmffmdRQLfC3uC4rgj5allJyDVrundyg6ttNVP37uWk7WTMc
         X8QXNGWeM03UxF2VyEpUvkjAh42MO3xCQzNcS2Im4Kz6L4tVZ0D1sDOXlCKCu9UEcay/
         9sQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530gtyWHUWjMzmSDhBfR6t4keb3ePLVZeHJkmgDtz4lL3TtCHcBk
	mItlv07ex4b3JDIz8EgV5bQ=
X-Google-Smtp-Source: ABdhPJwXnriN15qtul1juJhoynuwPFtnfQLSQf/YVwiETY4z114+jdS/SJvN1G3pcWuTD3/ZL7vcXA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr7643885wru.193.1601876395577;
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9986:: with SMTP id b128ls4097187wme.3.canary-gmail;
 Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
X-Received: by 2002:a7b:c750:: with SMTP id w16mr15217071wmk.16.1601876394394;
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876394; cv=none;
        d=google.com; s=arc-20160816;
        b=WOK7WwwoMZfHtO/7nyRgp1uMhN6r5aKjmUKpHnD/Qu/eI/IbZKGV6ZiQOwSf1hwTCd
         VDgl0IpZpJzZi8jDqftZQOhBQctSf7mxZYkhoTPw1jnCBdWBHsB5VxYJCdwwOWKhwElF
         06ucLhErsh3PvVNYYZbzf+Z05PNgkZgZE4mr5DzQuvzgegthyH8Rz7AJEWK6gW2H20sL
         snMtiXHzHm2MiTk/y6BoqLExHyJ/MIkoR5KNdn25RJuvMIhKgSw57/FubQ/7GI2QuP18
         bHw3fjkilwr3iFeKXJbz5eX5SLmpOXS1B6anThG8EdK89ZD40NUWzWWU0csBgXnAVAHT
         sPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0CMfgT4fE8G+vMRMfr4MzsPVkiWLYgduKPFVGpSsAhI=;
        b=iXWF388eihzZnPKiAh2no1C0wD1wgJQwJ25TFUW83BlPZEBP9t0rlQS0oouB4PZMOt
         +Z9M+FlEdq8saqmwxCq6fYw7t/YHDDJzAxhyiAUDA+qEZ52ylRpWRb8pm3F24I2vNlrF
         F+I3dJe088BJawt/83HCsKrotMppEWUAd24Mj+/j6eHR4LpX01Og6ef2bUPAKW8+9mYT
         DEQ2x4TVCEVT9J5HiZmp6nPIZDn/pke9LyqS0C+uw6IBkGkdT3vF4WS1KsWhQcYT8cU6
         VHfjr3bGdQxXDCf9IjdHjw+AS2gWw8hF9HHHxFNwKghqvzhXcjW7F0bR9wuB4560YO7U
         mqpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id k3si176563wrl.5.2020.10.04.22.39.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0955drup000949
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncM025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 13/19] Consolidate PREFERRED_PROVIDER_u-boot
Date: Mon,  5 Oct 2020 07:39:43 +0200
Message-Id: <aecf76e9307f0d3b2e8a5990e36fff70afa520f1.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

We have a regular schema here, so pull that into the distro conf.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf | 2 ++
 conf/machine/macchiatobin.conf  | 2 --
 conf/machine/pine64-plus.conf   | 1 -
 conf/machine/ultra96.inc        | 2 --
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 116b253..eeb5ea3 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -17,6 +17,8 @@ WKS_FILE ?= "${MACHINE}.wks"
 
 PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.12"
 
+PREFERRED_PROVIDER_u-boot-${MACHINE} ?= "u-boot-${MACHINE}"
+
 USERS += "root"
 # 'root'
 USER_root[password] = "oC3wEGl799tZU"
diff --git a/conf/machine/macchiatobin.conf b/conf/machine/macchiatobin.conf
index 733960c..4829500 100644
--- a/conf/machine/macchiatobin.conf
+++ b/conf/machine/macchiatobin.conf
@@ -16,5 +16,3 @@ IMAGER_INSTALL += "u-boot-macchiatobin"
 IMAGER_BUILD_DEPS += "u-boot-macchiatobin"
 
 IMAGE_INSTALL += "u-boot-script"
-
-PREFERRED_PROVIDER_u-boot-macchiatobin = "u-boot-macchiatobin"
diff --git a/conf/machine/pine64-plus.conf b/conf/machine/pine64-plus.conf
index 0949ab4..8070b8e 100644
--- a/conf/machine/pine64-plus.conf
+++ b/conf/machine/pine64-plus.conf
@@ -14,6 +14,5 @@ DISTRO_ARCH = "arm64"
 IMAGE_TYPE = "wic-img"
 IMAGER_INSTALL += "u-boot-pine64-plus"
 IMAGER_BUILD_DEPS += "u-boot-pine64-plus"
-PREFERRED_PROVIDER_u-boot-pine64-plus = "u-boot-pine64-plus"
 
 IMAGE_INSTALL += "u-boot-script"
diff --git a/conf/machine/ultra96.inc b/conf/machine/ultra96.inc
index 37637ad..d91ca48 100644
--- a/conf/machine/ultra96.inc
+++ b/conf/machine/ultra96.inc
@@ -19,6 +19,4 @@ IMAGE_INSTALL_append = " u-boot-script"
 
 IMAGE_BOOT_FILES = "/usr/lib/u-boot/ultra96-v${ULTRA96_VERSION}/boot.bin;boot.bin"
 
-PREFERRED_PROVIDER_u-boot-ultra96-v${ULTRA96_VERSION} = "u-boot-ultra96-v${ULTRA96_VERSION}"
-
 IMAGE_PREINSTALL_append = " firmware-ti-connectivity"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aecf76e9307f0d3b2e8a5990e36fff70afa520f1.1601876389.git.jan.kiszka%40siemens.com.
