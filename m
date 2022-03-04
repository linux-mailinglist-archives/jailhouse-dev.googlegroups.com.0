Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB7PMQWIQMGQEWBA5VJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0994CCB9F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 03:16:31 +0100 (CET)
Received: by mail-pj1-x1037.google.com with SMTP id lj2-20020a17090b344200b001bf0d281b13sf2068634pjb.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 18:16:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646360190; cv=pass;
        d=google.com; s=arc-20160816;
        b=qpjp8tBbKCb1A6EZWkjOJ2y0A0c7R4yhAiOO2rF5ll2kwY9wpbm81FUEKcm5YR93es
         ECrFYxTfF8ofyc41akC9qrnQv4H/VdcjBvISJKGBanmEFUQqM+39G4SIHRPU1m2eWvTE
         nDkwEZJG/y6EJSnPieZuuT2lae/sAvtq0hVcHHCaKyvRDNRNuhHZ5Kp9o7RIHDXE7iyf
         /kNdTi697/EvhEojAR8iYcmVJfazoQD80LYWm9/PA0ISd4goki+D4srD7qGIxPmMznTe
         S12blSVc9ahJkII4hV/Z0pVDbC9VcCqVwVbV4yER+gGA4vvN/OiLPQ9YNO3RQoN43tMT
         l41g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=ccNRXHzWZIp/+Z2jfdOr1Aongg7TF3U2L/aV/9gl9Lg=;
        b=DTvqACqQd7px3I6evrS4Ykl+pdfVDlshPmowJQLbSMbolfnoST9df+KUlwTEjpHLzs
         oKYmlK+vFcr17qq8x4DVURlSy3/luynFNnKrJJr5yvXiawmZ90UtjgILGoZWC5waUt1G
         XwO6KWWXqxNq5S48Tvhz4YGaEhJA0si7AGY/C16muMM0EZdyp/HPTz8CjOu5x7pXCzKP
         /0abs60ryMAEQS3bSbmJaQqVOMSlH1BpdsXNE0raWUQhC+tfvHwUqxzl5gr4PsZm4Vdq
         Qfnqw609aWekkEaYCx6V5O1mZ/oI6yOyjmPqXeV33oEnOcejKlVyqsQgVwDPHh9/VBFN
         5CCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sdXSOJO2;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=ccNRXHzWZIp/+Z2jfdOr1Aongg7TF3U2L/aV/9gl9Lg=;
        b=Ju6B6ys7TBdvEc0Hws5v2JVYUApw+lmrWdWlSQMjX1/+1wzs8ju8wrshIkGang9HC3
         UISfyncYw7z7/woHqXfCgnMU3jy+gxIYDPdCGFE00Xwoh1TClbcnG5KLn/sF3hlJmhOr
         gfyf/biY37Dp9nKCBt2IYVqGhkdG+X6H79FQiS0NDTjZcoHzJ7Q7gdvUYh6nBp1WhdIH
         lbGv3NLKA95XPiygK9Eb+AaciEMQv61EEz/kmXh/AJtaATa8aUeP6ZUmdc/m28DHsZdM
         fJJFT5qQ0xm0RJJaF865aTr9K+40MDmWR0gz/+8/gHt3hjHadkI8SxgAsV2hUAX5NX6P
         fdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ccNRXHzWZIp/+Z2jfdOr1Aongg7TF3U2L/aV/9gl9Lg=;
        b=cyITnA3bkzPTuSeHcaBT7ifRIsAYIaxUEaO7cNq4NDgSZ8AbskUQkeHNwd4PBQlyf4
         rHo0vhEQmalvPB74lTe0Yus+q4keAvbkofOyWDT7K+WO4KizwkLl5xqcs4QKCDiBrxCV
         Lfv0Jm8pNkxcZBd6L+1Q2HAsfo+E3kLNlDTGWDhrQvSo3DvmDhDFr801bu12PROodi6L
         guA0nPzlynDXwJnZkBmRC7IuVoVY6cAmAhhp8dH7qbEdMZZ3tNTjtA89wW2ybvQ/gQ52
         waRw/ngmq4M1hCm14hw6Gd7xPv4fA5PhQU4+J1gytOPdgVk1a34hC51JAemxNsYrh8dA
         rs0w==
X-Gm-Message-State: AOAM532M8UOrhGaR3HArAq0mXdW+Q/v1/UebCOSy81m7OIV2PAvvdBAW
	THzvHsjzoAF5SEoqAGvxk38=
