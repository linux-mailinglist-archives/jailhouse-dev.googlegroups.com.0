Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ5ZXD5AKGQEGNCVGMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36F258C45
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 12:04:24 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id i10sf373065wrq.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Sep 2020 03:04:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598954664; cv=pass;
        d=google.com; s=arc-20160816;
        b=mC2aqwZ2Rfi2hQGzMkG2T8KL51cYiwNOw1tuIATB04QpdWVEG2+yggOcc8UataP+bR
         1ZUTVa6LHdnrXfk+P/mL94m94hwNffSErSJn7o1pL5GBvRjdUVFAFA2fy2PwVRHVnKWV
         q4LQpmR8pxCngpxQuAIh/BQkQscz3hyGiuc1irqeE/8HzGB03QqHrRBGZ3JpWOCAF+Im
         h9bEgbJDb+r5HKXJjn+60o80zyFsBMnv3Uk009fhqENcBgMhEEkXLARHHYp3mr9yUzAE
         kDDK+T1ZMNzZcGUzEJeovBiaYPtmBtwLDRRARgvPW9wrkSBcoyQIzOq5ttjrlV/gq16S
         NrXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:cc:to
         :subject:from:sender:dkim-signature;
        bh=kCfUIRQthONU+nSNmnfvkQFUl4nwTTYNppgNJd8deec=;
        b=LDszhFv/G51jdYxn2fjiVQirj5DP4J+UGSVI/cI7YBdw7BCbBiOGrWzf4zXAXJ0J2d
         yzJtBC1BLq00LecgD2ZdmbQKhl1U/VFAQypw3/wFZSxBdERgUJJo+4+mLAIQ4u/obi8s
         WeEaJEsoM8oHLQtKI7gbgLZj3aenSNyK19+ckuDjK5IOtxzqCn1ETh+3Y5Jk1l3imkUp
         6F2GjFsqdAcavOxhiiZUXmDveBt+UhIJsJoDbfKRE/8mAUExlomqRK4Tg9PeEIxb1mcZ
         L9mmK+HhpTyY7lhRi/c14sdqrLtLKQJK0rHqYOnX48Z64O6kfOoX2c8uu0M3YxhPCSaT
         KBJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kCfUIRQthONU+nSNmnfvkQFUl4nwTTYNppgNJd8deec=;
        b=Q6w4CgIw+oFdyZYv4J65UfDG1GNX6Cx6C6mH5Q49L+D+bva9YofIj6wDHBG9wWwTCf
         Kae/VdbUrjZV7ZYx+m/EFQmv0tFJIQiK4EPQiPjbEipOUKuT1z+TUXE+pkBd+uiSPX+q
         Hzh+cXCAhKsuH9Xc7L7WO56q45TzCN/O4SGCTJvWykyvmJRNzYzma5/zDvlJeNg8ujIE
         MbWfy2Jw9qbwbM8w1pIHUR/7L/BarJObYUAne7nNIoWquPyw7zI7Fh4fTlT6hPzV5RZQ
         GG3R0V7FuqYz+Rr/MNCm7IQrhzqD3Zo9ivhKxp/NsmkcVfoJ0SAjDHR1Y53//a0IFH5H
         Ev4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kCfUIRQthONU+nSNmnfvkQFUl4nwTTYNppgNJd8deec=;
        b=oT5CKxUvaXVS1fvY7VB5o5v2RlCkwnJOwKUq4FT+psolihwm5VkfSVbT6ricFT1zGi
         5ng991gBoT77g5hO1MUDJ5B3MuT+rdNkJio/4DRap9sBAdkxA/NFEVHYlOKYOgrjKUFR
         7ISQhhp7eeOmQxlEq1vm/AQvevQ4sivmfTwRLDFZazMpLXO1CCKG6oMh8/NawOXziHOO
         2EbKChRjreUu6lanB4YFz4DOGsZwRFCmni8x32h960D4brHJ5ytLH4CwGhP9NBRndbEr
         lGOtSV0eJp+lHEoCjyseYetpH288EJkWRTxhPi5u7Td80wWvQ0/xwPjKqq2jZCNrm0pb
         ZWjw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qzR0F8ipQtywoKmxQbUQi3o+ZlFmhiccq1lWtvMCh23OF2UFW
	yRpWLoLQwUvZHz2x75at0Os=
X-Google-Smtp-Source: ABdhPJwQC+tTWJ5J5RvIpEMaFHQaIVdQ3DqKkL8wBmI82J0YHuM5VPgT4iLd0UC2dChHpzXe9ZxGhg==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr1020226wmi.151.1598954663992;
        Tue, 01 Sep 2020 03:04:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:c2c1:: with SMTP id s184ls472344wmf.2.canary-gmail; Tue,
 01 Sep 2020 03:04:23 -0700 (PDT)
