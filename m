Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKUZ2D2AKGQEF5B5RIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id F23841A633B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:34 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id d17sf5276624wrr.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760874; cv=pass;
        d=google.com; s=arc-20160816;
        b=J71yN/LtOEfWyanddpmZbKGrYig3jAJC6bkkl/bvXYRvo9wzIrBIfz/46OYtEp53Kd
         9Cw597tRTiN1VT4PEQL7uFT/elVXg138+d47bE+V+Zu/jaKuMu3hwhMDelRInEcrnVzz
         8CpubS4WGOrWmv6wDJP3YF1p9/2jYMClq3EjTUlu0HTs0/MT2Fb4mYsMhJSX565jxvHX
         04hJLvMad594bdEGk6H7jmeE1uqFX1vB54Gu3LldAtNpLg4XUcPfnzCMeO7Kgrpqpp34
         My7JQ+RTIXTn+voVzjXgEih/C6TYp0Q4AmQiNBsRCk3XxIZOaBb1kSnJpug9CFiJFbUU
         gQlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=PxrqPmaFdqvc8W6vZIi7SJk23eiU3QcF2dqcEqexTSg=;
        b=fjigcxmm5ZsNVmReyxhSBxmP5J/24pHjH5MEm17Q7ve04H6fIBmxC0ParzPk5RNTGn
         h9vWYohLSSIDK82vcTGbnaBSpuM44aXYcLfNA6h3MKT7fXIw0tcmleOnR8z5ds3TlO7A
         D5XYACPXEFM6OO9xYOhiSYFfdHgtjFmeccW8hXPvozSVpxbSncPPERzNtO/GltU0SvlG
         MEBqXey8tz/lGqw3bvd9H3yXMes3hjOqHNt6wuBKOwJb5ZygA02Y/hGCk5FNWhZvpx8t
         XqFdTp6GRc0zK/QHL8+rHKblpA/w8q2xYohCrZhwexYGf3Ql/2kCEb66qDZq8l4Xa1Kk
         1law==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bTmLDd+8;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PxrqPmaFdqvc8W6vZIi7SJk23eiU3QcF2dqcEqexTSg=;
        b=C8VzL8xG2rnOszj1/Zf0jio/P1PdZrN2g0C99TZrhHZ5SLb1Dut3aRVUUmlcME+2LQ
         uh3zgBhWOcEaK7rhZQAHyIoSm0w5ix3LkKvE1H43YXQF5MW7qVo6lUJZw3pEMpSL71rm
         tq+JiaD5PONJ2GT1jnJDbJXrURNX75AgG8fj29jIyPFXG3A2xmbHZLIq1YYviZygAibV
         FrQgL5QT9/yvIRM+Sqzf4sdSu/91YRd3yy2n4eENlCicifjc2OfJB8g6BHOE9AJZ7mfo
         uHuveI4YTWuwjrbcn1XMjJqnGagi2SDrFMdm/oYfoU5Ica0InewetlvUX8y4uVRJlndg
         pqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PxrqPmaFdqvc8W6vZIi7SJk23eiU3QcF2dqcEqexTSg=;
        b=NQB0JzGxXdqnVmG/kgO9DYdw584s6Y3PexVWStRA6QfdRQhbNFjfCVuF0XBd2pFNk0
         6hDE7SdAFNDr8o63QFetKPCCmZmBm2jXOvYlswVqbTXfoiBtUZeS9iH3o6aKLVMq0xO6
         C8kBXfLGx9DwtlVDl/jsxqY3eZ5U6Xer1+XQgXnEBj3J/DxbhMMkZEBNLqPg8lspMsAO
         AtSK52E0DsJZpFAF8UnV+gOHOEgU+kot0FhCrLM9BUlpmpIAm0yhkQ+qVqDsIdzw/zK2
         e1kR+6oCSxlbt+ZwNGXYDyMO2u6zbeKYFWbuY6gkqO30w8XbPGfSDLA65sFfouwnBVbM
         jmgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuatLSLOXgd2TFjQY1xpB9nmSJM/bDiweHhxN9Le/5LtKZw3tPTY
	Y3YLXBnoV+RdvSGucp5pojk=