X-Google-Smtp-Source: ABdhPJzbvMgTLXKu9IN0YOW62JAVmMCF09hWUobUh1JGIbQAz+K9uRWfts7zBypBKRwf1/sI21l2cw==
X-Received: by 2002:a17:902:f78d:b0:14d:522e:deb3 with SMTP id q13-20020a170902f78d00b0014d522edeb3mr38313210pln.173.1646360190148;
        Thu, 03 Mar 2022 18:16:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:a442:0:b0:373:e8f3:b75 with SMTP id c2-20020a63a442000000b00373e8f30b75ls1763680pgp.11.gmail;
 Thu, 03 Mar 2022 18:16:29 -0800 (PST)
X-Received: by 2002:aa7:88c2:0:b0:4f3:fca9:6422 with SMTP id k2-20020aa788c2000000b004f3fca96422mr27377320pff.5.1646360189210;
        Thu, 03 Mar 2022 18:16:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646360189; cv=none;
        d=google.com; s=arc-20160816;
        b=vs85MQedyHGssixSsT3xWAFHNIEet3UWFzPIoVbNZTA2UpiaC5sC/rYGGHPBx0JQWm
         uVIaWYhq9eYyKmTitiBdNHhG05OANd4hvMPfIbEYbxJMPZt9rI+kVDVXqTMoiJ7LeHpc
         ZfL1i8wWo9zRvt3R4pT0GG7zR+a5/iEX2JLb3DkcyePQbkOLv9uVDzrWh9SkwunGK1kq
         Jj4cLHdmvadXogGU3flLkR71JRkh9Gzxsq0OGWm86Hg65ybcGBLqL+orntpjHEnja/ii
         vs8JM1GDfbNLvkGKheRdu7zefOuK2fqhUNJIPhGls3CFXoNjNjjMKmfexq30Mt6sm3SM
         MseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=y7CdhvntHhRXAjtxf9Kgujd1xLryyFVxkpW6BFS06XU=;
        b=nVFBV4Fhk0mNN1lL50VzMshaiczb/Ls7NmWrZgJroXqVZCrTU/N8HOOmoamTnlN+WI
         uj0U6KGzuz258UNC2jEkD+r2LbpEtNg5Ins/6Bo5ao5CTp7tqO5a65wdRqstemEUy4R7
         2BOwl8AXC9g0ZqXWrYpcWCainZ4XzaJjsftkbIc+QLhugHmQYgk950sXEUbuWWl0YOQA
         qvJJYpxmm7vHKEjmwN9K/L5+dP9YURszu0htMtgPxV7DZy+XYXjfkTh48NkVXg7k8Eop
         TWU+kiClXsuHRsWGQYwlUIoUk0j6EDOSRgD7EoS+dq95eFENmuhnYaAGTrKf8xYhPFlE
         o6lA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sdXSOJO2;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id o64-20020a17090a0a4600b001bf0a82f880si38464pjo.2.2022.03.03.18.16.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 18:16:29 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2242GSV1029549
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:28 -0600
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2242GSII130643
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:28 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 3
 Mar 2022 20:16:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 3 Mar 2022 20:16:28 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2242GOif018363;
	Thu, 3 Mar 2022 20:16:26 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH 0/4] configs: k3-am654-idk eMMC and IVSHMEM changes
Date: Thu, 3 Mar 2022 18:16:11 -0800
Message-ID: <20220304021615.2862-1-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=sdXSOJO2;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

This patchset enables eMMC access from the linux demo inmate for the
k3-am654-idk platform, and additionally adds a ivshmem demo interface.

Matt Ranostay (4):
  configs: arm64: add eMMC support to k3-am654-idk linux demo inmate
  configs: arm64: change k3-am653-idk memory window
  configs: arm64: increase PCI memory window for k3-am654-idk inmate
  configs: arm64: add ivshmem demo to km-am654-idk platform

 configs/arm64/dts/inmate-k3-am654-idk.dts | 38 ++++++++++++-
 configs/arm64/k3-am654-idk-linux-demo.c   | 69 +++++++++++++++++++++--
 configs/arm64/k3-am654-idk.c              | 51 +++++++++++++++--
 3 files changed, 145 insertions(+), 13 deletions(-)

-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220304021615.2862-1-mranostay%40ti.com.
