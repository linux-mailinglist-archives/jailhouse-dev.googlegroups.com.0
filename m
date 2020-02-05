Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVUG5LYQKGQEEVZZESQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75E1527D5
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:56:55 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id l11sf1685695wmi.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:56:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580893014; cv=pass;
        d=google.com; s=arc-20160816;
        b=gXTMgNbVr6UMMGwDU481vpcNlZQzQnOX8fbDThvvCU7u8holx1ZCwzxgx8tVuUfT5q
         lmQr+W5cRzVwiA7nWZbGCokCCEqfTCZ8QrX6iNyPza8vXPKakstNZkK74huBdeSmomm/
         0oX63SzQtpNQnDHamY3X1G3lrzNie5Srd6GGIYtwmzaNcK9GpS9bYqWXjJou+p/7qNeR
         vWEEbg7UD7QBuPRm0svk9wwTZfAQdNVlSKyrG7HQSdtouHFG5sDzODCA1pzH2QpPwBwx
         phJzTPS6v7uvTL9Sf6Q3T29447krW7zHNxTQ48yrJaHhmjhJFhEldpu9cUG/DGlXE3a1
         w5Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=HSJrbTBuCNN2yXxD530GdIeZwvTWVV7ew/LXYHrNDv4=;
        b=kp+2NqLoZmEzhoZEhyb4ywl+eDWXnNM7+GdPo+3os3W4/lkagE5KfO/u3pCPmuwBix
         jKd2vaTu6Sm5pq9+2/jgqRD8LoGehkPG0S/9rBi00Fl3eSlWh5gPf9352i6zycM1Is3W
         r6fxMNqD/x06GkrqlUD3/FgpPWtBs03ae/IEnRx4ElOMUMeb3+6kq47Y5gBH3+LFsaYG
         gN3kXGlzrZAOtYVP+jMxnhteZfZW++bpUKXGvELWqfveE2W80dt4EVau3QM2kBMCCXRR
         iz74n7K2NROCbQArfZaZtp5n3+ZwUQW+3pCGoLq7XFIr+3qVR2BKg5rYUFQebHJ3UbZZ
         /u7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HSJrbTBuCNN2yXxD530GdIeZwvTWVV7ew/LXYHrNDv4=;
        b=YE6Noo8uRyQvqt7rNHnVsprT75PQl4umW7NeJtia2mYRTHs/dItw3L7IMU6sAM4uYV
         QAdoLmwODQjS59d/ibdraqxQX67QpIiAg4ccXER1EEa/xlFDBnChBT+IwV30dOiOJpkr
         wAO3FapCyCkkf2RwiImagJA+55vjcLJOR/ckpSSLjONxnmCOcWE4BJSSA03pvZGButsm
         6VpHit3Zcu3p93Yv6QtjzhO18qXOqT7CzEP/O7WUO3zdvD6/S3zRLy7fZG3fjJ+PVeZ2
         897q9RoyIPI7KD1ecgzJQaRXmoDXyL2Bh0Mcs4Sy+CDNCusrJYbOBiaQEW2vUjzozlb9
         1NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HSJrbTBuCNN2yXxD530GdIeZwvTWVV7ew/LXYHrNDv4=;
        b=RUTUHKwS46KU1t/NWlbA/YL4eXgWsYOOqyrAuOtvALL0ZxZ1WL7uT/dPHkLP9g66Rj
         bb7h4Z27cjfrIyVI54q9tzdyWU4kly8ZJhkfOUxAsNmYCch1QHAwTAmyoa7BQqaLBRTF
         fQ1aKDxmocauluO8xwMmSyUm8kxvEoq83XVIU4CQRxFf7oe9k4gWDmwNAb7O+m0giKF/
         XwXYVCjnX2qWdj0Y7gNAO9fHqp7D1b4kU/He5AWv8ue1zlMtJG8aHK3VkA18lKGyiAyy
         sUP2qFMBA4mU1nnCwLbIDpo9Qq+2/DU28yDZ+l1ChtecYXtehM2EcEHHWOSNh0KdKCHS
         XEMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWUBgt53ej5MXOBEds1bQxzdGZYnLFVHrtkv+TXgUXQ1yMjSiGv
	X/dFzkpGNl9cobJlx9/7H/c=