X-Google-Smtp-Source: APiQypJFecre5x6b/F8KpwdizsY6AnWx6+JwxzaTNRPBsHvSGj4tuKPKbw5OCLcjwkRcqXbCsB3Kgg==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr17185889wmy.30.1586760874668;
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4690:: with SMTP id u16ls16804922wrq.11.gmail; Sun, 12
 Apr 2020 23:54:34 -0700 (PDT)
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr17767540wrx.386.1586760874179;
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760874; cv=none;
        d=google.com; s=arc-20160816;
        b=esjnMOhgH93VhRr/Le6jFn7jsqjv5F/tpEHSeWgFUsLTDKpIkdHE7NcXyv0Mrdj3tC
         xZklVoJt0Gu7pHXZB0sUXcPJhMlF1uJHtDhLy8KNnmo3tHth7qGSzggl9AcXGkQ8Q+0K
         547l2CwlSQ9Ts9TVYjohZ+PTDgtdedo4jEKuXZ+mKWfQkAfflJXQDoAz7qSDS2+nuT5v
         3j+WF5FLTnh7opimEcxj08IrU1wxWUWRpJtyZkY3t+VELpPBhPKQN/SdIG9CirZRzT9b
         JBSY2jjZNYZm7J5iAcwDi55TIW45MjXc2kFY6rfJ2cufP1j0tL8pCtfounLs67mOHdDo
         +9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=035Ia9PY41fQyqh1S2/S8iHMu/GTJ0VR+5LJk2ctqaE=;
        b=CuhTk6FYMwi/8I48qrnmOAiyyKx5d/M4sPN10q+2+DiEDvwEry9dRonvpMl2ke+jpE
         EJmAu6dbc7GBSrtaoTB0zDG9jWwFd2ywnk4Bf5swi/C1ck8uNPIbGD4WmMWzdxTFnjBs
         5A8TCCPn5DU/G6nsn3QsZg9KbMPBibgBsDC/uVCzp9KjDqgeYCLZr7zB57BbnUmKUBHG
         xN3RGPWl0Diw6XvUYRZG8JQqiIab+hhz+lmKgoqKSsG2xrkQvpD6ZJdPDzctkttNdOXL
         tiOLdCOKoIvouIeUXX2rLDKI3b+1tH3Wwx/Joh+1l0hJv73xdqrNbhTfB/ldxR1L/CaO
         /IAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bTmLDd+8;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id g70si686847wmg.1.2020.04.12.23.54.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MIN2h-1jPnjK2tDT-004E8r for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:33 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 03/13] rpi-firmware: Update to 1.20290212
