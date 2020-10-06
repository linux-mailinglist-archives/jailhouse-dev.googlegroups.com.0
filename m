Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPPG575QKGQE33IUDPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id B85262844EA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:57 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id j23sf1330779lji.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958717; cv=pass;
        d=google.com; s=arc-20160816;
        b=aagOn3/5aSvxSDCrx7Kz37P7FaVw8eJcs/zfoquR097XHhfYUkg/nnfkoG393irFIS
         UiD52i6i23OjU5tiTyEdo+tPZWkFkVgX9RnZumWNt+VLuIFxSko8EAgq15D4CHNWOATx
         E8gDYzDl7tzuoFmivFo5L6bFxZf8ECMjVkGraJM5a6YTWIJ53DxRQIiMsSMbw3KDKT+i
         Ut0A4nnF8QxJ/ww5WikRYSs8T35HCNCgh3hbggMyj8QyR8RDiEXN1PRiKEii262+d2d+
         Qa7Z5glj6G622OQCM0vu95md8yvHy/Ds9BYFKS4e9O0OXUMalR+hX63Z6MEb9fFkcC33
         wPvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=9UoDvLmD/yonEG8FY7ut9iQ62qFaRo9yuMRrZjMqL7E=;
        b=Nk7usCtJIwZXZvmemcTx4E9xAGoJIQTpGIQVYLa1ubh7LYCNCSdQV0kD9G7X4JIeNM
         eNUT4gcBykNvbMozvYLUardiBlORhpYxQTa08GvvX93OBq2/gsOBIeuAZ9MNu5EudZTz
         TlC6I72qOT5/PQalg+6QF3DhquIbR/dW3RTyww7CpNLR8X0fUjF6rvHMJiqnjoEo3m9X
         nljjFdJpAK1TGYTyAHlhOVulpK2qehqgkT950yqxxw2Ajkk1o0ATT8eoOnBXC6n4cjws
         5kFmxFp4gwWv5nQn21CVtIsmX8iGvOmnZeYG/bui+Q+DyThnmcf8bjvrboWkCOFo6jJE
         wqlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9UoDvLmD/yonEG8FY7ut9iQ62qFaRo9yuMRrZjMqL7E=;
        b=P3Y0Ey9BLsYDVIoPj53HMWy76gqShwowmww1iIXeeVqdodE3wl78Nl0o8P5FhMQ3Q+
         eTvmsFUwkCH/f4vwnzA+XY/1B/7ltaOLzOieJvB6yofbLlqNSdBVwBV1AmebdDtb1YyY
         P5DrLRnPLnSZ/uaKAjczzYCYVRs611hAYajKMMfHIzLdQIQnBaA7CzUi34ofdCTWxCdz
         PIQdFrJL2+O7jNeUgR0Rt33GiQzOqNA2ItT3s1Xh3I+tmXUYCI/UbxtvSdcuBYiGyOy1
         RG9mEv+H3Cq+kfwOr/AkdcalT5Hr+d+D+5pI0HgUQRfCKw/Tsa+J2mQQuNbpd29SHLqz
         4YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9UoDvLmD/yonEG8FY7ut9iQ62qFaRo9yuMRrZjMqL7E=;
        b=C11LhXF1gYhOPB35/2sZcVq0jSMNm2CIKzlngwudyFtjgxLIK+ynrj/HNkOtI0qa3f
         a2neptH5twLwnCNzqA2w6sqkTEYDsTXZ1rZJBt/MIXj2swUkVZh2MzWh6AeW9G+3MgYe
         md2k0xNu1Fp7CIoJ8EoxBQe88W5hzwJu1Ir3zWvx7REl5YlMdTmCBgUIsO755BYffvE8
         6ZSzCiFWzXZnpNPkIexX32w0ApdDHVO/1XSt18XQvVsnCRoJH2AuX1UrzZPglQjzXhdG
         h46CRvGvZAO20qQywS/t6HvCEypwW4tjlCwBIAINrgCiNCjKpz50P3nzkFe0wLAosYnm
         VBkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5304bBpBITKZhHFq9GCAVe1P3M6wzZkDdrWAv5wrdVTztT3Kd6tL
	6KSEIerZ0GgIJSrkBU+owzs=
X-Google-Smtp-Source: ABdhPJzvWHnx+ZXdyRgQsJPI4ZQJzJEs1+OABncuJE5/F61WrXEo9M5nYZMizcPpvpZ/zyodKNFBqw==
X-Received: by 2002:a05:651c:1033:: with SMTP id w19mr1068634ljm.9.1601958717320;
        Mon, 05 Oct 2020 21:31:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1280325lfd.3.gmail; Mon, 05
 Oct 2020 21:31:56 -0700 (PDT)
X-Received: by 2002:a19:650a:: with SMTP id z10mr891796lfb.9.1601958715988;
        Mon, 05 Oct 2020 21:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958715; cv=none;
        d=google.com; s=arc-20160816;
        b=FeMGvUbvwLJlaWwEkgj7Rx3v34Y13CbfA6xQz9vlBpylxU8CxwfYx4XIqIGCZC4jic
         zlwTGBWGG/Bgt+gzRW0/QuKkHEhyifkaGxAJWttmZAtaafi0V0PdDwT0iLipEeXux4Cm
         IoKRDGnbsGf0CTUVtNNhmyQYJxuNQ6O71Y3qyUYXoSSqwvLxS2qcvwfR1lXRzR+uxtd+
         YaPxk3s/iXvVIlxkqqvByxBv22pOfYRe15TJauYkIcslaKAjseZg6RfVK7p02W3rGcZ8
         XVW1UI6BpLD834vYNSEgL/ap6zOb7nBkXlXAIWYYXVWxadJx0KuRl+yGwgzGAkcwWY3H
         0B8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0CMfgT4fE8G+vMRMfr4MzsPVkiWLYgduKPFVGpSsAhI=;
        b=W9T4Ppitn1Go3j0r+6ju94BQzfhB/JvUNonFAgizpXwaAwLkmznVFJP+xfR+Fml7O3
         O5P7lR2FLcUxjEEVPouGwbMdKV+X+VXnfHArIB9c+WzoOw9P/KB/Z7VGPui5zDltoC8b
         ET+/1lxZ/yNpGe1fQex/WdKsPKgWW1tpTHfbi4TYa6KX9yGnNrA7qxLSVSG1NXtdpZs8
         iLzgWamnvu5ORsxJO6+F18435q1Kd/35NL6jEnNhABaYqK95JG5eW+ClA1Oe6CDhg6dv
         ec1hrHyFz+YuLESiwB6Z6+HRfEH8PLQrRkSBLHETj8PQ/duaWIDBTWHJjB+nHwpO7aAC
         7v7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y75si54547lfa.3.2020.10.05.21.31.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964VtnQ029677
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:55 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7x008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:54 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 13/19] Consolidate PREFERRED_PROVIDER_u-boot
Date: Tue,  6 Oct 2020 06:31:28 +0200
Message-Id: <aecf76e9307f0d3b2e8a5990e36fff70afa520f1.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aecf76e9307f0d3b2e8a5990e36fff70afa520f1.1601958694.git.jan.kiszka%40siemens.com.
