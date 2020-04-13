Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKUZ2D2AKGQEF5B5RIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id E771A1A633F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:35 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id h12sf3446401lfk.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760875; cv=pass;
        d=google.com; s=arc-20160816;
        b=QMMZQzM9bRxuJCUxAZcfap44l1/Sp4nXUA8j+7aqPd/u4/MTLdeSg7tAk88z/3muOw
         DTQwTvYuMjAtZtJxXWn0hoVXtcPLOjvoy8Cek3KeTinoJAt8VBzaxYErDQOwmrLq9IkO
         9BUigWShOo09fznivODy7v2+yEQ6YXlTCXVL99Cf5StHZhpaDCIS+S1z1fFYXHqADyb6
         v4MZ4fII0/bEnU9XZOsju89YKiqxLI8gK0L5yjhs+AuWbxtp6jT9TIEsmhkbvotkim4z
         ifiiudQ9YdcLd3W2+XZAkO705O0E2QHjAMOeKx90ztSkQ/kINYBWJbXI0Wu/JNBEPbEv
         SGjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=PGXn4mFFseKi6R0HqJqvRcuX+VS0cAgyXZuGb9PrQGc=;
        b=wpW9COGaPRxI3GSxnKvBpVTMfqMAOFjExKneOPZZE08ExEvp9c7AvvBzKMopvsBHlP
         6qsY+BZt7umkZU4tC/aWlulYQsHstjjpU6CPZJoJK3CKrIQ/XJwic0DLsEZWA+L6a5Il
         InqHdSMP5fphvib82+1tX6/fC9AVV76wCMJcXP6aiC6GIifsb5iUtCEzM3rjkTQrfRhL
         ytVnKdXT/2H5W+xZ+jBTZn3V5zpVknM6Xg2tuwx0u7NpIJQTDIQreU1kRcK+IndaZQgN
         fUUiTkZLdI97/VwI3RzrNLWoUc6Z5devy3cz3tl/WMkyTmaivOYYuwhiZXL+ssCun8fy
         gRxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kFJALVOY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PGXn4mFFseKi6R0HqJqvRcuX+VS0cAgyXZuGb9PrQGc=;
        b=HD4LCh3zpV/jWoozJvpYzIUJr4uHYENCBgIuT5jsvgDZOlxUQJpmVVn6rcSos9Ujp1
         mre4CPqZYwOAe4ZMgUhY4NF1sFks2DiSp5+kDWS4PmGEUDZHlknJL6tDuRk3KG2f+b0N
         9WacWGt+BxBYagApGRTbqzRxlTH97CFU+AGWYwjvrqNW9S0YycRtrXjq30AmNOYaYauE
         /VmWvc6/LwUdSlcXDjnvnj//yU+diRG8kbEOpT5ds924QybxJ8/0NAXUc/XPf+ykfabE
         OF/hDpQCX3QSWBhxo8hSiMfqU387ZmxPrgijrfvCyOAI9R9sTfd3htwrRdwzH5CW8vOE
         9c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PGXn4mFFseKi6R0HqJqvRcuX+VS0cAgyXZuGb9PrQGc=;
        b=Jw/VQ1PoprR5PWcQ/n98Cz8OhR8Kshx+U9oBHpTdaG+Jz4hORz4ZMfS/n3/yAS9lLe
         NP7df7fK1DjR+U3mV0KHi7sFL1uytOaEZEFPN106LkazkftsJoOo/lX7qg8/yYr8ljkF
         ScFirBDZpGjrDf/wwvihjoFF1w19j4kfp85xS8zQAEfwYAB71zWivVWzEib+KP4XSchv
         nmJ8MrnYc6P8+ksggLeIR8BrrHTC3CqsUK5ijtH/v0CEuD7VAydbpl2FMnKEyjSHwraf
         rUr//tFWuzKmeXJLmNABCRp4jRzaRG7nGkM+MMGjC3ioG7xPGwZwiMaTA/YF5CAOUS0n
         BWrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuY4VDaFMWuQ5beRjjm9VMPG35ObOeWwzJNuspoTujchwRgJdf2u
	6NOynbwoKIsTdmQDb9czJcQ=