Date: Mon, 13 Apr 2020 08:53:45 +0200
Message-Id: <293b4e9f1fcc9b863a04726e0666900e64e3b943.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:ZdEQz2SQEB1l8YnbLACWoK+QJuaTedVDynJYyn+TPjwUYfAVcTa
 GENhHukuZzfL/Ig0s7FQ9RdzbcM26WjNM/oytLgsNNamClnUOtHJiwH03o2uE4HoIlqRIic
 bLnofgrVWk4sgpUSHxZdDemrywlI64gizaBM1tRQiRwsSCNRiDLpez/9tE46n54jdNpkIDE
 B7dbqCNkNYQFg2QK8Q1dQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:08AjaEyFVjQ=:ika79+PhsHjwz09kWDJzag
 DR7NoxH/CSUv0zGp7X8sjUmdZstjzBje/Du7ReR4789g/fByIW9iyfyPkE6ttvtHZgUiY+wYw
 kmrti3Rfh8b/yl3TPqAErer6A3WgYnfk/2Ikxyd12/Dnkijo/60HGkB4M4uBYbOqPFLFDptnR
 9xBRzqZ7+wSPFQRWzdjvkKzHJJRDzmJ+Fk4W3dQjUsU1bZGLdcRuZoZZFDkN0IeHz04JNjj8J
 Nx0vgxg99svB6Z9Ehoky+Yl8OkBapdgmOiI50iJI3AMA3ic9nyH0LG/HLz27Wt0Y09yOJhFLb
 U/q2lqSQK9kJ2gdphgNMkK2AXJHHkQ/+0pTggu4GSyMVhnzVbhwy3rvoBmmgxs1w84GDHHUb5
 VAD7IhdomAxWBshhVgCzaNZqUp4gOYq3EfTZPMUDN6KuMmIzZ9y0eL8xyOyNlgz0k3xX+MYpN
 ybf//3KuzSNjPSJ5t/2xnbi3TK0bw8y3MWZg4GhePvPsithERaD/w70LnUg05h9QC3hmVN2AJ
 Vw60pwtGkkHAFYm635d3EK2HCnr4xnCHOhqzfuGpIK2POGllCh6Uhi0JNgurcJfqVj5M6/F+0
 JZdgNFREgWyMikoc1Sj3kaO3DdZ5xSSeYDuhkZOuh1m81O9DocH5pH0beoLKAeEz7kBRgbGoU
 v+t8qQRt3hQCuJSakW+7NsCOhrK3mm9OMBo4/kYO5J3/azU30RIAH62FtvsywoS4iao50gQjz
 Bm2L8VkJXFXAHpPLqsI9ieHyr1TvoaX9v7RSKtR5RmFeW8KfFUP5r6IgWKlkPBFTI1Y5gBKTz
 32jSvuMnCGK13r17JYDJKWleS8754ZG8ITAy2+eLXM1f7zwxivF/tTXVK8CVENzup2umNjv2z
 ANL+avWY66GLklPaoh1YFZ9eiE+5HmGHzHTshrC50NnnNievmhv4qviz1A2H9KYcZFde3XTjE
 e7uneD7ESuXd2WKQJFw7xyt+dYuwMY9VY2YL8kNp34uvuMQKCBIjC12igjjhnOjNlRtUB9fgq
 +dNSDB/iFlJT3XRgNkPuAoXZL2i1oAMudf9GK25PTNco8f5Dk72Ump//bnbBQQRXQq9hi4gDQ
 BCZJUtyw3uUYI1fnI6AhlOJJexsr7R3gcXyjiwEq8sGIIZkVz6DD0InZRdyunv5Mqi1DXXCKy
 vE2M4dzeLPGYP9zxm1Trg1Zfh0xyYP/nZuYswdeBIqWQb7XPx0A0XRP5kKIVY4i42lN5TwwgS
 glBcrKvF2dj/+k/KC
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=bTmLDd+8;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

This requires to name call kernel "kernel8.img" or it will not be found
anymore.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/rpi4.conf                                                  | 2 +-
 .../{rpi-firmware_1.20190925.bb => rpi-firmware_1.20200212.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/rpi-firmware/{rpi-firmware_1.20190925.bb => rpi-firmware_1.20200212.bb} (90%)

diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
index 8038c1c..a683b7a 100644
--- a/conf/machine/rpi4.conf
+++ b/conf/machine/rpi4.conf
@@ -26,7 +26,7 @@ IMAGE_BOOT_FILES = " \
     /usr/lib/rpi-firmware/bcm2711-rpi-4-b.dtb;bcm2711-rpi-4-b.dtb \
     /usr/lib/rpi-firmware/overlays/*;overlays/ \
     /usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.bin \
-    /vmlinuz;kernel.img \
+    /vmlinuz;kernel8.img \
     "

 KERNEL_NAME ?= "jailhouse-rpi"
diff --git a/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
similarity index 90%
rename from recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb
rename to recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
index 5281386..f6d338c 100644
--- a/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb
+++ b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
@@ -4,7 +4,7 @@ SRC_URI = " \
     https://github.com/raspberrypi/firmware/archive/${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz \
     file://cmdline.txt \
     file://config.txt"
-SRC_URI[sha256sum] = "b3c5c9d3cda1f77caf317b8d1f0496cd7ca791ddaeec8207a5a1940111483509"
+SRC_URI[sha256sum] = "e3b0577beb62d886a45016447bdf8c2d57b794d3d71b502868b16ba82ff8fe43"

 do_install() {
     install -v -d ${D}/usr/lib/rpi-firmware/overlays
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/293b4e9f1fcc9b863a04726e0666900e64e3b943.1586760835.git.jan.kiszka%40web.de.