X-Received: by 2002:a1c:2501:: with SMTP id l1mr1138335wml.16.1598954663048;
        Tue, 01 Sep 2020 03:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598954663; cv=none;
        d=google.com; s=arc-20160816;
        b=lxjk+iPIaV+Y8mZ4WX9wpVuiAamf1Nv3LzWvr5tbOz/RC9u0bUUMDfwLKfk2ufxDHz
         bnotxo94IBINaRy//GF6ZyFtYf1OvNCFqcnMK3lvHrb9Pxh5+50rsn3gHURuf/sg9BBN
         9yzL5omdVHC0fuDwVNtgMOYOcQ/J2OCDEh2TtkiyoyGYORMJXI6chbpzErn750RjcuDb
         z1FPwVdHuBQPdUtdzEq+L2gM/B3bf6gXCeF0oQNuuvsy3cgguZW6Io2wxPHPz3otLhAo
         cM9WGlKqJDApvywPcBesEB3sTJIW9TcesESITzoPOTt48kNqk3MLHOYPAfp69fhL6vCe
         ZqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=gZFn/pF9IBUc9fE6QrGGygyfdggIOEFOyr26Imu90Jw=;
        b=zQdvwSt7rDdd2jK1i47pvaiNU8e6rbj/V59nZo+syJ8ssmbCcNDoqQWwNFc7304aMS
         FpGyUD/KNzld2DhH0cVTYlDqraVJykTkMBzQvVUBR+KBNF56EaSsiW+9KNdJzaxHhLIO
         EVkeoi7rHPvzPmZUReIDcNjHgdrjo23NcJkxS/0zNiAJBVBVeAz+5CH8QAvOBuiLosr3
         nh5KXlqZgBWJvnNBhntAOyzVgx5YORy4a1N/cFsgPrQpV1k/GlkDY0oaDlAEIDkJvIru
         qxGcNToyaTTF+Pe1wdAqYR5YhlIhQ/zpFkNJ4/+iquR+9qdVZdD6rRmzrxRE7UZzkZpl
         fTog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id m3si26335wme.0.2020.09.01.03.04.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 03:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 081A4MwS003166
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2020 12:04:22 +0200
Received: from [167.87.3.153] ([167.87.3.153])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 081A4MpS013845;
	Tue, 1 Sep 2020 12:04:22 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] rpi4: Pick up dtbs from self-built kernel
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Message-ID: <db026424-191f-5fe7-1cd0-d2777e4bbd4c@siemens.com>
Date: Tue, 1 Sep 2020 12:04:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This should avoid firmware updates when the only difference is a new dtb
or overlay with some adjusted or new bindings. Apparently, the same
pattern is used also by meta-raspberrypi on the OE side.

Suggested-by: Jakub Lu=C5=BEn=C3=BD <jakub@luzny.cz>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

This depends on v2 of "Updates, support for all RPi4 variants".

 conf/machine/rpi4.conf                          |  3 ++-
 .../files/debian/rpi-firmware.install           | 17 +++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
index a683b7a..8ccef6b 100644
--- a/conf/machine/rpi4.conf
+++ b/conf/machine/rpi4.conf
@@ -23,8 +23,9 @@ IMAGE_BOOT_FILES =3D " \
     /usr/lib/rpi-firmware/fixup4x.dat;fixup4x.dat \
     /usr/lib/rpi-firmware/start4.elf;start4.elf \
     /usr/lib/rpi-firmware/start4x.elf;start4x.elf \
-    /usr/lib/rpi-firmware/bcm2711-rpi-4-b.dtb;bcm2711-rpi-4-b.dtb \
     /usr/lib/rpi-firmware/overlays/*;overlays/ \
+    /usr/lib/linux-image-*/broadcom/bcm2711-rpi-4-b.dtb \
+    /usr/lib/linux-image-*/overlays/*;overlays/ \
     /usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.bin \
     /vmlinuz;kernel8.img \
     "
diff --git a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install b/r=
ecipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
index 701a984..dba3266 100644
--- a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
+++ b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
@@ -1,8 +1,9 @@
-boot/bootcode.bin	usr/lib/rpi-firmware/
-boot/LICENCE.broadcom	usr/lib/rpi-firmware/
-boot/*.dat		usr/lib/rpi-firmware/
-boot/*.dtb		usr/lib/rpi-firmware/
-boot/*.elf		usr/lib/rpi-firmware/
-boot/overlays/*		usr/lib/rpi-firmware/overlays/
-debian/cmdline.txt	usr/lib/rpi-firmware/
-debian/config.txt	usr/lib/rpi-firmware/
+boot/bootcode.bin		usr/lib/rpi-firmware/
+boot/LICENCE.broadcom		usr/lib/rpi-firmware/
+boot/*.dat			usr/lib/rpi-firmware/
+boot/*.dtb			usr/lib/rpi-firmware/
+boot/*.elf			usr/lib/rpi-firmware/
+boot/overlays/README		usr/lib/rpi-firmware/overlays/
+boot/overlays/jailhouse.dtbo	usr/lib/rpi-firmware/overlays/
+debian/cmdline.txt		usr/lib/rpi-firmware/
+debian/config.txt		usr/lib/rpi-firmware/
--=20
2.26.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/db026424-191f-5fe7-1cd0-d2777e4bbd4c%40siemens.com.