X-Google-Smtp-Source: APiQypKjDsOc56cDx9AwKG/XK7UqFqPudY7hd+FK5pr9fXB9dNAX7yZ95gYN8Oth78d++8uN7nKzHg==
X-Received: by 2002:a2e:908c:: with SMTP id l12mr3651471ljg.40.1586760875126;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:74f:: with SMTP id 76ls2608983lfh.0.gmail; Sun, 12 Apr
 2020 23:54:34 -0700 (PDT)
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr9378627lfo.69.1586760874050;
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760874; cv=none;
        d=google.com; s=arc-20160816;
        b=icX3M6Xzdu7J+DzTkfk7HuKWMM+AdTwa6a12r5rN5X//sVyPwV/UGvM6EmDXHl0TGt
         11/HUk0kJvq4o1LUvNqC1tEWAghuRM3WxeUGG6I5S4aOIjyVDkyH7T4L8oPhBnv6mzGN
         4R+JNBKHVur6NT0krjsqQcoWHdjDqe1mwTvz3s78uSiqB8i+HFxDlA35UjZJPIE68uBr
         DBvFxsg7oe+xZ+WhXM9w43IfOEwn0/neCfCEoVW1+c5JVNn6hipuVFagglCuxeR27AuB
         ebBWhyryR2Rwm2ZoJeNi+DDUa69THLncK8I/OrPaX/fMrJZdYrELEgdtDctkthU1txKl
         pVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=/ARTitWzAM7+YxFhbaZBTP4Z+TMdlQ99w7IXllMuKQ8=;
        b=lPHm1Pb0Inqz9Qx6yJklVn4RRC+deimEwTFtN4nYL822n4K/JA1RLKM4mS6b0XoSYG
         EiR3uT5hipS4Ki3fp3rFyQhEVXW72FzUzdFX8fyMiLCE2ZJJEJr8nMlCxjwLXDc90WOv
         UonDsoqc4VpPouj665KKHorz1fYCdcU980ejqcFoGVoRmu4YOIlUDVqlGot5t4kEHxRj
         mFsoazgo7/yRa6MALHRCCQUGsJGBplQaK/ME96Ur14uAPrrnF5w97BUbYiXQs12XLmQz
         dPfGvROwQIgfh+nm/dq9CNlUL6Pjn5rDfVMxqZwrvJxKTXp69kb0Zrl4HXt8mjgJghpc
         xIQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kFJALVOY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id a21si497488lfr.4.2020.04.12.23.54.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Lp760-1ijL2r08xg-00exzq; Mon, 13 Apr 2020 08:54:33 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [jh-images][PATCH 00/13] Updates + SIMATIC IPC127E support