X-Google-Smtp-Source: APXvYqwnV379/mF3oNgF11c+O1NJtOQYzNN7NjPmFQi3f3PfFdumE+KpN4yeIjpIYTJWt6TjObLA6A==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr4677605wmj.140.1580893014703;
        Wed, 05 Feb 2020 00:56:54 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:65d0:: with SMTP id e16ls529917wrw.1.gmail; Wed, 05 Feb
 2020 00:56:54 -0800 (PST)
X-Received: by 2002:a5d:534d:: with SMTP id t13mr28927455wrv.77.1580893014063;
        Wed, 05 Feb 2020 00:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580893014; cv=none;
        d=google.com; s=arc-20160816;
        b=W4b/8pzqrcr5Bt8wPIxmN2zI1fFggW7eMMXOqLFebsuDJ9C/P8bUU+bkRYWJurtjp0
         5MGTVAWPJ+YxdzspC0AbURnrez7QUsZcA6jysJDZWemUBRbzKUhmXc65RjrHsRtFqnUI
         I3z8xgMfSCrqD1KX28CSL1XpWteObJ68bJKtH/gygA1HsPio4abbnNxuws8+x40ObFSQ
         +p7UnuSeh5UcC1AzdoNAu5ulYcDVPH55bGlVts4//EUdECUDfK9T1ygoDHcOOvO/mPvc
         eP0GcNjs0FjTHPNXczLp5DIjdIk93nbEkBuas77v5T+m9//DtK1AMmF/UA7SYWeN++b3
         zt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=0stiqZdlvqptHqRRIzC6o19BBF2vx3vpcL4XaVQt5CI=;
        b=Z4IBntADoLs8QcWvSAEkCoQYYtxg5mA+c6oadABxo+ehQwth+adSN0jFnDKrDd7KZr
         //e6MTT7P73uWKxTlz1OC0BIifa9xh6x/G/sJxQ8S++93NEj1c5TIFRU1mFRor/Mwlib
         G+4a56I3JnmzDeUSPM6IX7e8PbmkzKX4pQckYmpqTX+AE2vYL1ATGylLea90Prga865l
         lh+aAwkBBW+7qul1mKBhBVWBrq+G9k9SWfuH43UO39n8ayOU7pcuWlX5XaY5zifkiKmP
         oiKwEQB8qIX+BfSJIxDtny+1lv/qWXEUXsyhSq/OLQWfhIMz41Q+kGyvJ15tIojEes+f
         IDqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id i15si976760wro.2.2020.02.05.00.56.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0158urPo016638
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:53 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.54.219])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0158up0p006156
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:53 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 5/7] rpi-firmware: Give download artifact meaningful name
Date: Wed,  5 Feb 2020 09:56:49 +0100
Message-Id: <24418b9af654f28dbe3a466be84560d5424796f1.1580893011.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb b/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb
index 5079d5c..5281386 100644
--- a/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb
+++ b/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb
@@ -1,7 +1,7 @@
 inherit dpkg-raw
 
 SRC_URI = " \
-    https://github.com/raspberrypi/firmware/archive/${PV}.tar.gz \
+    https://github.com/raspberrypi/firmware/archive/${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz \
     file://cmdline.txt \
     file://config.txt"
 SRC_URI[sha256sum] = "b3c5c9d3cda1f77caf317b8d1f0496cd7ca791ddaeec8207a5a1940111483509"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/24418b9af654f28dbe3a466be84560d5424796f1.1580893011.git.jan.kiszka%40siemens.com.