Date: Mon, 13 Apr 2020 08:53:42 +0200
Message-Id: <cover.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
X-Provags-ID: V03:K1:QlQJsk5VHf0ihMDWxCtBMLZ6VgR/TbLkV+1MBlNxqnwCXqURP0U
 DkKzrY1iRwWewOCuq0ZFT9h7qENOscPBsJ4S2vbqE3u9uYI1Kf9pGK75sgQiBfgIRtVg7WV
 NmlrhGyrEaZQzkwzPxuoJIZ7hH6mPy4zl9+tjFEfL8RKCTpPXptLxzOwH4/S4Yw95vIxfIy
 tLMcmiKZvHvTvX2Sg8d4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8KtZUgXN5hk=:HtJSl9LYSs0J05ae0taosp
 eecSlryA5qjJJj5jnWEQLqaUpKbsuLVOo3XuU9iwPplwd3bR9OuTjgE92o9r/ynczWJ59SRKB
 vyaCNgR+MbYV3g9iGnKMu6uNjs3bkJz0ihfHouyk9cN51wKkBSoF20VUd6VTMyG+UjHZ2Tqj6
 RVxeCAlAb1AUuEY+dfbdrnQ9lQjX12cCEwUKywcptZS5QW8TzoDpYDABDUoWXh26lhgeVXPVr
 jXfVebh1yrwNUMweHOnMaOW+MBpWNjvtTwYMDrZ4ZmZV1eIiVZvRamaYaiNSNLm83X3fBz1uG
 67TPrgDCyRDv4E/2Th1CCx1PsSDteLL8bGKDMxncalAFNHjKS1D1IqZXdToT38M85+5Gh8obG
 aI8t5rqdejiHcMlTiOt6FN08twUFjBx7XPE7tU8pmuzQO3x1lJdT0nM2yOlSXVS5PR/tI6M9c
 J1ViW7GWBiOMS+v+vQ8PPE3wRlW6zbHAFWjbzX4q6rBtAIBWDNsavu2KkCwbcHdNL916xRBGm
 dEu6CIUZxOXRI1u5ltos6fob0rjp6IaZ//6lET4tk80sGsSsTBCP0XKsK/Zh4fdOK8deRDDk6
 0igD1T6tXspFtik8u5zQPKwQF/3NvLUdOtQIC2w6HHlE/dpUt8g3EmY4yMlFBfES1/3+7+YS0
 jDViQTzSle8i6zPzNPqrcxYEbu4NMWrn6XxikjAElPKB7oCBZC2QVw1h91SU63K6PSFtM/lS/
 xCdk9LwUmp7MSFlETJgVvGTMnjt/7CdCIQeJAiTBpl67M3nKG1p0IlY5Wt3njh/Jwvu5cy7Av
 sFQ7vNJ/01vST2t5IwZnuW2noucQjh+j8AnGrxQC0Xo70lk+F+hRLDnacPsorA1dhPA9i4FGK
 LMVpNYQk0zXzj8Zto84hYDm6bRHM7HXP06IAOw9F+ViyZ1lWoxAGMo0/+0+/8ucyIrLR9T9RK
 Cu01ubpH95kgrhMXWAnJgMqcvSfNS/43U7NSGL8Y5zINJCAcIJ9F7sGPMmFvs3ZncvvhLrBZB
 vmR1G8mNsQuG8yDcdrbUoR1tO7tB3Z4dm3zWZCuojM6wSRAMLNbhZePg5msD/WxhVKeFK6dQ6
 bx24RfJ53voXi1yTJBTHXxnm0WekttvC7L8H96R4BdL4nR9tYHj2vYkQf57Lv+PTGeVEkEV8W
 z1+BrKGFgebH5+34gLUdmXz2M9fztKHc8cX8edXD9IxkagD5RReltctmmIN1DPUZCXhemQwdk
 F6BjXWDCKSQpYh+KC
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=kFJALVOY;       spf=pass
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

This brings the kernels to the latest versions, also pulling an update
of the RPi4 firmware.

And then this adds support for the Siemenas SIMATIC IPC127E industrial
PC, so far only in its smallest configuration consisting of 2 cores.
Once I get hold of its 4-core variant, this will probably be updated.
That update would also allow to enable cache partitioning which is
pointless so far as the 2 cores have exclusive L2 instances.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>

Jan Kiszka (13):
  linux-jailhouse-rpi: Prepare for new bootloader firmware
  arm-trusted-firmware: Add RPi4 patches to skip UART initialization
  rpi-firmware: Update to 1.20290212
  linux-jailhouse: Update to 5.4.31, 5.4.28-rt19, 5.4.29-rpi
  rpi-firmware*: Add some missing license headers
  jailhouse: Refresh nuc6cay configs
  linux-jailhouse: Enable USB WIFI adapters in amd64 kernel
  jailhouse: Prepare for adding more recipe-shipped configs
  jailhouse: Add support for SIMATIC IPC127E
  customizations: Add SIMATIC IPC127E support
  Hook up SIMATIC IPC127E support
  README: Add SIMATIC IPC127E support
  Update Isar revision

 README.md                                          |  14 +-
 conf/machine/ipc127e.conf                          |  15 +
 conf/machine/rpi4.conf                             |   2 +-
 conf/multiconfig/ipc127e-jailhouse-demo.conf       |  14 +
 images.list                                        |   1 +
 kas.yml                                            |   2 +-
 .../arm-trusted-firmware_2.2.inc                   |   4 +-
 ...16550-Prepare-for-skipping-initialisation.patch | 127 ++++
 .../0002-plat-rpi4-Skip-UART-initialisation.patch  | 109 +++
 ...03-rpi3-4-Add-support-for-offlining-CPUs.patch} |   5 +-
 .../rpi-firmware-brcm80211.bb                      |  11 +
 ...re_1.20190925.bb => rpi-firmware_1.20200212.bb} |  13 +-
 .../customizations/files/.bash_history-ipc127e     |  13 +
 recipes-core/customizations/files/ethernet         |   4 +
 recipes-core/customizations/files/postinst-ipc127e |   1 +
 ...x86-Add-LED-blinking-support-to-apic-demo.patch |  58 ++
 .../jailhouse/files/apic-ipc127e-demo.c            |  84 +++
 .../jailhouse/files/{nuc6cay.c => ipc127e.c}       | 806 +++++++--------------
 .../{linux-nuc6cay-demo.c => linux-ipc127e-demo.c} |  10 +-
 .../jailhouse/files/linux-nuc6cay-demo.c           |   2 -
 recipes-jailhouse/jailhouse/files/nuc6cay.c        |   4 +-
 recipes-jailhouse/jailhouse/jailhouse.inc          |  16 +-
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb      |  12 +-
 recipes-kernel/linux/files/amd64_defconfig_5.4     |  38 +-
 recipes-kernel/linux/files/rpi4_defconfig_5.4      |  11 +-
 ...rpi_5.4.16.bb => linux-jailhouse-rpi_5.4.29.bb} |   4 +-
 ...17-rt9.bb => linux-jailhouse-rt_5.4.28-rt19.bb} |   4 +-
 ...ilhouse_5.4.17.bb => linux-jailhouse_5.4.31.bb} |   4 +-
 wic/ipc127e.wks                                    |  16 +
 29 files changed, 810 insertions(+), 594 deletions(-)
 create mode 100644 conf/machine/ipc127e.conf
 create mode 100644 conf/multiconfig/ipc127e-jailhouse-demo.conf
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
 rename recipes-bsp/arm-trusted-firmware/files/{0001-rpi3-4-Add-support-for-offlining-CPUs.patch => 0003-rpi3-4-Add-support-for-offlining-CPUs.patch} (89%)
 rename recipes-bsp/rpi-firmware/{rpi-firmware_1.20190925.bb => rpi-firmware_1.20200212.bb} (76%)
 create mode 100644 recipes-core/customizations/files/.bash_history-ipc127e
 create mode 100644 recipes-core/customizations/files/postinst-ipc127e
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/apic-ipc127e-demo.c
 copy recipes-jailhouse/jailhouse/files/{nuc6cay.c => ipc127e.c} (55%)
 copy recipes-jailhouse/jailhouse/files/{linux-nuc6cay-demo.c => linux-ipc127e-demo.c} (93%)
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.16.bb => linux-jailhouse-rpi_5.4.29.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.17-rt9.bb => linux-jailhouse-rt_5.4.28-rt19.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.17.bb => linux-jailhouse_5.4.31.bb} (62%)
 create mode 100644 wic/ipc127e.wks

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1586760835.git.jan.kiszka%40web.de.
